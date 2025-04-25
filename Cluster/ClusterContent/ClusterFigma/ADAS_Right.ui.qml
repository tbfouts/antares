import QtQuick
import QtQuick.Controls
import QtQuick.Studio.Components 1.0

Rectangle {
    id: aDAS_Right
    width: 81
    height: 22
    color: "transparent"
    property alias adasRtLeve1Opacity: adasRtLeve1.opacity
    property alias adasRtLeve1FillColor: adasRtLeve1.fillColor
    property alias adasRtLeve2Opacity: adasRtLeve2.opacity
    property alias adasRtLeve2FillColor: adasRtLeve2.fillColor
    property alias adasRtLeve3FillColor: adasRtLeve3.fillColor
    property alias adasRtLeve3Opacity: adasRtLeve3.opacity
    rotation: 78.794

    SvgPathItem {
        id: adasRtLeve3
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 31
        anchors.rightMargin: 30
        anchors.topMargin: -20
        anchors.bottomMargin: -38
        strokeWidth: 1
        strokeStyle: 1
        strokeColor: "transparent"
        rotation: -78.794
        path: "M 4.221312522888184 0.7247393727302551 L 19.37296485900879 77.20710754394531 L 15.740715026855469 79.4558334350586 L 0 0 L 4.221312522888184 0.7247393727302551 Z"
        joinStyle: 0
        fillColor: "#cfc93b"
        antialiasing: true
    }

    SvgPathItem {
        id: adasRtLeve2
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 33
        anchors.rightMargin: 32
        anchors.topMargin: -18
        anchors.bottomMargin: -19
        strokeWidth: 1
        strokeStyle: 1
        strokeColor: "transparent"
        rotation: -78.794
        path: "M 4.144165515899658 0.3353167176246643 L 15.367610931396484 56.988922119140625 L 11.659788131713867 58.856170654296875 L 0 0 L 4.144165515899658 0.3353167176246643 Z"
        joinStyle: 0
        fillColor: "#cfc93b"
        antialiasing: true
    }

    SvgPathItem {
        id: adasRtLeve1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 35
        anchors.rightMargin: 34
        anchors.topMargin: -17
        anchors.bottomMargin: 0
        strokeWidth: 1
        strokeStyle: 1
        strokeColor: "transparent"
        rotation: -78.794
        path: "M 4.07069206237793 0 L 11.55298900604248 37.76906967163086 L 7.773192405700684 39.27301025390625 L 0 0.03556192293763161 L 4.07069206237793 0 Z"
        joinStyle: 0
        fillColor: "#cfc93b"
        antialiasing: true
    }
}

/*##^##
Designer {
    D{i:0;uuid:"9e724508-9afe-5920-93f6-8b20479c50b0"}D{i:1;uuid:"0dc9e12b-50ba-582a-a400-b7ddfbf19ec6"}
D{i:2;uuid:"263944fd-4483-58e8-87b4-6c567685893d"}D{i:3;uuid:"ae53dbf7-16b8-5a52-a7ed-4a86da82236d"}
}
##^##*/

