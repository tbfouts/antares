import QtQuick
import QtQuick.Controls
import QtQuick.Studio.Components 1.0
import QtQuick.Studio.DesignEffects
import QtQuick.Timeline 1.0

Rectangle {
    id: aDAS_Front
    width: 81
    height: 22
    color: "transparent"
    property alias adasFRLeve1FillColor: adasFRLeve1.fillColor
    property alias adasFRLeve1Opacity: adasFRLeve1.opacity
    property alias adasFRLeve2FillColor: adasFRLeve2.fillColor
    property alias adasFRLeve2Opacity: adasFRLeve2.opacity
    property alias adasFRLeve3Opacity: adasFRLeve3.opacity
    property alias adasFRLeve3FillColor: adasFRLeve3.fillColor

    SvgPathItem {
        id: adasFRLeve3
        width: 81
        height: 4
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 18
        strokeWidth: 1
        strokeStyle: 1
        strokeColor: "transparent"
        path: "M 1.53125 0 L 79.5 0 L 81 4 L 0 4 L 1.53125 0 Z"
        joinStyle: 0
        fillColor: "#e0e0e0"
        antialiasing: true

        DesignEffect {
            effects: [
                DesignDropShadow {
                    id: designDropShadow
                    color: "#87ffffff"
                    offsetY: -4
                    blur: 16
                }
            ]
        }
    }

    SvgPathItem {
        id: adasFRLeve2
        width: 60
        height: 4
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 11
        anchors.topMargin: 9
        strokeWidth: 1
        strokeStyle: 1
        strokeColor: "transparent"
        path: "M 1.1342592592592593 0 L 58.888888888888886 0 L 60 4 L 0 4 L 1.1342592592592593 0 Z"
        joinStyle: 0
        fillColor: "#e0e0e0"
        antialiasing: true

        DesignEffect {
            effects: [
                DesignDropShadow {
                    id: designDropShadow1
                    color: "#87ffffff"
                    offsetY: -2
                    blur: 16
                }]
        }
    }

    SvgPathItem {
        id: adasFRLeve1
        width: 40
        height: 4
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 21
        strokeWidth: 1
        strokeStyle: 1
        strokeColor: "transparent"
        path: "M 0.7561728395061728 0 L 39.25925925925926 0 L 40 4 L 0 4 L 0.7561728395061728 0 Z"
        joinStyle: 0
        fillColor: "#e0e0e0"
        antialiasing: true

        DesignEffect {
            effects: [
                DesignDropShadow {
                    id: designDropShadow2
                    color: "#87ffffff"
                    offsetY: -4
                    blur: 16
                }]
        }
    }

    Timeline {
        id: timeline
        animations: [
            TimelineAnimation {
                id: timelineAnimation
                running: true
                loops: 1
                duration: 1000
                to: 1000
                from: 0
            }
        ]
        startFrame: 0
        endFrame: 1000
        enabled: true
    }
}

/*##^##
Designer {
    D{i:0;uuid:"a164412a-ffef-5b3a-a1b4-0f4e53046362"}D{i:1;uuid:"e9fd9dcc-aaa2-5084-9699-a816f04df439"}
D{i:4;uuid:"ed0bfe73-4154-51de-a4ba-df60bcf60b59"}D{i:7;uuid:"5c397327-a83b-5d96-95da-6b23ac9aafad"}
}
##^##*/

