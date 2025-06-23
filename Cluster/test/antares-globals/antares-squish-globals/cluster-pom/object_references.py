    

# Top-level object
antares_Cluster_QQuickWindowQmlImpl = {"title": "Antares Cluster", "type": "QQuickWindowQmlImpl", "unnamed": 1, "visible": True}


class Cluster_Objects():

    @staticmethod
    def appWindow():
        return waitForObject(antares_Cluster_QQuickWindowQmlImpl)
    
    @staticmethod
    def mainScreen():
        return waitForObject( {"container": antares_Cluster_QQuickWindowQmlImpl, "id": "mainScreen", "type": "Screen01.ui", "unnamed": 1, "visible": True} )
    
    @staticmethod
    def clusterLayout():
        return waitforObject( {"container": antares_Cluster_QQuickWindowQmlImpl, "id": "gLOlayout", "type": "ClusterLayout.ui", "unnamed": 1, "visible": True} )
    
    @staticmethod
    def vehicleModel():
        return waitForObjectExists( {"container": antares_Cluster_QQuickWindowQmlImpl, "id": "view3D", "type": "3DViewport", "visible": True} )
    
    @staticmethod
    def musicPlayerComponent():
        """ 
        Properties
         - txtArtistText
         - txtTrackText
        """ 
        return waitForObject( {"container": antares_Cluster_QQuickWindowQmlImpl, "id": "musicPlayer_Comp", "type": "MusicPlayer_Comp.ui", "unnamed": 1, "visible": True} )
    
    @staticmethod
    def fuelGaugeComponent():
        return waitForObject( {"container": antares_Cluster_QQuickWindowQmlImpl, "id": "fuelGauge_Comp", "type": "FuelGauge_Comp.ui", "unnamed": 1, "visible": True} )
    
    @staticmethod
    def fuelGaugeFillBar():
        # `status` property gets fuel level, [0-1]
        return find_recursively( Cluster_Objects.o_fuelGaugeComponent(), {"id": "vecFuelFillingBar"})
    
    @staticmethod
    def gearComponent():
        # property: state: str (e.g. 'Park')
        return waitForObject( {"container": antares_Cluster_QQuickWindowQmlImpl, "id": "gearComp", "type": "GearComp.ui", "unnamed": 1, "visible": True} )
    
    @staticmethod
    def batteryGaugeComponent():
        return waitForObject( {"container": antares_Cluster_QQuickWindowQmlImpl, "id": "batteryGauge_Comp", "type": "BatteryGauge_Comp.ui", "unnamed": 1, "visible": True} )
    
    @staticmethod
    def batteryGaugeFillBar():
        # `status` property gets fuel level, [0-1]
        return find_recursively( Cluster_Objects.o_batteryGaugeComponent(), {"id": "barFillingBattery"})
    
    @staticmethod
    def speedLimitMPH():
        return waitForObject( {"container": antares_Cluster_QQuickWindowQmlImpl, "id": "speedLimit_MPH", "type": "Rectangle", "unnamed": 1} )
    
    @staticmethod    
    def speedLimitKPH():
        return waitForObject( {"container": antares_Cluster_QQuickWindowQmlImpl, "id": "speedLimit_KPH", "type": "Rectangle", "unnamed": 1} )
    
    @staticmethod    
    def speedometerComponent():
        # [prop] txtMPHvalueFRText == MPH value
        return waitForObject( {"container": antares_Cluster_QQuickWindowQmlImpl, "id": "speedometer_Value", "type": "Speedometer_Value.ui", "unnamed": 1, "visible": True} )
        
    @staticmethod
    def rpmGaugeComponent():
        #[prop] txtRPMValueFRText == RPM value
        return waitForObject( {"container": antares_Cluster_QQuickWindowQmlImpl, "id": "rpmGauge_Value", "type": "RpmGauge_Value.ui", "unnamed": 1, "visible": True} )
    
    @staticmethod
    def driveModeComponent():
        return waitForObject( {"container": antares_Cluster_QQuickWindowQmlImpl, "id": "driveMode", "type": "DriveMode.ui", "unnamed": 1, "visible": True} )
    
    @staticmethod
    def tractionComponent():
        return waitForObject( {"container": antares_Cluster_QQuickWindowQmlImpl, "id": "tractionComp", "type": "TractionComp.ui", "unnamed": 1, "visible": True} )
    
    @staticmethod
    def qsrWarningsComponent():
        # return waitForObject( {"container": antares_Cluster_QQuickWindowQmlImpl, "id": "qsrWarnings", "type": "Loader", "unnamed": 1, "visible": True} )
        return find_recursively( Cluster_Objects.o_clusterLayout(), {"id": "qsrWarnings"})
    
    @staticmethod
    def clock():
        # return waitForObject( {"container": antares_Cluster_QQuickWindowQmlImpl, "id": "clock", "type": "Clock.ui", "unnamed": 1, "visible": True} )
        return find_recursively( Cluster_Objects.o_clusterLayout(), {"id": "clock"})
        
    @staticmethod
    def adasComponent():
        # return waitForObject( {"container": antares_Cluster_QQuickWindowQmlImpl, "id": "adasComp", "type": "AdasComp.ui", "unnamed": 1, "visible": False} )
        return find_recursively( Cluster_Objects.o_clusterLayout(), {"id": "adasComp"}, max_search_depth=2)
    
    @staticmethod
    def qsrTurnSignals():
        # return waitForObject( {"container": antares_Cluster_QQuickWindowQmlImpl, "id": "qsrTurnSignals", "type": "Loader", "unnamed": 1, "visible": True} )
        return find_recursively( Cluster_Objects.o_clusterLayout(), {"id": "qsrTurnSignals"}, 2)
    


