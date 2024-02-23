import QtQuick
import QtQuick.Controls
import QtQuick.Studio.Components 1.0
import Data 1.0

Button {
    id: btnNext
    width: 129
    height: 142
    background: btnNextRec

    Rectangle {
        id: btnNextRec
        width: 129
        height: 142
        color: "transparent"
        clip: true
        state: "state_Pressed"
    }

    SvgPathItem {
        id: btnNextPress
        x: 47
        y: 55
        width: 20
        height: 20
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 55
        anchors.topMargin: 61
        strokeWidth: 1
        strokeStyle: 1
        strokeColor: "transparent"
        path: "M 16.296296296296294 11.04805275245949 L 16.296296296296294 20 L 20 20 L 20 0 L 16.296296296296294 0 L 16.296296296296294 8.838444462528935 L 0 0 L 0 19.88650851779514 L 16.296296296296294 11.04805275245949 Z"
        joinStyle: 0
        fillColor: "#cdcdcd"
        antialiasing: true
    }

    SvgPathItem {
        id: btnNextDef
        x: 43
        y: 51
        width: 27
        height: 27
        visible: false
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 51
        anchors.topMargin: 57
        strokeWidth: 1
        strokeStyle: 1
        strokeColor: "transparent"
        path: "M 22 14.914871215820312 L 22 27 L 27 27 L 27 0 L 22 0 L 22 11.931900024414062 L 0 0 L 0 26.846786499023438 L 22 14.914871215820312 Z"
        joinStyle: 0
        fillColor: "#cdcdcd"
        antialiasing: true
    }

    Connections {
        target: btnNext
        onReleased: {
            Themes.nextTrack()
        }
    }
    states: [
        State {
            name: "Default"
            when: !btnNext.pressed

            PropertyChanges {
                target: btnNextPress
                visible: false
            }

            PropertyChanges {
                target: btnNextDef
                visible: true
            }
        },
        State {
            name: "Pressed"
            when: btnNext.pressed

            PropertyChanges {
                target: btnNextPress
                visible: true
            }

            PropertyChanges {
                target: btnNextDef
                visible: false
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;uuid:"b38cfef9-c7fd-5595-a079-5b6a3faf7c73"}
}
##^##*/

