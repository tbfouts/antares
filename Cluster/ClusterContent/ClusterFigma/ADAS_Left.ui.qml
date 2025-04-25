import QtQuick
import QtQuick.Controls
import QtQuick.Studio.Components 1.0

Rectangle {
    id: aDAS_Left
    width: 81
    height: 22
    color: "transparent"
    property alias adasLtLeve1Opacity: adasLtLeve1.opacity
    property alias adasLtLeve1FillColor: adasLtLeve1.fillColor
    property alias adasLtLeve2FillColor: adasLtLeve2.fillColor
    property alias adasLtLeve2Opacity: adasLtLeve2.opacity
    property alias adasLtLeve3FillColor: adasLtLeve3.fillColor
    property alias adasLtLeve3Opacity: adasLtLeve3.opacity
    rotation: -80.485

    SvgPathItem {
        id: adasLtLeve3
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 32
        anchors.rightMargin: 32
        anchors.topMargin: -20
        anchors.bottomMargin: -38
        strokeWidth: 1
        strokeStyle: 1
        strokeColor: "transparent"
        rotation: 80.485
        path: "M 0 77.7142333984375 L 12.888738632202148 0.8181379437446594 L 17.081668853759766 0 L 3.6918447017669678 79.8856430053711 L 0 77.7142333984375 Z"
        joinStyle: 0
        fillColor: "#cfc93b"
        antialiasing: true
    }

    SvgPathItem {
        id: adasLtLeve2
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 33
        anchors.rightMargin: 34
        anchors.topMargin: -18
        anchors.bottomMargin: -19
        strokeWidth: 1
        strokeStyle: 1
        strokeColor: "transparent"
        rotation: 80.485
        path: "M 0 57.39466857910156 L 9.547212600708008 0.43459877371788025 L 13.675856590270996 0 L 3.757469654083252 59.1745491027832 L 0 57.39466857910156 Z"
        joinStyle: 0
        fillColor: "#cfc93b"
        antialiasing: true
    }

    SvgPathItem {
        id: adasLtLeve1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 35
        anchors.rightMargin: 36
        anchors.topMargin: -18
        anchors.bottomMargin: 0
        strokeWidth: 1
        strokeStyle: 1
        strokeColor: "transparent"
        rotation: 80.485
        path: "M 0 38.04270553588867 L 6.364809036254883 0.06932514160871506 L 10.432228088378906 0 L 3.819969892501831 39.44969940185547 L 0 38.04270553588867 Z"
        joinStyle: 0
        fillColor: "#cfc93b"
        antialiasing: true
    }
}

/*##^##
Designer {
    D{i:0;uuid:"fc54a9e4-b187-5b29-8b15-06bb5b4b8f2c"}D{i:1;uuid:"571ac1d2-baaf-50a0-b656-035f028f09b6"}
D{i:2;uuid:"d28254dc-1d2d-5b7f-ab21-6ffa402c2564"}D{i:3;uuid:"67f3db5f-afe9-525b-9746-0bd153e114e3"}
}
##^##*/

