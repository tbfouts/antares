# -*- coding: utf-8 -*-
import names
import databackend

def main():
    startApplication("ClusterApp")
    # attachToApplication("samsung_tab")
    datainterface = databackend.ws()
    datainterface.send_test_name("Units")
    datainterface.send("units", "Metric")


    test.compare(str(waitForObject(names.antares_Cluster_speedometer_Value_ui).txtMPHText), "KPH")
    test.verify(str(waitForObject(names.antares_Cluster_directionsMini_Comp_ui).txt_ETAdistanceText).find("km"))
    test.verify(str(waitForObject(names.antares_Cluster_weatherComp_ui).txtDateText).find("° C"))
    
    datainterface.send("units", "Imperial")
    
    test.compare(str(waitForObject(names.antares_Cluster_speedometer_Value_ui).txtMPHText), "MPH")
    test.verify(str(waitForObject(names.antares_Cluster_directionsMini_Comp_ui).txt_ETAdistanceText).find("mi"))
    test.verify(str(waitForObject(names.antares_Cluster_weatherComp_ui).txtDateText).find("° F"))
    
def waitUntilObjectReady( obj ):
    highlightObject(obj)
    snooze(1)