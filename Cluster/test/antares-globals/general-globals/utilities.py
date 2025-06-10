

def log_object_screenshot(obj_reference, msg:str=None):
    img = object.grabScreenshot(obj_reference)
    test.attachImage(img, msg)