import QtQuick
import QtQuick.Controls
import VehicleData 1.0

Rectangle {
    id: recBkgrd
    width: 1920
    height: 720
    color: "transparent"
    state: "adasOFF"
    property alias recBkgrdVisible: recBkgrd.visible

    Image {
        id: dy_bg_sky_line_night
        y: 0
        width: 2477
        height: 805
        source: "../../images/dy_bg_sky_line_night.png"
        anchors.horizontalCenterOffset: -6
        anchors.horizontalCenter: parent.horizontalCenter
        fillMode: Image.PreserveAspectFit
    }
    states: [
        State {
            name: "adasOFF"
            when: VehicleData.adasOFF

            PropertyChanges {
                target: dy_bg_sky_line_night
            }

            PropertyChanges {
                target: recBkgrd
                opacity: 0
            }
        },
        State {
            name: "adasON"
            when: VehicleData.adasON

            PropertyChanges {
                target: dy_bg_sky_line_night
            }

            PropertyChanges {
                target: recBkgrd
                opacity: 1
            }
        }
    ]
    transitions: [
        Transition {
            id: transition
            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 0
                    }

                    PropertyAnimation {
                        target: recBkgrd
                        property: "opacity"
                        duration: 1808
                    }
                }
            }
            to: "*"
            from: "*"
        }
    ]
}

/*##^##
Designer {
    D{i:0;uuid:"eafc07ec-d449-5c18-b9a7-ffd03a2d41f1"}D{i:1}D{i:8;transitionDuration:2000}
}
##^##*/

