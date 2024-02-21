import QtQuick
import QtQuick.Controls

TabButton {
    id: btnVehicleView
    width: 220
    height: 62
    checked: false
    autoExclusive: true
    checkable: true
    property alias carViewText: carView.text
    clip: true
    state: "state_Default"
    background: btnVVbkgrd

    Rectangle {
        id: btnVVbkgrd
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
        text: qsTrId("Vehicle")
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
            when: !btnVehicleView.checked

            PropertyChanges {
                target: carView
                font.pixelSize: 24
                font.weight: Font.Light
            }
        },
        State {
            name: "state_Checked"
            when: btnVehicleView.checked

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
    D{i:0;uuid:"87c6a063-7d45-5b2e-aaad-6c21ceec36d0"}
}
##^##*/

