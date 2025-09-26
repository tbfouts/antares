import QtQuick
import QtQuick.Controls
import QtQuick.Studio.Components 1.0
import QtQuick.Studio.DesignEffects
import QtQuick.Timeline 1.0
import GLO 1.0
import VehicleData 1.0

Rectangle {
    id: batteryGauge_Comp
    width: 647
    height: 161
    color: "transparent"




    Image {
        id: batteryGauge_Border1
        x: 41
        y: 2
        source: "assets/batteryGauge_Border.png"
        fillMode: Image.PreserveAspectFit
    }

    SvgPathItem {
        id: vecBatteryStages
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 133
        anchors.rightMargin: 141
        anchors.topMargin: 2
        anchors.bottomMargin: 84
        strokeWidth: 1
        strokeStyle: 1
        strokeColor: "transparent"
        path: "M 0 0 L 1 0 L 1 75 L 0 75 L 0 0 Z M 372 0 L 373 0 L 373 75 L 372 75 L 372 0 Z M 186 0 L 187 0 L 187 75 L 186 75 L 186 0 Z M 279 0 L 280 0 L 280 75 L 279 75 L 279 0 Z M 93 0 L 94 0 L 94 75 L 93 75 L 93 0 Z"
        joinStyle: 0
        fillColor: "#3f3f3f"
        antialiasing: true
    }




    Rectangle {
        id: barFillingBattery
        color: "#67b800"
        radius: 1
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 142
        anchors.topMargin: 40
        anchors.bottomMargin: 118

        DesignEffect {
            effects: [
                DesignDropShadow {
                    color: "#efbf44"
                    blur: 30
                    offsetY: 0
                }
            ]
        }
    }




    SvgPathItem {
        id: batteryVecLow
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 526
        anchors.rightMargin: 80
        anchors.topMargin: 27
        anchors.bottomMargin: 107
        strokeWidth: 1
        strokeStyle: 1
        strokeColor: "transparent"
        path: "M 30.716869354248047 16.18266487121582 L 32.615840911865234 16.18266487121582 L 32.615840911865234 13.32861042022705 L 35.465423583984375 13.32861042022705 L 35.465423583984375 11.425161361694336 L 32.615840911865234 11.425161361694336 L 32.615840911865234 8.56887149810791 L 30.716869354248047 8.56887149810791 L 30.716869354248047 11.425161361694336 L 27.86505126953125 11.425161361694336 L 27.86505126953125 13.32861042022705 L 30.716869354248047 13.32861042022705 L 30.716869354248047 16.18266487121582 Z M 34.51481628417969 2.856290817260742 L 34.51481628417969 0 L 28.18266487121582 0 L 28.18266487121582 2.856290817260742 L 12.348926544189453 2.856290817260742 L 12.348926544189453 0 L 6.016774654388428 0 L 6.016774654388428 2.856290817260742 L 0 2.856290817260742 L 0 26.654985427856445 L 40.53158950805664 26.654985427856445 L 40.53158950805664 2.856290817260742 L 34.51481628417969 2.856290817260742 Z M 37.99738311767578 24.116310119628906 L 2.5319666862487793 24.116310119628906 L 2.5319666862487793 5.394967079162598 L 37.99738311767578 5.394967079162598 L 37.99738311767578 24.116310119628906 Z M 12.666543006896973 11.425162315368652 L 5.066169738769531 11.425162315368652 L 5.066169738769531 13.328611373901367 L 12.666543006896973 13.328611373901367 L 12.666543006896973 11.425162315368652 Z"
        joinStyle: 0
        fillColor: "#6e6d69"
        antialiasing: true
    }



    Text {
        id: textBatteryRem
        x: barFillingBattery.x - 55
        y: 27
        width: 50
        height: 27
        opacity: 1
        color: "#bababa"
        text: timelineBattery.currentFrame.toFixed(0)
        font.pixelSize: 30
        horizontalAlignment: Text.AlignRight
        font.family: "Oxanium"
    }


    Image {
        id: batteryVecFull
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 78
        anchors.rightMargin: 528
        anchors.topMargin: 27
        anchors.bottomMargin: 107
        source: "assets/batteryVecFull.png"
    }




    Timeline {
        id: timelineBattery
        startFrame: 0
        endFrame: 100
        enabled: true
        currentFrame: VehicleData.battery

        KeyframeGroup {
            target: barFillingBattery
            property: "width"
            Keyframe {
                value: 371
                frame: 100
            }

            Keyframe {
                value: 0
                frame: 0
            }
        }

        KeyframeGroup {
            target: textBatteryRem
            property: "opacity"
            Keyframe {
                value: 0
                frame: 100
            }

            Keyframe {
                value: 0
                frame: 91
            }

            Keyframe {
                value: 1
                frame: 89
            }
        }
    }



}

/*##^##
Designer {
    D{i:0;uuid:"4f55a560-97ab-5fb1-aec6-cca4aafd456f"}D{i:2;uuid:"6b6be73d-cc47-5af1-a01d-b9ce1860f18a"}
D{i:3;uuid:"e618ccc5-315d-5acd-8be5-29e4d8890e4f"}D{i:6;uuid:"df055184-5c49-5841-97db-5deb928f2a93"}
D{i:8;uuid:"7fcdb930-9bfe-5789-9cbc-d7078a5693cf"}
}
##^##*/

