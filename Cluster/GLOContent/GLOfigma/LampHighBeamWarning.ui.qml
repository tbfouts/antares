import QtQuick
import QtQuick.Controls

Rectangle {
    id: lampHighBeamWarning
    width: 40
    height: 40
    color: "transparent"

    Image {
        id: lampHighBeamIcon
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: "assets/lampHighBeamIcon.png"
    }
}

/*##^##
Designer {
    D{i:0;uuid:"c7b10884-45da-5b98-a6fb-5b926c7b7c9b"}D{i:1;uuid:"e998889e-945e-537d-8eb3-3cacb5c7aee7"}
}
##^##*/

