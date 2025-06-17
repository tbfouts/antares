
source(findFile('scripts', 'antares-setup.py'))


def main():
    Setup( {'IVIApp': 'launch'} )
    
    test.log("Verify the default screen upon launch is the Media Tab")    
    
    test.verify(Ivi.o_tabElement("Media").checked and Ivi.o_mediaView().focus, 
                "Media Tab selected and visible upon startup")
    
    log_object_screenshot(Ivi.o_iviAppWindow(), "Default Tab after startup")
    
    
    