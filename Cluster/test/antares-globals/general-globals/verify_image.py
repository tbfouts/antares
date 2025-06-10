
import os
import xml.etree.ElementTree as eTree
import subprocess
from shutil import rmtree


SQUISH_INSTALL_DIR = os.path.join(os.getenv("SQUISH_PREFIX"), "bin")
CONVERT_VP = os.path.join( SQUISH_INSTALL_DIR, "convertvp" )
VP_DIR = os.path.join(squishinfo.testCase, "verificationPoints")
TEMP_DIR = os.path.join(squishinfo.testCase, "temporary_files")

def verify_image(vpName:str=None, objectOrRealName=None, 
                 pixel_error_threshold:float=0.0, delay:float=0):
    
    global VP_DIR
    
    if delay >= 0 and delay < 1000:
        snooze(delay)
    else:
        test.warning("Please use a delay between 0-1000 (inclusive)")
    
    """
    # Check if vp with existing name already exists
    #### If not, collect a screenshot and report a failure.
    #### If yes, jump to perform pixel-by-pixel compare
    """
    vpPath = os.path.join(VP_DIR ,vpName)
    
    if isinstance(objectOrRealName, dict):
        objectOrRealName = waitForObjectExists(objectOrRealName)
    
    remove_temporary_dir()  # In case it already exists
    make_temporary_dir()
    
    if not os.path.exists(vpPath):
        #If first time VP collection, capture the VP but inform that it isn't a real test result yet.
        test.warning(f"First time creating {vpName} verification point! Reference Image Stored!")
        img = generate_screenshot_vp(objectOrRealName, vpName)
        test.attachImage(img, f"New VP Image for {objectMap.realName(objectOrRealName)}")
        remove_temporary_dir()
        return
    
    #Perform pixel-to-pixel compare
    evaluate_vp(vpName, objectOrRealName, vpPath, pixel_error_threshold)
    
    remove_temporary_dir()
 
def generate_screenshot_vp(objectOrRealName, vpName):
    global TEMP_DIR
    global VP_DIR
    
    vp_path = os.path.join(VP_DIR, vpName)
    tmp_img_path = os.path.join(TEMP_DIR, "screenshot.png")
    
    if not os.path.exists(VP_DIR):
        # ConvertVP will not make vp folder if its not already there. 
        os.makedirs(VP_DIR)  
        
    # Capture img of object and send to screenshot vp
    img = object.grabScreenshot(objectOrRealName)
    img.save(tmp_img_path)
    args = CONVERT_VP + f''' --tovp {vp_path} {tmp_img_path} {objectMap.symbolicName(objectOrRealName)}'''
    _ = subprocess.call(args, shell=True)
    
    assert os.path.exists(vp_path), "Screenshot VP not generated!"
    update_xml_syntax(vp_path)  # using convertvp creates the xml using an older syntax. It must be updated manually, unfortunately
    
    return img

def make_temporary_dir():
    global TEMP_DIR
    if not os.path.exists(TEMP_DIR):
        os.mkdir(TEMP_DIR)

def remove_temporary_dir():
    if os.path.exists(TEMP_DIR):
        rmtree(TEMP_DIR)

def evaluate_vp(vpName, objectOrRealName, vpPath, pixel_error_threshold):
    """
    # fixateResultContext(2) makes it such that the pass/fail "Test Result" is linked to the 
    # verify_image() calling line in the main test script, instead of buried in this file.
    """
    
    if pixel_error_threshold > 0:
        apply_pixel_error_threshold(vpPath, pixel_error_threshold)
    
    test.fixateResultContext(2)  
    test.vpWithObject(vpName, objectOrRealName)
    test.restoreResultContext()

    if pixel_error_threshold > 0:
        revert_pixel_error_threshold(vpPath)

def update_xml_syntax(vpPath):
    xml_file = f"{vpPath}"
    tree = eTree.parse(xml_file)
    root = tree.getroot()
    
    root.set("version", "4")
    
    # Ensure <Description> element exists
    if root.find("Description") is None:
        description_elem = eTree.Element("Description")
        root.insert(0, description_elem)
        description_elem.tail = "\n"
        
    # Find the <Verification> element
    verification_elem = root.find("Verification")
    if verification_elem is None:
        print("No <Verification> section found to modify.")
        return

    # Modify the <Verification> element attributes as needed
    verification_elem.set("options", "12")
    
    # Ensure <Mask> element exists within <Verification>
    if verification_elem.find("Mask") is None:
        mask_elem = eTree.Element("Mask")
        verification_elem.append(mask_elem)
        mask_elem.tail = "\n"
        
    verification_elem.tail = "\n"
    
    # Save the modified XML back to the file
    tree.write(xml_file, encoding='UTF-8', xml_declaration=True)

def apply_pixel_error_threshold(vpPath, pixel_error_threshold):
    xml_file = f"{vpPath}"
    tree = eTree.parse(xml_file)
    root = tree.getroot()

    # Find or create the <Algorithm> element with name "simplecompare"
    verification_elem = root.find(".//Verification")
    algorithm_elem = verification_elem.find(".//Algorithm[@name='simplecompare']")

    if algorithm_elem is None:
        # If the <Algorithm> element doesn't exist, create it
        algorithm_elem = eTree.SubElement(verification_elem, "Algorithm", {
            "name": "simplecompare",
            "description": "Simple comparison (pixel by pixel)"
        })
        # Create the <Parameter> elements inside the new <Algorithm> element
        threshold_elem = eTree.SubElement(algorithm_elem, "Parameter", {
            "name": "threshold",
            "description": "Threshold"
        })
        threshold_elem.text = str(pixel_error_threshold)

        tolerance_elem = eTree.SubElement(algorithm_elem, "Parameter", {
            "name": "tolerance",
            "description": "Tolerance"
        })
        tolerance_elem.text = "0"  # Default tolerance

    else:
        # If the <Algorithm> element exists, find the <Parameter> element for threshold
        threshold_elem = algorithm_elem.find(".//Parameter[@name='threshold']")

        if threshold_elem is None:
            # If the <Parameter> element doesn't exist, create it
            threshold_elem = eTree.SubElement(algorithm_elem, "Parameter", {
                "name": "threshold",
                "description": "Threshold"
            })
        
        # Check the current threshold value and update if needed
        current_threshold = float(threshold_elem.text) if threshold_elem.text else 0.0
        if pixel_error_threshold != 0.0 and current_threshold != pixel_error_threshold:
            threshold_elem.text = str(pixel_error_threshold)

    # Save the modified XML back to the file
    tree.write(xml_file, encoding='UTF-8', xml_declaration=True)
    print(f"Threshold updated to {pixel_error_threshold} in '{xml_file}'.")

def revert_pixel_error_threshold(vpPath):
    # Load and parse the XML file
    xml_file = f"{vpPath}"  # Assuming the file is named based on vpName
    tree = eTree.parse(xml_file)
    root = tree.getroot()

    # Find the <Verification> element and its child <Algorithm> element with name "simplecompare"
    verification_elem = root.find(".//Verification")
    algorithm_elem = verification_elem.find(".//Algorithm[@name='simplecompare']")

    # If the <Algorithm> element exists, remove it
    if algorithm_elem is not None:
        verification_elem.remove(algorithm_elem)

        # Save the modified XML back to the file
        tree.write(xml_file, encoding='UTF-8', xml_declaration=True)

