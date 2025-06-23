
source(findFile('scripts', 'antares-setup.py'))


def main():
    Setup( {'IVIApp': 'launch'} )
    
    test.log("Verify each tab screen is correctly displayed")
    
    Ivi.select_tab("Vehicle")
    verify_image('Default_Vehicle_Tab', Ivi.objects.appWindow())
    
    Ivi.select_tab("Media")
    verify_image('Default_Media_Tab', Ivi.objects.appWindow())
    
    Ivi.select_tab("Navigation")
    verify_image('Default_Navigation_Tab', Ivi.objects.routePerformanceComponent())
    
    