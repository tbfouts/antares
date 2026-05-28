import QtQuick
import QtTest
import ClusterContent
import VehicleData

Item {
    id: root
    width: 400
    height: 100

    Component {
        id: driveModeComponent
        DriveMode {
            width: 291
            height: 35
        }
    }

    TestCase {
        name: "DriveModeTests"
        when: windowShown

        function test_componentCreation() {
            let dm = createTemporaryObject(driveModeComponent, root)
            verify(!!dm, "Component exists")
            compare(dm.width, 291)
            compare(dm.height, 35)
        }

        function test_defaultDriveModeLabel() {
            let dm = createTemporaryObject(driveModeComponent, root)
            verify(!!dm, "Component exists")
            compare(dm.txtDriveModeText, qsTr("DRIVE MODE:"))
        }

        function test_driveModeReflectsVehicleData() {
            let originalMode = VehicleData.driveMode
            VehicleData.driveMode = "SPORT"
            let dm = createTemporaryObject(driveModeComponent, root)
            verify(!!dm, "Component exists")
            tryCompare(dm, "txtModeText", "SPORT")
            VehicleData.driveMode = originalMode
        }

        function test_driveModeUpdatesOnChange() {
            let originalMode = VehicleData.driveMode
            VehicleData.driveMode = "SPORT"
            let dm = createTemporaryObject(driveModeComponent, root)
            verify(!!dm, "Component exists")
            tryCompare(dm, "txtModeText", "SPORT")
            VehicleData.driveMode = "ECO"
            tryCompare(dm, "txtModeText", "ECO")
            VehicleData.driveMode = originalMode
        }

        function test_driveModeComfort() {
            let originalMode = VehicleData.driveMode
            VehicleData.driveMode = "COMFORT"
            let dm = createTemporaryObject(driveModeComponent, root)
            verify(!!dm, "Component exists")
            tryCompare(dm, "txtModeText", "COMFORT")
            VehicleData.driveMode = originalMode
        }

        function test_driveModeLabelWritable() {
            let dm = createTemporaryObject(driveModeComponent, root)
            verify(!!dm, "Component exists")
            dm.txtDriveModeText = qsTr("MODE:")
            compare(dm.txtDriveModeText, qsTr("MODE:"))
        }
    }
}
