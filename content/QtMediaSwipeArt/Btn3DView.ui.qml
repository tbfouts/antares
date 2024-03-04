import QtQuick
import QtQuick.Controls

Rectangle {
    id: btn3DView
    width: 100
    height: 60
    color: "transparent"
    property alias txtViewText: txtView.text
    clip: true
    state: "state_Checked"

    Rectangle {
        id: btn3DViewBkgrd
        width: 80
        color: "#00000000"
        radius: 10
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 10
        anchors.topMargin: 5
    }

    Rectangle {
        id: btn3DViewBorder
        width: 80
        color: "transparent"
        radius: 10
        border.color: "#ffffff"
        border.width: 2
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 10
        anchors.topMargin: 5
    }

    Text {
        id: txtView
        width: 68
        color: "#ffffff"
        text: qsTrId("BASE")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 17
        anchors.topMargin: 21
        font.letterSpacing: 0.281
        font.pixelSize: 16
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Light
        font.family: "Oxanium"
    }
    states: [
        State {
            name: "state_Default"

            PropertyChanges {
                target: btn3DViewBorder
                visible: false
            }
        },
        State {
            name: "state_Checked"

            PropertyChanges {
                target: btn3DViewBorder
                visible: true
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;uuid:"f8412e6a-c647-51b0-8fbb-2f56a4633ad3"}D{i:1;uuid:"a60d04f1-0654-58e3-b03d-b53ca88d533d"}
D{i:2;uuid:"caa524ed-8541-5835-ac1e-d90bc81140dc"}D{i:3;uuid:"0167cc1d-a692-5d5d-b7b8-9e3072000ee4"}
}
##^##*/

