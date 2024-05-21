import QtQuick
import QtQuick.Controls

Rectangle {
    id: tpmsWarning
    width: 40
    height: 40
    color: "transparent"

    Image {
        id: tpmsIcon
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: "assets/tpmsIcon.png"
    }
}

/*##^##
Designer {
    D{i:0;uuid:"11c40061-4a30-53f3-8fcb-671c02a0da2b"}D{i:1;uuid:"4000d127-dc00-5e24-95f7-0057c82a8f3c"}
}
##^##*/

