import QtQuick
import QtQuick.Controls

Rectangle {
    id: absWarning
    width: 40
    height: 40
    color: "transparent"

    Image {
        id: absIcon
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: "assets/absIcon.png"
    }
}

/*##^##
Designer {
    D{i:0;uuid:"a76f3502-832f-535e-874c-3e56a7bc0f56"}D{i:1;uuid:"0c2f9903-c4c7-51ef-8747-cfc4e56ecbd3"}
}
##^##*/

