import QtQuick
import QtTest
import ClusterContent

Item {
    id: root
    width: 600
    height: 700

    Component {
        id: adasCompComponent
        AdasComp {
            width: 480
            height: 592
            adasOFF: true
            adasON: false
        }
    }

    TestCase {
        name: "AdasCompTests"
        when: windowShown

        function test_defaultState() {
            let adas = createTemporaryObject(adasCompComponent, root)
            verify(!!adas, "Component exists")
            compare(adas.state, qsTr("AdasOFF"))
        }

        function test_defaultProperties() {
            let adas = createTemporaryObject(adasCompComponent, root)
            verify(!!adas, "Component exists")
            compare(adas.adasOFF, true)
            compare(adas.adasON, false)
        }

        function test_adasEngagedText() {
            let adas = createTemporaryObject(adasCompComponent, root)
            verify(!!adas, "Component exists")
            compare(adas.txtADASEngText, qsTr("ADAS ENGAGED"))
        }

        function test_switchToAdasON() {
            let adas = createTemporaryObject(adasCompComponent, root)
            verify(!!adas, "Component exists")
            adas.adasON = true
            adas.adasOFF = false
            tryCompare(adas, "state", "AdasON")
        }

        function test_switchBackToAdasOFF() {
            let adas = createTemporaryObject(adasCompComponent, root)
            verify(!!adas, "Component exists")
            adas.adasON = true
            adas.adasOFF = false
            tryCompare(adas, "state", "AdasON")
            adas.adasON = false
            adas.adasOFF = true
            tryCompare(adas, "state", "AdasOFF")
        }

        function test_adasOFFHidesHalo() {
            let adas = createTemporaryObject(adasCompComponent, root)
            verify(!!adas, "Component exists")
            let halo = findChild(adas, "adasHaloVec")
            verify(!!halo, "Object exists")
            tryCompare(halo, "opacity", 0)
        }

        function test_adasONShowsHalo() {
            let adas = createTemporaryObject(adasCompComponent, root)
            verify(!!adas, "Component exists")
            let halo = findChild(adas, "adasHaloVec")
            verify(!!halo, "Object exists")
            adas.adasON = true
            adas.adasOFF = false
            tryCompare(adas, "state", "AdasON")
            tryCompare(halo, "opacity", 1)
        }

        function test_adasOFFHidesEngagedText() {
            let adas = createTemporaryObject(adasCompComponent, root)
            verify(!!adas, "Component exists")
            let engText = findChild(adas, "txtADASEng")
            verify(!!engText, "Object exists")
            tryCompare(engText, "width", 0)
        }

        function test_adasONShowsEngagedText() {
            let adas = createTemporaryObject(adasCompComponent, root)
            verify(!!adas, "Component exists")
            let engText = findChild(adas, "txtADASEng")
            verify(!!engText, "Object exists")
            adas.adasON = true
            adas.adasOFF = false
            tryCompare(adas, "state", "AdasON")
            tryCompare(engText, "width", 257)
        }
    }
}
