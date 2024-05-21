import QtQuick
import QtQuick.Controls

Rectangle {
    id: speedLimit_KPH
    width: 86
    height: 86
    color: "transparent"
    property alias txtKiSLText: txtKiSL.text

    Image {
        id: speedLimitEur_Bkgrd
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: "assets/speedLimitEur_Bkgrd.png"
    }

    Text {
        id: txtKiSL
        color: "#545454"
        text: qsTr("130")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 3
        anchors.rightMargin: 5
        anchors.topMargin: 21
        anchors.bottomMargin: 18
        font.letterSpacing: -1.797
        font.pixelSize: 30
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.DemiBold
        font.family: "Oxanium"
    }
}

/*##^##
Designer {
    D{i:0;uuid:"9b0c22d6-1750-52ca-8a94-c03d4fe3dac1"}D{i:1;uuid:"05074e88-0867-54c3-b8f6-1ee8e46c258a"}
D{i:2;uuid:"d0fa481a-0830-503e-b489-b4f40743cfc5"}
}
##^##*/

