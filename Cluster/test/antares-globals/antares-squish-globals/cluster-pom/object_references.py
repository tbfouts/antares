    

# Top-level object
antares_Cluster_QQuickWindowQmlImpl = {"title": "Antares Cluster", "type": "QQuickWindowQmlImpl", "unnamed": 1, "visible": True}


class Cluster_Objects():

    def o_appWindow():
        return waitForObject(antares_Cluster_QQuickWindowQmlImpl)
    
    def o_mainScreen():
        return waitForObject( {"container": antares_Cluster_QQuickWindowQmlImpl, "id": "mainScreen", "type": "Screen01.ui", "unnamed": 1, "visible": True} )
    
    def o_clusterLayout():
        return waitforObject( {"container": antares_Cluster_QQuickWindowQmlImpl, "id": "gLOlayout", "type": "ClusterLayout.ui", "unnamed": 1, "visible": True} )
    
    def o_vehicleModel():
        return waitForObjectExists( {"container": antares_Cluster_QQuickWindowQmlImpl, "id": "view3D", "type": "3DViewport", "visible": True} )
    
    def o_musicPlayerComponent():
        """ 
        Properties
         - txtArtistText
         - txtTrackText
        """ 
        return waitForObject( {"container": antares_Cluster_QQuickWindowQmlImpl, "id": "musicPlayer_Comp", "type": "MusicPlayer_Comp.ui", "unnamed": 1, "visible": True} )
    
    def o_fuelGaugeComponent():
        return waitForObject( {"container": antares_Cluster_QQuickWindowQmlImpl, "id": "fuelGauge_Comp", "type": "FuelGauge_Comp.ui", "unnamed": 1, "visible": True} )
    
    def o_fuelGaugeFillBar():
        # `status` property gets fuel level, [0-1]
        return find_recursively( Cluster_Objects.o_fuelGaugeComponent(), {"id": "vecFuelFillingBar"})
    
    def o_gearComponent():
        # property: state: str (e.g. 'Park')
        return waitForObject( {"container": antares_Cluster_QQuickWindowQmlImpl, "id": "gearComp", "type": "GearComp.ui", "unnamed": 1, "visible": True} )
    
    def o_batteryGaugeComponent():
        return waitForObject( {"container": antares_Cluster_QQuickWindowQmlImpl, "id": "batteryGauge_Comp", "type": "BatteryGauge_Comp.ui", "unnamed": 1, "visible": True} )
    
    def o_batteryGaugeFillBar():
        # `status` property gets fuel level, [0-1]
        return find_recursively( Cluster_Objects.o_batteryGaugeComponent(), {"id": "barFillingBattery"})
    
    def o_speedLimitMPH():
        return waitForObject( {"container": antares_Cluster_QQuickWindowQmlImpl, "id": "speedLimit_MPH", "type": "Rectangle", "unnamed": 1} )
        
    def o_speedLimitKPH():
        return waitForObject( {"container": antares_Cluster_QQuickWindowQmlImpl, "id": "speedLimit_KPH", "type": "Rectangle", "unnamed": 1} )
        
    def o_speedometerComponent():
        # [prop] txtMPHvalueFRText == MPH value
        return waitForObject( {"container": antares_Cluster_QQuickWindowQmlImpl, "id": "speedometer_Value", "type": "Speedometer_Value.ui", "unnamed": 1, "visible": True} )
        
    def o_rpmGaugeComponent():
        #[prop] txtRPMValueFRText == RPM value
        return waitForObject( {"container": antares_Cluster_QQuickWindowQmlImpl, "id": "rpmGauge_Value", "type": "RpmGauge_Value.ui", "unnamed": 1, "visible": True} )
    
    def o_driveModeComponent():
        return waitForObject( {"container": antares_Cluster_QQuickWindowQmlImpl, "id": "driveMode", "type": "DriveMode.ui", "unnamed": 1, "visible": True} )
    
    def o_tractionComponent():
        return waitForObject( {"container": antares_Cluster_QQuickWindowQmlImpl, "id": "tractionComp", "type": "TractionComp.ui", "unnamed": 1, "visible": True} )
    
    def o_qsrWarningsComponent():
        # return waitForObject( {"container": antares_Cluster_QQuickWindowQmlImpl, "id": "qsrWarnings", "type": "Loader", "unnamed": 1, "visible": True} )
        return find_recursively( Cluster_Objects.o_clusterLayout(), {"id": "qsrWarnings"})
    
    def o_clock():
        # return waitForObject( {"container": antares_Cluster_QQuickWindowQmlImpl, "id": "clock", "type": "Clock.ui", "unnamed": 1, "visible": True} )
        return find_recursively( Cluster_Objects.o_clusterLayout(), {"id": "clock"})
        
    def o_adasComponent():
        # return waitForObject( {"container": antares_Cluster_QQuickWindowQmlImpl, "id": "adasComp", "type": "AdasComp.ui", "unnamed": 1, "visible": False} )
        return find_recursively( Cluster_Objects.o_clusterLayout(), {"id": "adasComp"}, max_search_depth=2)
    
    def o_qsrTurnSignals():
        # return waitForObject( {"container": antares_Cluster_QQuickWindowQmlImpl, "id": "qsrTurnSignals", "type": "Loader", "unnamed": 1, "visible": True} )
        return find_recursively( Cluster_Objects.o_clusterLayout(), {"id": "qsrTurnSignals"}, 2)
    


