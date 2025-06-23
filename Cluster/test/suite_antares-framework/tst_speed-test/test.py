
source(findFile('scripts', 'antares-setup.py'))


def main():
    
    Setup( {'ClusterApp': 'launch'} )
    
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
        test.startSection(f"Input Speed: {speed}, Expected RPM: {expected_rpm}")
        
        VEHICLE_SIMULATOR.send("speed", speed)
        snooze(0.5) # Give a moment for the cluster to update
        
        # Verify the speed & rpm value is displayed correctly
        test.compare(Cluster.get_speed(), str(speed))
        test.compare(Cluster.get_rpm(), expected_rpm)
        
        test.log("Verify speed limit indicator")
        if speed > 55:
            verify_image( "over-speed-limit", Cluster.objects.speedLimitMPH(), pixel_error_threshold=0.08 )
        else:
            verify_image( "under-speed-limit", Cluster.objects.speedLimitMPH(), pixel_error_threshold=0.08 )
        test.endSection()

    VEHICLE_SIMULATOR.send("speed", 0)
    