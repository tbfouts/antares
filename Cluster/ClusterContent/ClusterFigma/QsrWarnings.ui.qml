import QtQuick
import QtQuick.Controls
import Qt.SafeRenderer
import QtQuick.Timeline 1.0
import VehicleData

Rectangle {
    id: qsrWarnings
    width: 713
    height: 60
    color: "transparent"
    state: "OFF"
    property bool qsrON: VehicleData.qsrIcons

    SafeImage {
        id: lampHighBeamIcon
        width: 40
        height: 40
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 2
        anchors.topMargin: 10
        source: "assets/lampHighBeamIcon.png"
    }

    SafeImage {
        id: obdCheckLampIcon
        width: 40
        height: 40
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 62
        anchors.topMargin: 10
        source: "assets/obdCheckLampIcon.png"
    }

    SafeImage {
        id: seatBeltIcon
        width: 40
        height: 40
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 122
        anchors.topMargin: 10
        source: "assets/seatBeltIcon.png"
    }

    SafeImage {
        id: slipIcon
        width: 40
        height: 40
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 182
        anchors.topMargin: 10
        source: "assets/slipIcon.png"
    }

    SafeImage {
        id: fuelLevelIcon
        width: 40
        height: 40
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 242
        anchors.topMargin: 10
        source: "assets/fuelLevelIcon.png"
    }

    SafeImage {
        id: absIcon
        width: 40
        height: 40
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 302
        anchors.topMargin: 10
        source: "assets/absIcon.png"
    }

    SafeImage {
        id: oilPressureIcon
        width: 40
        height: 40
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 362
        anchors.topMargin: 10
        source: "assets/oilPressureIcon.png"
    }

    SafeImage {
        id: tpmsIcon
        width: 40
        height: 40
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 422
        anchors.topMargin: 10
        source: "assets/tpmsIcon.png"
    }

    SafeImage {
        id: parkWarningIcon
        width: 40
        height: 40
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 482
        anchors.topMargin: 10
        source: "assets/parkWarningIcon.png"
    }

    SafeImage {
        id: coolantTempIcon
        width: 40
        height: 40
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 542
        anchors.topMargin: 10
        source: "assets/coolantTempIcon.png"
    }

    SafeImage {
        id: batteryIcon
        width: 40
        height: 40
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 602
        anchors.topMargin: 10
        source: "assets/batteryIcon.png"
    }

    SafeImage {
        id: brakeWarningIcon
        width: 40
        height: 40
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 662
        anchors.topMargin: 10
        source: "assets/brakeWarningIcon.png"
    }

    Timeline {
        id: timelineQSR
        animations: [
            TimelineAnimation {
                id: timelineAnimationQSR
                running: false
                loops: 1
                duration: 3000
                to: 1000
                from: 0
            }
        ]
        startFrame: 0
        endFrame: 1000
        enabled: false

        KeyframeGroup {
            target: lampHighBeamIcon
            property: "opacity"
            Keyframe {
                value: 0
                frame: 527
            }

            Keyframe {
                value: 1
                frame: 727
            }

            Keyframe {
                value: 0
                frame: 0
            }
        }

        KeyframeGroup {
            target: absIcon
            property: "opacity"
            Keyframe {
                value: 0
                frame: 55
            }

            Keyframe {
                value: 1
                frame: 255
            }

            Keyframe {
                value: 0
                frame: 0
            }
        }

        KeyframeGroup {
            target: obdCheckLampIcon
            property: "opacity"
            Keyframe {
                value: 0
                frame: 374
            }

            Keyframe {
                value: 1
                frame: 574
            }

            Keyframe {
                value: 0
                frame: 0
            }
        }

        KeyframeGroup {
            target: seatBeltIcon
            property: "opacity"
            Keyframe {
                value: 0
                frame: 695
            }

            Keyframe {
                value: 1
                frame: 895
            }

            Keyframe {
                value: 0
                frame: 0
            }
        }

        KeyframeGroup {
            target: slipIcon
            property: "opacity"
            Keyframe {
                value: 1
                frame: 349
            }

            Keyframe {
                value: 0
                frame: 149
            }

            Keyframe {
                value: 0
                frame: 0
            }
        }

        KeyframeGroup {
            target: fuelLevelIcon
            property: "opacity"
            Keyframe {
                value: 0
                frame: 760
            }

            Keyframe {
                value: 1
                frame: 960
            }

            Keyframe {
                value: 0
                frame: 0
            }
        }

        KeyframeGroup {
            target: oilPressureIcon
            property: "opacity"
            Keyframe {
                value: 1
                frame: 683
            }

            Keyframe {
                value: 0
                frame: 483
            }

            Keyframe {
                value: 0
                frame: 0
            }
        }

        KeyframeGroup {
            target: tpmsIcon
            property: "opacity"
            Keyframe {
                value: 0
                frame: 0
            }

            Keyframe {
                value: 1
                frame: 200
            }
        }

        KeyframeGroup {
            target: parkWarningIcon
            property: "opacity"
            Keyframe {
                value: 1
                frame: 442
            }

            Keyframe {
                value: 0
                frame: 242
            }

            Keyframe {
                value: 0
                frame: 0
            }
        }

        KeyframeGroup {
            target: coolantTempIcon
            property: "opacity"
            Keyframe {
                value: 0
                frame: 631
            }

            Keyframe {
                value: 1
                frame: 831
            }

            Keyframe {
                value: 0
                frame: 0
            }
        }

        KeyframeGroup {
            target: batteryIcon
            property: "opacity"
            Keyframe {
                value: 0
                frame: 782
            }

            Keyframe {
                value: 1
                frame: 982
            }

            Keyframe {
                value: 0
                frame: 0
            }
        }

        KeyframeGroup {
            target: brakeWarningIcon
            property: "opacity"
            Keyframe {
                value: 1
                frame: 319
            }

            Keyframe {
                value: 0
                frame: 119
            }

            Keyframe {
                value: 0
                frame: 0
            }
        }
    }
    states: [
        State {
            name: "OFF"
            when: !qsrON

            PropertyChanges {
                target: lampHighBeamIcon
                opacity: 0
            }

            PropertyChanges {
                target: obdCheckLampIcon
                opacity: 0
            }

            PropertyChanges {
                target: seatBeltIcon
                opacity: 0
            }

            PropertyChanges {
                target: slipIcon
                opacity: 0
            }

            PropertyChanges {
                target: fuelLevelIcon
                opacity: 0
            }

            PropertyChanges {
                target: absIcon
                opacity: 0
            }

            PropertyChanges {
                target: oilPressureIcon
                opacity: 0
            }

            PropertyChanges {
                target: tpmsIcon
                opacity: 0
            }

            PropertyChanges {
                target: parkWarningIcon
                opacity: 0
            }

            PropertyChanges {
                target: coolantTempIcon
                opacity: 0
            }

            PropertyChanges {
                target: batteryIcon
                opacity: 0
            }

            PropertyChanges {
                target: brakeWarningIcon
                opacity: 0
            }
        },
        State {
            name: "ON"
            when: qsrON

            PropertyChanges {
                target: timelineQSR
                enabled: true
            }

            PropertyChanges {
                target: lampHighBeamIcon
                opacity: 1
            }

            PropertyChanges {
                target: obdCheckLampIcon
                opacity: 0
            }

            PropertyChanges {
                target: seatBeltIcon
                opacity: 0
            }

            PropertyChanges {
                target: slipIcon
                opacity: 0
            }

            PropertyChanges {
                target: fuelLevelIcon
                opacity: 0
            }

            PropertyChanges {
                target: absIcon
                opacity: 0
            }

            PropertyChanges {
                target: oilPressureIcon
                opacity: 0
            }

            PropertyChanges {
                target: tpmsIcon
                opacity: 1
            }

            PropertyChanges {
                target: parkWarningIcon
                opacity: 0
            }

            PropertyChanges {
                target: coolantTempIcon
                opacity: 0
            }

            PropertyChanges {
                target: batteryIcon
                opacity: 0
            }

            PropertyChanges {
                target: brakeWarningIcon
                opacity: 0
            }

            PropertyChanges {
                target: timelineAnimationQSR
                running: true
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;uuid:"31e2bc88-8b9b-5523-a2ae-ed92690531d7"}D{i:1;uuid:"3fc2286c-5a00-529e-8970-dfeb63cb0bad"}
D{i:2;uuid:"5bda0663-b312-5818-9f9a-e3f822398727"}D{i:3;uuid:"97f8c74f-9c6e-5f45-9e25-928660727c5b"}
D{i:4;uuid:"934a57cd-3b4d-5597-bd4c-ea3f9dfeeb53"}D{i:5;uuid:"29b6db3e-94b9-541a-bcc4-a9499b41ecd9"}
D{i:6;uuid:"cea5c0ae-75fc-58b3-be6a-8134c5b7e529"}D{i:7;uuid:"73f2ed1b-7476-5139-a3bb-558c54431584"}
D{i:8;uuid:"20919db4-1217-5299-8889-ee8d14321801"}D{i:9;uuid:"9c9dca09-0448-5e25-b4cb-fc835dbed57f"}
D{i:10;uuid:"5c67c761-9804-5d60-bd2d-4171aa8df605"}D{i:11;uuid:"06537269-841b-5668-a910-c5e56c45952c"}
}
##^##*/

