# -*- coding: utf-8 -*-

import names
import databackend

def main():
    attachToApplication("samsung_tab")
    
    datainterface = databackend.ws()
    datainterface.send("theme", "luna")
    snooze(.5)
    test.compare(str(waitForObject(names.antares_Cluster_speedGauge_ShadowEffect_ui).designDropShadowColor.name), "#395b85")
    test.compare(str(waitForObject(names.antares_Cluster_rpmGauge_ShadowEffect_ui).designDropShadowColor.name), "#395b85")
    
    datainterface.send("theme", "stardust")
    snooze(.5)
    test.compare(str(waitForObject(names.antares_Cluster_speedGauge_ShadowEffect_ui).designDropShadowColor.name), "#8e4362")
    
    datainterface.send("theme", "pixel")
    snooze(.5)
    test.compare(str(waitForObject(names.antares_Cluster_speedGauge_ShadowEffect_ui).designDropShadowColor.name), "#fd825f")
    
    datainterface.send("theme", "electric")
    snooze(.5)
    test.compare(str(waitForObject(names.antares_Cluster_speedGauge_ShadowEffect_ui).designDropShadowColor.name), "#4d5674")
        
    datainterface.send("theme", "crystal")
    snooze(.5)
    test.compare(str(waitForObject(names.antares_Cluster_speedGauge_ShadowEffect_ui).designDropShadowColor.name), "#7cdae0")
        
    datainterface.send("theme", "sonic")
    snooze(.5)
    test.compare(str(waitForObject(names.antares_Cluster_speedGauge_ShadowEffect_ui).designDropShadowColor.name), "#89bfbf")
    
    datainterface.send("theme", "ethereal")
    snooze(.5)
    test.compare(str(waitForObject(names.antares_Cluster_speedGauge_ShadowEffect_ui).designDropShadowColor.name), "#db752c")
    
    datainterface.send("theme", "mind")
    snooze(.5)
    test.compare(str(waitForObject(names.antares_Cluster_speedGauge_ShadowEffect_ui).designDropShadowColor.name), "#eea153")
        
    datainterface.send("theme", "gravity")
    snooze(.5)
    test.compare(str(waitForObject(names.antares_Cluster_speedGauge_ShadowEffect_ui).designDropShadowColor.name), "#79aa8d")
        
    datainterface.send("theme", "zen")
    snooze(.5)
    test.compare(str(waitForObject(names.antares_Cluster_speedGauge_ShadowEffect_ui).designDropShadowColor.name), "#e78f54")
    
    datainterface.send("theme", "ultraviolet")
    snooze(.5)
    test.compare(str(waitForObject(names.antares_Cluster_speedGauge_ShadowEffect_ui).designDropShadowColor.name), "#fc715a")
        
    datainterface.send("theme", "velvet")
    snooze(.5)
    test.compare(str(waitForObject(names.antares_Cluster_speedGauge_ShadowEffect_ui).designDropShadowColor.name), "#485557")
    
    
def waitUntilObjectReady( obj ):
    highlightObject(obj)
    snooze(1)
    
def waitUntilObjectItemReady( obj ):
    highlightObject(obj)
    snooze(1)
