import QtQuick
import QtQuick.Controls
import QtQuick.Studio.Components 1.0
import QtQuick.Shapes 1.0
import Data 1.0 as Data

Button {
    id: btnPlayMedia
    width: 156
    height: 149
    checkable: true
    state: Data.Themes.animRunning ? "Playing" : "Paused"
    background: btnMediabkgrd

    ArcItem {
        id: btnMediabkgrd
        width: 99
        height: 99
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 28
        anchors.topMargin: 25
        strokeWidth: 0
        strokeStyle: 0
        strokeColor: "transparent"
        outlineArc: true
        fillColor: "#999999"
        end: 450.00001
        begin: 90
        arcWidth: 49.5
        antialiasing: true
    }

    SvgPathItem {
        id: btnPause
        width: 16
        height: 27
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 70
        anchors.topMargin: 61
        strokeWidth: 1
        strokeStyle: 1
        strokeColor: "transparent"
        path: "M 5 0 L 0 0 L 0 27 L 5 27 L 5 0 Z M 16 0 L 11 0 L 11 27 L 16 27 L 16 0 Z"
        joinStyle: 0
        fillColor: "#d9d9d9"
        antialiasing: true
    }

    SvgPathItem {
        id: btnPlay
        width: 25
        height: 27
        visible: false
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 68
        anchors.topMargin: 61
        strokeWidth: 1
        strokeStyle: 1
        strokeColor: "transparent"
        path: "M 24.75 13.423385620117188 L 0 0 L 0 26.846786499023438 L 24.75 13.423385620117188 Z"
        joinStyle: 0
        fillColor: "#d9d9d9"
        antialiasing: true
    }

    Connections {
        target: btnPlayMedia
        onPressed: {
            Data.Themes.animPaused = !Data.Themes.animPaused
            Data.Themes.animRunning = !Data.Themes.animRunning
        }
    }

    states: [
        State {
            name: "Paused"

            PropertyChanges {
                target: btnPlay
                visible: true
            }

            PropertyChanges {
                target: btnPause
                visible: false
            }
        },
        State {
            name: "Playing"

            PropertyChanges {
                target: btnPlay
                visible: false
            }

            PropertyChanges {
                target: btnPause
                visible: true
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;uuid:"cc89c3c6-6129-5525-88c9-0c55bb75dee3"}D{i:2;uuid:"cdde69fa-5181-5120-9241-c03115d8e5b7"}
}
##^##*/

