import QtQuick
import QtQuick.Controls

Rectangle {
    id: miniPlayer
    width: 354
    height: 262
    color: "transparent"
    property alias txtTrackText: txtTrack.text
    property alias txtArtistText: txtArtist.text

    TrackBar {
        id: trackBar
        width: 323
        height: 6
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 14
        anchors.topMargin: 108
    }

    Text {
        id: txtTrack
        width: 342
        height: 35
        color: "#e1e1e1"
        text: qsTrId("Celestial Echoes")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 14
        anchors.topMargin: 15
        font.letterSpacing: 0.281
        font.pixelSize: 33
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Bold
        font.family: "Oxanium"
    }

    Text {
        id: txtArtist
        width: 232
        height: 32
        color: "#b6b6b6"
        text: qsTrId("Stardust Mirage")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 22
        anchors.topMargin: 50
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Light
        font.family: "Oxygen"
    }

    BtnPlayMedia {
        id: btnPlayMedia
        width: 156
        height: 149
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 98
        anchors.topMargin: 123
        clip: true
    }


    BtnNext {
        id: btnNext
        width: 129
        height: 142
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 217
        anchors.topMargin: 130
        state: "state_Default"
        clip: true
    }

    BtnPrev {
        id: btnPrev
        width: 169
        height: 116
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: -15
        anchors.topMargin: 139
        state: "state_Default"
        clip: true
    }
}

/*##^##
Designer {
    D{i:0;uuid:"773cf5df-886b-5298-b2c7-226cf3f347b8"}D{i:1;uuid:"2f8f19e6-9190-5bce-8a26-b03ce748d316"}
D{i:2;uuid:"199d7373-b5ce-5af4-89c7-78a7dc3d5f7a"}D{i:3;uuid:"950b7d9e-6620-5fbc-8127-663c0ed1883b"}
D{i:4;uuid:"6beafc38-816c-531f-bc74-f963a640c28a"}D{i:5;uuid:"526e29bf-fba3-5a11-bdfb-a8d11412200c"}
D{i:6;uuid:"0a074bf1-3c10-5647-a791-b260a51c5ceb"}
}
##^##*/

