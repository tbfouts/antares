
source(findFile('scripts', 'antares-setup.py'))


def main():
    """ NOTE: This test requires both the Antares IVI & Cluster apps to be mapped to squishserver! """
    
    Setup( {'IVIApp': 'launch', 'ClusterApp': 'launch'} )
    
    setApplicationContext(applicationContext('IVIApp'))
    Ivi.select_tab("Vehicle")
    
    test.startSection("Verify LIGHTS OFF behavior on IVI and Cluster")
    test.log("Set Lights Off")
    Ivi.set_model_setting('lights', 'off')
    
    test.log("Checking Lights are OFF in IVI")
    # Object-based
    test.compare( Ivi.get_model_setting_state('lights'), False)
    test.compare( Ivi.objects.carModel().lightsVisible, False )
    # Image-based
    verify_image( "Ivi_Lights-Off", Ivi.objects.carModel() )
    
    test.log("Checking Lights are OFF in Cluster")
    setApplicationContext(applicationContext('ClusterApp'))
    # Object-based
    #Cluster 3D model doesn't have the same exposed properties
    #Image-based
    verify_image( "Cluster_Lights_Off", Cluster.objects.vehicleModel() )
    test.endSection()
    
    
    test.startSection("Verify LIGHTS ON behavior in IVI and Cluster")
    setApplicationContext(applicationContext('IVIApp'))
    test.log("Set Lights On")
    Ivi.set_model_setting('lights', 'on')
    
    test.log("Checking Lights are ON in IVI")
    # Object-based
    test.compare( Ivi.get_model_setting_state('lights'), True)
    test.compare( Ivi.objects.carModel().lights, True )
    # Image-based
    verify_image( "Ivi_Lights-On", Ivi.objects.carModel() )
    
    test.log("Checking Lights are ON in Cluster")
    setApplicationContext(applicationContext('ClusterApp'))
    # Object-based
    #Cluster 3D model doesn't have the same exposed properties
    #Image-based
    verify_image( "Cluster_Lights_On", Cluster.objects.vehicleModel() )
    test.endSection()
    
    