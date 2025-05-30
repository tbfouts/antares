# -*- coding: utf-8 -*-
import names
import databackend

def main():
    attachToApplication("samsung_tab")
    datainterface = databackend.ws()
    datainterface.send("adasEnabled", True)
    snooze(1)

    test.compare(str(waitForObject(names.antares_Cluster_driveMode_ui).txtModeText), "ADAS")
    test.verify(waitForObject(names.antares_Cluster_adasComp_ui).visible) 
       
    datainterface.send("adasEnabled", False)
    snooze(2)
    
    test.compare(str(waitForObject(names.antares_Cluster_driveMode_ui).txtModeText), "SPORT")
    test.verify(waitForObject(names.antares_Cluster_adasComp_ui).visible) 

def waitUntilObjectReady( obj ):
    highlightObject(obj, 1000)
