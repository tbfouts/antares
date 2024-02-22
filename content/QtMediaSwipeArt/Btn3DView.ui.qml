import QtQuick
import QtQuick.Controls
import Data 1.0 as Data

Button {
    id: btn3DView
    width: 90
    height: 60
    autoExclusive: true
    checkable: true
    property alias txtViewText: txtView.text
    clip: true
    state: "state_Default"
    background: btn3DViewBkgrd

    Rectangle {
        id: btn3DViewBkgrd
        width: 80
        height: 50
        color: "#00000000"
        radius: 10
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 5
        anchors.topMargin: 5
    }

    Rectangle {
        id: btn3DViewBorder
        width: 80
        height: 50
        color: "transparent"
        radius: 10
        border.color: "#ffffff"
        border.width: 2
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 5
        anchors.topMargin: 5
    }

    Text {
        id: txtView
        width: 68
        height: 19
        color: "#ffffff"
        text: qsTrId("BASE")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 12
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
            when: !btn3DView.checked

            PropertyChanges {
                target: btn3DViewBorder
                visible: true
                border.width: 0
            }
        },
        State {
            name: "state_Checked"
            when: btn3DView.checked

            PropertyChanges {
                target: btn3DViewBorder
                visible: true
                border.color: Data.Themes.themeColor1
                border.width: 3
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;uuid:"f8412e6a-c647-51b0-8fbb-2f56a4633ad3"}D{i:1;uuid:"a60d04f1-0654-58e3-b03d-b53ca88d533d"}
}
##^##*/

