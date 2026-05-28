import QtQuick
import QtTest
import ClusterContent

Item {
    id: root
    width: 600
    height: 100

    Component {
        id: turnSignalsComponent
        QsrTurnSignals {
            width: 500
            height: 60
            turnLeftSignal: false
            turnRightSignal: false
        }
    }

    TestCase {
        name: "QsrTurnSignalsTests"
        when: windowShown

        function test_defaultState() {
            let signals = createTemporaryObject(turnSignalsComponent, root)
            verify(!!signals, "Component exists")
            compare(signals.state, "")
        }

        function test_defaultSignalProperties() {
            let signals = createTemporaryObject(turnSignalsComponent, root)
            verify(!!signals, "Component exists")
            compare(signals.turnLeftSignal, false)
            compare(signals.turnRightSignal, false)
        }

        function test_turnLeftStateActivated() {
            let signals = createTemporaryObject(turnSignalsComponent, root)
            verify(!!signals, "Component exists")
            signals.turnLeftSignal = true
            tryCompare(signals, "state", "TurnLeft")
        }

        function test_turnRightStateActivated() {
            let signals = createTemporaryObject(turnSignalsComponent, root)
            verify(!!signals, "Component exists")
            signals.turnRightSignal = true
            tryCompare(signals, "state", "TurnRight")
        }

        function test_turnLeftIconVisible() {
            let signals = createTemporaryObject(turnSignalsComponent, root)
            verify(!!signals, "Component exists")
            let leftIcon = findChild(signals, "turnLeftIcon")
            verify(!!leftIcon, "Object exists")
            compare(leftIcon.opacity, 0)
            signals.turnLeftSignal = true
            tryCompare(signals, "state", "TurnLeft")
            tryCompare(leftIcon, "opacity", 1)
        }

        function test_turnRightIconVisible() {
            let signals = createTemporaryObject(turnSignalsComponent, root)
            verify(!!signals, "Component exists")
            let rightIcon = findChild(signals, "turnRightIcon")
            verify(!!rightIcon, "Object exists")
            compare(rightIcon.opacity, 0)
            signals.turnRightSignal = true
            tryCompare(signals, "state", "TurnRight")
            tryCompare(rightIcon, "opacity", 1)
        }

        function test_turnLeftHidesRightIcon() {
            let signals = createTemporaryObject(turnSignalsComponent, root)
            verify(!!signals, "Component exists")
            let rightIcon = findChild(signals, "turnRightIcon")
            verify(!!rightIcon, "Object exists")
            signals.turnLeftSignal = true
            tryCompare(signals, "state", "TurnLeft")
            tryCompare(rightIcon, "opacity", 0)
        }

        function test_signalDeactivated() {
            let signals = createTemporaryObject(turnSignalsComponent, root)
            verify(!!signals, "Component exists")
            let leftIcon = findChild(signals, "turnLeftIcon")
            verify(!!leftIcon, "Object exists")
            signals.turnLeftSignal = true
            tryCompare(signals, "state", "TurnLeft")
            signals.turnLeftSignal = false
            tryCompare(signals, "state", "")
        }
    }
}
