import QtQuick
import QtQuick.Controls
import Cluster 1.0
import VehicleData

Rectangle {
    id: driveMode
    width: 291
    height: 35
    color: "transparent"
    property alias txtModeText: txtMode.text
    property alias txtDriveModeText: txtDriveMode.text

    Text {
        id: txtDriveMode
        width: 173
        height: 35
        color: "#6e6d69"
        text: qsTr("DRIVE MODE:")
        anchors.left: parent.left
        anchors.top: parent.top
        font.pixelSize: 28
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        font.weight: Font.Normal
        font.family: "Oxanium"
    }

    Text {
        id: txtMode
        width: 89
        height: 35
        color: "#f2f2f2"
        text: VehicleData.driveMode
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 186
        font.pixelSize: 28
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        font.weight: Font.Normal
        font.family: "Oxanium"
    }
}

/*##^##
Designer {
    D{i:0;uuid:"061fadf2-1a60-56b1-a79f-5963884ede50"}D{i:1;uuid:"a59d46c8-0b66-5a87-bb9f-5ed6174da33f"}
D{i:2;uuid:"0d6d71ef-1c5a-5708-ad0d-a757f32008eb"}
}
##^##*/

