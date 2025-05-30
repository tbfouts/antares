# -*- coding: utf-8 -*-

import names
import databackend

def main():
    attachToApplication("samsung_tab")
    
    datainterface = databackend.ws()
    datainterface.send_test_name("Themes")
    
    # Theme to expected shadow color mapping
    theme_colors = {
        "luna": "#395b85",
        "stardust": "#8e4362", 
        "pixel": "#fd825f",
        "electric": "#4d5674",
        "crystal": "#7cdae0",
        "sonic": "#89bfbf",
        "ethereal": "#db752c",
        "mind": "#eea153",
        "gravity": "#79aa8d",
        "zen": "#e78f54",
        "ultraviolet": "#fc715a",
        "velvet": "#485557"
    }
    
    # Test each theme for both speedgauge and rpmgauge shadow effects
    for theme_name, expected_color in theme_colors.items():
        datainterface.send("theme", theme_name)
        snooze(.5)
        
        # Test speedgauge shadow effect color
        speed_shadow_color = str(waitForObject(names.antares_Cluster_speedGauge_ShadowEffect_ui).designDropShadowColor.name)
        test.compare(speed_shadow_color, expected_color, f"Speed gauge shadow color for {theme_name} theme")
        
        # Test rpmgauge shadow effect color  
        rpm_shadow_color = str(waitForObject(names.antares_Cluster_rpmGauge_ShadowEffect_ui).designDropShadowColor.name)
        test.compare(rpm_shadow_color, expected_color, f"RPM gauge shadow color for {theme_name} theme")
    
    
def waitUntilObjectReady( obj ):
    highlightObject(obj, 1000)
    snooze(1)
    
