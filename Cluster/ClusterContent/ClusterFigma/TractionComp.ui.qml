import QtQuick
import QtQuick.Controls

Rectangle {
    id: tractionComp
    width: 218
    height: 35
    color: "transparent"
    property alias txtTracCtrlText: txtTracCtrl.text
    property alias txtRWDText: txtRWD.text

    Text {
        id: txtTracCtrl
        width: 142
        height: 35
        color: "#6e6d69"
        text: qsTr("TRACTION: ")
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
        id: txtRWD
        width: 64
        height: 35
        color: "#f2f2f2"
        text: qsTr("RWD")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 151
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
    D{i:0;uuid:"86c69bab-ebc7-5ba1-a104-12af1993ad5a"}D{i:1;uuid:"ac9924f7-0446-5e2c-a42f-959de2e2f9c4"}
D{i:2;uuid:"b6f64380-848a-5db3-83a6-a52f0d3fc331"}
}
##^##*/

