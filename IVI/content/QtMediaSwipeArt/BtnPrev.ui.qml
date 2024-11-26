import QtQuick
import QtQuick.Controls
import QtQuick.Studio.Components 1.0
import Data 1.0

Button {
    id: btnPrev
    width: 169
    height: 116
    background: btnPrevRec

    Rectangle {
        id: btnPrevRec
        width: 169
        height: 116
        color: "transparent"
        clip: true
        state: "state_Press"
        anchors.centerIn: parent

        SvgPathItem {
            id: btnPreviousPress
            width: 20
            height: 20
            anchors.centerIn: parent
            strokeWidth: 1
            strokeStyle: 1
            strokeColor: "transparent"
            path: "M 3.7037037037037033 8.95194724754051 L 3.7037037037037033 0 L 0 0 L 0 20 L 3.7037037037037033 20 L 3.7037037037037033 11.161555537471065 L 20 20 L 20 0.1134914822048611 L 3.7037037037037033 8.95194724754051 Z"
            joinStyle: 0
            fillColor: "#cdcdcd"
            antialiasing: true
        }

        SvgPathItem {
            id: btnPreviousDef
            width: 27
            height: 27
            visible: false
            anchors.centerIn: parent
            strokeWidth: 1
            strokeStyle: 1
            strokeColor: "transparent"
            path: "M 5 12.085128784179688 L 5 0 L 0 0 L 0 27 L 5 27 L 5 15.068099975585938 L 27 27 L 27 0.1532135009765625 L 5 12.085128784179688 Z"
            joinStyle: 0
            fillColor: "#cdcdcd"
            antialiasing: true
        }
    }

    Connections {
        target: btnPrev
        onReleased: {
            Themes.previousTrack()
            trackBar.state = "idle"
        }
    }
    states: [
        State {
            name: "Default"
            when: !btnPrev.pressed

            PropertyChanges {
                target: btnPreviousDef
                visible: true
            }

            PropertyChanges {
                target: btnPreviousPress
                visible: false
            }
        },
        State {
            name: "Press"
            when: btnPrev.pressed

            PropertyChanges {
                target: btnPreviousDef
                visible: false
            }

            PropertyChanges {
                target: btnPreviousPress
                visible: true
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;uuid:"64d9dd6a-60fa-5879-a888-1022ba2a79ef"}
}
##^##*/

