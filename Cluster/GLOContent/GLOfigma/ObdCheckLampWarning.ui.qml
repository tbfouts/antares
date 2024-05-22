import QtQuick
import QtQuick.Controls

Rectangle {
    id: obdCheckLampWarning
    width: 40
    height: 40
    color: "transparent"

    Image {
        id: obdCheckLampIcon
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: "assets/obdCheckLampIcon.png"
    }
}

/*##^##
Designer {
    D{i:0;uuid:"72885707-cbea-565a-ae97-b0576e7cef5f"}D{i:1;uuid:"f0ba3bcd-abcf-5642-ba0b-2156e88c60a9"}
}
##^##*/

