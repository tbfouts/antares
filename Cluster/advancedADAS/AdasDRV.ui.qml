import QtQuick
import QtQuick.Controls

Rectangle {
    id: adasDRV
    width: 851
    height: 649
    color: "transparent"
    property alias txtADASEngText: txtADASEng.text

    Image {
        id: adasBorder
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 124
        anchors.topMargin: 160
        source: "assets/adasBorder.png"
    }

    Text {
        id: txtADASEng
        width: 389
        height: 31
        color: "#818181"
        text: qsTr("ADAS ENGAGED")
        anchors.verticalCenter: parent.verticalCenter
        font.letterSpacing: 7.594
        font.pixelSize: 40
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Oxanium"
        anchors.verticalCenterOffset: 202
        anchors.horizontalCenterOffset: 9
        anchors.horizontalCenter: parent.horizontalCenter
    }

    ADAS_FRT {
        id: aDAS_FRT
        width: 117
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 367
        anchors.topMargin: 142
    }

    ADAS_RT {
        id: aDAS_RT
        width: 145
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 606
        anchors.topMargin: 259
        rotation: 60.711
    }

    ADAS_LT {
        id: aDAS_LT
        width: 145
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 116
        anchors.topMargin: 241
        rotation: -60
    }
}

/*##^##
Designer {
    D{i:0;uuid:"110f5d8c-5d30-531b-b778-2aca5c38a693"}D{i:1;uuid:"dac85b4b-8afe-559c-8ea0-f989f2c9cc1b"}
D{i:2;uuid:"fc54a9e4-b187-5b29-8b15-06bb5b4b8f2c"}D{i:3;uuid:"66fae9aa-5827-5d47-889e-06982c06ad56"}
D{i:4;uuid:"bb3702d0-bbab-58ab-9295-29bc2d33f657"}D{i:5;uuid:"ae110756-63e9-54d7-a322-cac811537b77"}
}
##^##*/

