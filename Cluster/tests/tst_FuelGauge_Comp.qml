import QtQuick
import QtTest
import ClusterContent
import VehicleData

Item {
    id: root
    width: 700
    height: 200

    Component {
        id: fuelGaugeComponent
        FuelGauge_Comp {
            width: 589
            height: 161
        }
    }

    TestCase {
        name: "FuelGaugeCompTests"
        when: windowShown

        function test_componentCreation() {
            let gauge = createTemporaryObject(fuelGaugeComponent, root)
            verify(!!gauge, "Component exists")
            compare(gauge.width, 589)
            compare(gauge.height, 161)
        }

        function test_barExistsAndAccessible() {
            let gauge = createTemporaryObject(fuelGaugeComponent, root)
            verify(!!gauge, "Component exists")
            let bar = findChild(gauge, "veFuelGaugeBar")
            verify(!!bar, "Object exists")
            compare(bar.color, '#67b800')
        }

        function test_textLabelExists() {
            let gauge = createTemporaryObject(fuelGaugeComponent, root)
            verify(!!gauge, "Component exists")
            let label = findChild(gauge, "txtFuelRem")
            verify(!!label, "Object exists")
            compare(label.font.family, qsTr("Oxanium"))
            compare(label.font.pixelSize, 30)
        }

        function test_barWidthAtFullFuel() {
            let originalFuel = VehicleData.fuel
            VehicleData.fuel = 100
            let gauge = createTemporaryObject(fuelGaugeComponent, root)
            verify(!!gauge, "Component exists")
            let bar = findChild(gauge, "veFuelGaugeBar")
            verify(!!bar, "Object exists")
            tryCompare(bar, "width", 371)
            VehicleData.fuel = originalFuel
        }

        function test_barWidthAtEmptyFuel() {
            let originalFuel = VehicleData.fuel
            VehicleData.fuel = 0
            let gauge = createTemporaryObject(fuelGaugeComponent, root)
            verify(!!gauge, "Component exists")
            let bar = findChild(gauge, "veFuelGaugeBar")
            verify(!!bar, "Object exists")
            tryCompare(bar, "width", 0)
            VehicleData.fuel = originalFuel
        }

        function test_barWidthAtHalfFuel() {
            let originalFuel = VehicleData.fuel
            VehicleData.fuel = 50
            let gauge = createTemporaryObject(fuelGaugeComponent, root)
            verify(!!gauge, "Component exists")
            let bar = findChild(gauge, "veFuelGaugeBar")
            verify(!!bar, "Object exists")
            tryCompare(bar, "width", 185.5)
            VehicleData.fuel = originalFuel
        }

        function test_labelHiddenAtFullFuel() {
            let originalFuel = VehicleData.fuel
            VehicleData.fuel = 100
            let gauge = createTemporaryObject(fuelGaugeComponent, root)
            verify(!!gauge, "Component exists")
            let label = findChild(gauge, "txtFuelRem")
            verify(!!label, "Object exists")
            tryCompare(label, "opacity", 0)
            VehicleData.fuel = originalFuel
        }

        function test_labelVisibleAtLowFuel() {
            let originalFuel = VehicleData.fuel
            VehicleData.fuel = 50
            let gauge = createTemporaryObject(fuelGaugeComponent, root)
            verify(!!gauge, "Component exists")
            let label = findChild(gauge, "txtFuelRem")
            verify(!!label, "Object exists")
            tryCompare(label, "opacity", 1)
            VehicleData.fuel = originalFuel
        }
    }
}
