import QtQuick
import QtQuick.Controls

Rectangle {
    id: batteryWarning
    width: 40
    height: 40
    color: "transparent"

    Image {
        id: batteryIcon
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: "assets/batteryIcon.png"
    }
}

/*##^##
Designer {
    D{i:0;uuid:"16b249a8-5e49-55e6-b0a5-def70e6c947d"}D{i:1;uuid:"eb5bda4a-84f7-5884-881d-0ee8dfa3eb36"}
}
##^##*/

