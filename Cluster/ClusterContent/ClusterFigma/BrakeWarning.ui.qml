import QtQuick
import QtQuick.Controls

Rectangle {
    id: brakeWarning
    width: 40
    height: 40
    color: "transparent"

    Image {
        id: brakeWarningIcon
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: "assets/brakeWarningIcon.png"
    }
}

/*##^##
Designer {
    D{i:0;uuid:"32b9049d-70a9-5cb3-a21d-576d2635d72c"}D{i:1;uuid:"6a6bf539-130f-54e3-a6a1-f810586c26c9"}
}
##^##*/

