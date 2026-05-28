import QtQuick
import QtTest
import ClusterContent
import VehicleData

Item {
    id: root
    width: 700
    height: 200

    Component {
        id: batteryGaugeComponent
        BatteryGauge_Comp {
            width: 647
            height: 161
        }
    }

    TestCase {
        name: "BatteryGaugeCompTests"
        when: windowShown

        function test_componentCreation() {
            let gauge = createTemporaryObject(batteryGaugeComponent, root)
            verify(!!gauge, "Component exists")
            compare(gauge.width, 647)
            compare(gauge.height, 161)
        }

        function test_barExistsAndAccessible() {
            let gauge = createTemporaryObject(batteryGaugeComponent, root)
            verify(!!gauge, "Component exists")
            let bar = findChild(gauge, "barFillingBattery")
            verify(!!bar, "Object exists")
            compare(bar.color, '#67b800')
        }

        function test_textLabelExists() {
            let gauge = createTemporaryObject(batteryGaugeComponent, root)
            verify(!!gauge, "Component exists")
            let label = findChild(gauge, "textBatteryRem")
            verify(!!label, "Object exists")
            compare(label.font.family, qsTr("Oxanium"))
            compare(label.font.pixelSize, 30)
        }

        function test_barWidthAtFullBattery() {
            let originalBattery = VehicleData.battery
            VehicleData.battery = 100
            let gauge = createTemporaryObject(batteryGaugeComponent, root)
            verify(!!gauge, "Component exists")
            let bar = findChild(gauge, "barFillingBattery")
            verify(!!bar, "Object exists")
            tryCompare(bar, "width", 371)
            VehicleData.battery = originalBattery
        }

        function test_barWidthAtEmptyBattery() {
            let originalBattery = VehicleData.battery
            VehicleData.battery = 0
            let gauge = createTemporaryObject(batteryGaugeComponent, root)
            verify(!!gauge, "Component exists")
            let bar = findChild(gauge, "barFillingBattery")
            verify(!!bar, "Object exists")
            tryCompare(bar, "width", 0)
            VehicleData.battery = originalBattery
        }

        function test_barWidthAtHalfBattery() {
            let originalBattery = VehicleData.battery
            VehicleData.battery = 50
            let gauge = createTemporaryObject(batteryGaugeComponent, root)
            verify(!!gauge, "Component exists")
            let bar = findChild(gauge, "barFillingBattery")
            verify(!!bar, "Object exists")
            tryCompare(bar, "width", 185.5)
            VehicleData.battery = originalBattery
        }

        function test_labelHiddenAtFullBattery() {
            let originalBattery = VehicleData.battery
            VehicleData.battery = 100
            let gauge = createTemporaryObject(batteryGaugeComponent, root)
            verify(!!gauge, "Component exists")
            let label = findChild(gauge, "textBatteryRem")
            verify(!!label, "Object exists")
            tryCompare(label, "opacity", 0)
            VehicleData.battery = originalBattery
        }

        function test_labelVisibleAtLowBattery() {
            let originalBattery = VehicleData.battery
            VehicleData.battery = 50
            let gauge = createTemporaryObject(batteryGaugeComponent, root)
            verify(!!gauge, "Component exists")
            let label = findChild(gauge, "textBatteryRem")
            verify(!!label, "Object exists")
            tryCompare(label, "opacity", 1)
            VehicleData.battery = originalBattery
        }
    }
}
