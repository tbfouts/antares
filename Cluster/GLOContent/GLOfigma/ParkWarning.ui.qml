import QtQuick
import QtQuick.Controls

Rectangle {
    id: parkWarning
    width: 40
    height: 40
    color: "transparent"

    Image {
        id: parkWarningIcon
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: "assets/parkWarningIcon.png"
    }
}

/*##^##
Designer {
    D{i:0;uuid:"cc530034-3367-56ea-b228-07e3230e7fc8"}D{i:1;uuid:"f4bc3ecc-e4d9-581e-95f5-093e8ce3f1c0"}
}
##^##*/

