import QtQuick
import QtQuick.Controls
import Qt.SafeRenderer
import QtQuick.Timeline 1.0
import VehicleData 1.0

Rectangle {
    id: qsrTurnSignals
    width: 500
    height: 60
    color: "transparent"
    property bool turnLeftSignal: VehicleData.switchTurnL
    property bool turnRightSignal: VehicleData.switchTurnR

    SafeImage {
        id: turnLeftIcon
        width: 50
        height: 50
        opacity: 0
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 5
        source: "assets/turnLeftIcon.png"
    }

    SafeImage {
        id: turnRightIcon
        width: 50
        height: 50
        opacity: 0
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 447
        anchors.topMargin: 5
        source: "assets/turnRightIcon.png"
    }

    Timeline {
        id: timelineLeftTurn
        animations: [
            TimelineAnimation {
                id: turnLeftAnim
                pingPong: true
                running: false
                loops: -1
                duration: 500
                to: 1000
                from: 0
            }
        ]
        startFrame: 0
        endFrame: 1000
        enabled: false

        KeyframeGroup {
            target: turnLeftIcon
            property: "opacity"
            Keyframe {
                value: 0
                frame: 0
            }

            Keyframe {
                value: 1
                frame: 1000
            }
        }
    }

    Timeline {
        id: timelineRightTurn
        animations: [
            TimelineAnimation {
                id: timelineRightAnim
                pingPong: true
                running: false
                loops: -1
                duration: 500
                to: 1000
                from: 0
            }
        ]
        startFrame: 0
        endFrame: 1000
        enabled: false

        KeyframeGroup {
            target: turnRightIcon
            property: "opacity"
            Keyframe {
                value: 0
                frame: 0
            }

            Keyframe {
                value: 1
                frame: 1000
            }
        }
    }
    states: [
        State {
            name: "TurnLeft"
            when: turnLeftSignal

            PropertyChanges {
                target: turnRightIcon
                opacity: 0
            }

            PropertyChanges {
                target: timelineLeftTurn
                enabled: true
            }

            PropertyChanges {
                target: turnLeftAnim
                running: true
            }

            PropertyChanges {
                target: turnLeftIcon
                opacity: 1
            }

            PropertyChanges {
                target: timelineRightTurn
                enabled: false
            }

            PropertyChanges {
                target: timelineRightAnim
                running: false
            }
        },
        State {
            name: "TurnRight"
            when: turnRightSignal

            PropertyChanges {
                target: turnLeftIcon
                opacity: 0
            }

            PropertyChanges {
                target: timelineRightTurn
                enabled: true
            }

            PropertyChanges {
                target: timelineRightAnim
                running: true
            }

            PropertyChanges {
                target: turnRightIcon
                opacity: 1
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;uuid:"a71d6806-0a6b-59fb-81a1-0390b0b42ccc"}D{i:1;uuid:"e63fa0d9-853b-5361-a39e-e387991a999b"}
}
##^##*/

