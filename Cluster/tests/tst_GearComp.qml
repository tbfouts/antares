import QtQuick
import QtTest
import ClusterContent

Item {
    id: root
    width: 200
    height: 400

    Component {
        id: gearCompComponent
        GearComp {
            width: 51
            height: 272
        }
    }

    TestCase {
        name: "GearCompTests"
        when: windowShown

        function test_defaultState() {
            let gear = createTemporaryObject(gearCompComponent, root)
            verify(!!gear, "Component exists")
            compare(gear.state, qsTr("Drive"))
        }

        function test_defaultModeProperties() {
            let gear = createTemporaryObject(gearCompComponent, root)
            verify(!!gear, "Component exists")
            compare(gear.modeDrive, true)
            compare(gear.modePark, false)
        }

        function test_defaultGearText() {
            let gear = createTemporaryObject(gearCompComponent, root)
            verify(!!gear, "Component exists")
            compare(gear.txtGearDText, qsTr("D"))
            compare(gear.txtGearR1Text, qsTr("P"))
            compare(gear.txtGearRText, qsTr("R"))
        }

        function test_switchToPark() {
            let gear = createTemporaryObject(gearCompComponent, root)
            verify(!!gear, "Component exists")
            gear.modePark = true
            gear.modeDrive = false
            tryCompare(gear, "state", "Park")
        }

        function test_switchBackToDrive() {
            let gear = createTemporaryObject(gearCompComponent, root)
            verify(!!gear, "Component exists")
            gear.modePark = true
            gear.modeDrive = false
            tryCompare(gear, "state", "Park")
            gear.modePark = false
            gear.modeDrive = true
            tryCompare(gear, "state", "Drive")
        }

        function test_parkStateGearPHighlighted() {
            let gear = createTemporaryObject(gearCompComponent, root)
            verify(!!gear, "Component exists")
            gear.modePark = true
            gear.modeDrive = false
            tryCompare(gear, "state", "Park")
            let txtGearP = findChild(gear, "txtGearP")
            verify(!!txtGearP, "Object exists")
            tryCompare(txtGearP, "color", '#9e9ea0')
            compare(txtGearP.font.pixelSize, 60)
        }

        function test_parkStateGearDDimmed() {
            let gear = createTemporaryObject(gearCompComponent, root)
            verify(!!gear, "Component exists")
            gear.modePark = true
            gear.modeDrive = false
            tryCompare(gear, "state", "Park")
            let txtGearD = findChild(gear, "txtGearD")
            verify(!!txtGearD, "Object exists")
            tryCompare(txtGearD, "color", '#464646')
            compare(txtGearD.font.pixelSize, 45)
        }

        function test_driveStateGearDHighlighted() {
            let gear = createTemporaryObject(gearCompComponent, root)
            verify(!!gear, "Component exists")
            let txtGearD = findChild(gear, "txtGearD")
            verify(!!txtGearD, "Object exists")
            compare(txtGearD.color, '#9b9b9b')
            compare(txtGearD.font.pixelSize, 60)
        }
    }
}
