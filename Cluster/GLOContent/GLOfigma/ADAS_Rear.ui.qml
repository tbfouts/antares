import QtQuick
import QtQuick.Controls
import QtQuick.Studio.Components 1.0

Rectangle {
    id: aDAS_Rear
    width: 81
    height: 22
    color: "transparent"
    rotation: -180

    SvgPathItem {
        id: adasRRLeve3
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: 18
        strokeWidth: 1
        strokeStyle: 1
        strokeColor: "transparent"
        rotation: 180
        path: "M 79.46875 4 L 1.5 4 L 0 0 L 81 0 L 79.46875 4 Z"
        joinStyle: 0
        fillColor: "#cfc93b"
        antialiasing: true
    }

    SvgPathItem {
        id: adasRRLeve2
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 11
        anchors.rightMargin: 10
        anchors.topMargin: 9
        anchors.bottomMargin: 9
        strokeWidth: 1
        strokeStyle: 1
        strokeColor: "transparent"
        rotation: 180
        path: "M 58.86573791503906 4 L 1.1111106872558594 4 L 0 0 L 59.999996185302734 0 L 58.86573791503906 4 Z"
        joinStyle: 0
        fillColor: "#cfc93b"
        antialiasing: true
    }

    SvgPathItem {
        id: adasRRLeve1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 21
        anchors.rightMargin: 20
        anchors.bottomMargin: 18
        strokeWidth: 1
        strokeStyle: 1
        strokeColor: "transparent"
        rotation: 180
        path: "M 39.24382781982422 4 L 0.7407417297363281 4 L 0 0 L 40 0 L 39.24382781982422 4 Z"
        joinStyle: 0
        fillColor: "#cfc93b"
        antialiasing: true
    }
}

/*##^##
Designer {
    D{i:0;uuid:"069b976e-953a-5bd8-94f0-c8457df85573"}D{i:1;uuid:"ce882a61-f3fe-5ba5-af11-51af082b318b"}
D{i:2;uuid:"aeb36b4c-9c07-5968-b598-47829bd73429"}D{i:3;uuid:"f18d6417-6b54-5c85-ac9e-bdba6768dc68"}
}
##^##*/

