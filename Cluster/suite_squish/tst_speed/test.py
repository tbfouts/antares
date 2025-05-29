# -*- coding: utf-8 -*-

import names
import databackend

def main():
    startApplication("ClusterApp")
    
    datainterface = databackend.ws()
    datainterface.send("speed", 100)

    test.compare(str(waitForObject(names.antares_Cluster_speedLimit_MPH_Rectangle).border.color.name), "#ff0000")
    test.compare(str(waitForObject(names.antares_Cluster_speedometer_Value_ui).txtMPHvalueFRText), "100")
        
def waitUntilObjectReady( obj ):
    highlightObject(obj)
    snooze(1)
    
def waitUntilObjectItemReady( obj ):
    highlightObject(obj)
    snooze(1)


