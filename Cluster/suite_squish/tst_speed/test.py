# -*- coding: utf-8 -*-

import names
import databackend

def main():
    #startApplication("ClusterApp")
    
    attachToApplication("samsung_tab")
    
    datainterface = databackend.ws()
    
    # Test speeds from 50 to 60 mph
    for speed in range(50, 61):
        datainterface.send("speed", speed)
        
        # Verify the speed value is displayed correctly
        test.compare(str(waitForObject(names.antares_Cluster_speedometer_Value_ui).txtMPHvalueFRText), str(speed))
        
        # Check speed limit border - border color is always red but width changes
        speed_limit_obj = waitForObject(names.antares_Cluster_speedLimit_MPH_Rectangle)
        border_width = speed_limit_obj.border.width
        
        if speed > 55:
            # Speed is above limit - should have visible red border (width = 3)
            test.compare(border_width, 3, f"Speed {speed} mph should show red border")
        else:
            # Speed is at or below limit - should have no border (width = 0)
            test.compare(border_width, 0, f"Speed {speed} mph should not show border")
            
    datainterface.send("speed", 0)
        
def waitUntilObjectReady( obj ):
    highlightObject(obj, 500)
    
def waitUntilObjectItemReady( obj ):
    highlightObject(obj, 500)


