import QtQuick
import QtQuick.Controls
import QtQuick.Studio.Components 1.0

Rectangle {
    id: bottomBarSwipe
    width: 1920
    height: 60
    color: "transparent"
    property alias mediaPlayerText: mediaPlayer.text
    property alias navigationText: navigation.text
    property alias carViewText: carView.text
    state: "CarView"

    Rectangle {
        id: topBarBkgrd
        opacity: 0.647
        color: "#000000"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
    }

    Text {
        id: mediaPlayer
        width: 211
        height: 31
        color: "#ffffff"
        text: qsTrId("Media Player")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 856
        anchors.topMargin: 15
        font.letterSpacing: 0.281
        font.pixelSize: 32
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.DemiBold
        font.family: "Oxanium"
    }

    Text {
        id: carView
        width: 211
        height: 31
        color: "#ffffff"
        text: qsTrId("Car View")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 107
        anchors.topMargin: 15
        font.letterSpacing: 0.281
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Light
        font.family: "Oxanium"
    }

    Text {
        id: navigation
        width: 211
        height: 31
        color: "#ffffff"
        text: qsTrId("Navigation")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 1605
        anchors.topMargin: 15
        font.letterSpacing: 0.281
        font.pixelSize: 24
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Light
        font.family: "Oxanium"
    }

    SvgPathItem {
        id: arrowLeft
        width: 35
        height: 35
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 29
        anchors.topMargin: 13
        strokeWidth: 2
        strokeStyle: 1
        strokeColor: "#f7f7f7"
        path: "M 0 17.320510864257812 L 34.5 0 L 34.5 34.641021728515625 L 0 17.320510864257812 Z"
        joinStyle: 0
        fillColor: "transparent"
        antialiasing: true
    }

    SvgPathItem {
        id: arrowRight
        width: 35
        height: 35
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 1858
        anchors.topMargin: 13
        strokeWidth: 2
        strokeStyle: 1
        strokeColor: "#f7f7f7"
        rotation: -180
        path: "M 0 17.320510864257812 L 34.5 0 L 34.5 34.641021728515625 L 0 17.320510864257812 Z"
        joinStyle: 0
        fillColor: "transparent"
        antialiasing: true
    }
    states: [
        State {
            name: "CarView"

            PropertyChanges {
                target: navigation
                visible: true
                text: qsTrId("Media Player")
            }

            PropertyChanges {
                target: carView
                visible: false
                text: qsTrId("Car View")
            }

            PropertyChanges {
                target: arrowLeft
                visible: false
            }

            PropertyChanges {
                target: mediaPlayer
                text: qsTrId("Car View")
            }

            PropertyChanges {
                target: arrowRight
                visible: true
            }
        },
        State {
            name: "Navigation"

            PropertyChanges {
                target: navigation
                visible: false
                text: qsTrId("Navigation")
            }

            PropertyChanges {
                target: carView
                visible: true
                text: qsTrId("Media Player")
            }

            PropertyChanges {
                target: arrowRight
                visible: false
            }

            PropertyChanges {
                target: mediaPlayer
                text: qsTrId("Navigation")
            }

            PropertyChanges {
                target: arrowLeft
                visible: true
            }
        },
        State {
            name: "MediaPlayer"

            PropertyChanges {
                target: navigation
                visible: true
                text: qsTrId("Navigation")
            }

            PropertyChanges {
                target: carView
                visible: true
                text: qsTrId("Car View")
            }

            PropertyChanges {
                target: arrowRight
                visible: true
            }

            PropertyChanges {
                target: arrowLeft
                visible: true
            }

            PropertyChanges {
                target: mediaPlayer
                text: qsTrId("Media Player")
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;uuid:"d053fe07-63e1-56fe-b3e8-b2cfe24d7129"}D{i:1;uuid:"c46c01d1-a162-516b-befb-092f691227d4"}
D{i:2;uuid:"0d0ee489-0bcf-5844-ae85-1746feb5ef0d"}D{i:3;uuid:"3c0cc873-e302-5dbb-b04a-cc4197540d5a"}
D{i:4;uuid:"83eca93b-b47f-5b55-a578-2a002b4959bc"}D{i:5;uuid:"f8b385ad-85a0-5393-9121-a06e791728b6"}
D{i:6;uuid:"20465a12-776c-55b5-b248-52e2915ab2a7"}
}
##^##*/

