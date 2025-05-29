# -*- coding: utf-8 -*-
import names
import databackend

def main():
    startApplication("ClusterApp")
    datainterface = databackend.ws()
    datainterface.send("units", "Metric")


    test.compare(str(waitForObject(names.antares_Cluster_KPH_Text).text), "KPH")
    test.verify(str(waitForObject(names.antares_Cluster_13_3_km_Text).text).find("km"))
    test.verify(str(waitForObject(names.antares_Cluster_15_C_Text).text).find("° C"))
    
    datainterface.send("units", "Imperial")
    
def waitUntilObjectReady( obj ):
    highlightObject(obj)
    snooze(1)
    
def waitUntilObjectItemReady( obj ):
    snooze(1)