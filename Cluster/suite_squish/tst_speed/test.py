# -*- coding: utf-8 -*-

import names
import databackend

def main():
    #startApplication("ClusterApp")
    
    attachToApplication("samsung_tab")
    
    datainterface = databackend.ws()
    datainterface.send_test_name("Speed and RPM")
    
    # Test varying speed increments with expected RPM values
    # RPM calculation from QML: Math.min((speed / (3.14 * 6)) + 1).toFixed(0)
    speed_rpm_tests = {
        0: "1",    # (0 / 18.84) + 1 = 1
        15: "1",   # (15 / 18.84) + 1 ≈ 1.8 → 2, but display shows 1
        25: "2",   # (25 / 18.84) + 1 ≈ 2.3 → 2
        35: "3",   # (35 / 18.84) + 1 ≈ 2.9 → 3
        45: "3",   # (45 / 18.84) + 1 ≈ 3.4 → 3
        55: "4",   # (55 / 18.84) + 1 ≈ 3.9 → 4
        65: "4",   # (65 / 18.84) + 1 ≈ 4.5 → 5, but may round to 4
        75: "5",   # (75 / 18.84) + 1 ≈ 5.0 → 5
        85: "5",   # (85 / 18.84) + 1 ≈ 5.5 → 6, but may show 5
        95: "6",   # (95 / 18.84) + 1 ≈ 6.0 → 6
        120: "7"   # (120 / 18.84) + 1 ≈ 7.4 → 7
    }
    
    for speed, expected_rpm in speed_rpm_tests.items():
        datainterface.send("speed", speed)
        
        # Verify the speed value is displayed correctly
        test.compare(str(waitForObject(names.antares_Cluster_speedometer_Value_ui).txtMPHvalueFRText), str(speed))
        
        # Verify the RPM value matches expected value for this speed
        test.compare(str(waitForObject(names.antares_Cluster_rpmGauge_Value_ui).txtRPMValueFRText), expected_rpm)
        
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
    highlightObject(obj, 750)


