
source(findFile('scripts', 'antares-setup.py'))


def main():
    Setup( {'IVIApp': 'launch'} )
    
    test.log("Verify the default screen upon launch is the Media Tab")    
    
    test.verify(Ivi.objects.tabElement("Media").checked and Ivi.objects.mediaView().focus, 
                "Media Tab selected and visible upon startup")
    
    log_object_screenshot(Ivi.objects.appWindow(), "Default Tab after startup")
    
    Ivi.select_tab("Vehicle")
    
    
    