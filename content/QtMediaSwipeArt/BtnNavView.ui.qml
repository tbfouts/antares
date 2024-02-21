import QtQuick
import QtQuick.Controls

TabButton {
    id: btnNavView
    width: 220
    height: 62
    autoExclusive: true
    checkable: true
    property alias carViewText: carView.text
    clip: true
    state: "state_Default"
    background: btnNavbkgrd

    Rectangle {
        id: btnNavbkgrd
        width: 220
        height: 62
        color: "#00000000"
        border.color: "#00000000"
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Text {
        id: carView
        width: 211
        height: 31
        color: "#ffffff"
        text: qsTrId("Navigation")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 6
        anchors.topMargin: 16
        font.letterSpacing: 0.281
        font.pixelSize: 36
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.DemiBold
        font.family: "Oxanium"
    }
    states: [
        State {
            name: "state_Default"
            when: !btnNavView.checked

            PropertyChanges {
                target: carView
                font.pixelSize: 24
                font.weight: Font.Light
            }
        },
        State {
            name: "state_Checked"
            when: btnNavView.checked

            PropertyChanges {
                target: carView
                font.pixelSize: 36
                font.weight: Font.DemiBold
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;uuid:"5cec316e-bf6a-52eb-841c-f72a22404c4e"}
}
##^##*/

