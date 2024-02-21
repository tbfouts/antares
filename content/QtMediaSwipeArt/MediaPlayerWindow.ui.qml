import QtQuick
import QtQuick.Controls

Rectangle {
    id: mediaPlayerWindow
    width: 767
    height: 877
    color: "transparent"

    ScrollListPanel {
            id: scrollListPanel
            x: 0
            y: 0
            width: 734
            height: 514
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 16
            anchors.topMargin: 369
            clip: false
    }

    MedaiPlayer {
        id: medaiPlayer
        width: 734
        height: 356
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 16
        anchors.topMargin: 21
    }

}

/*##^##
Designer {
    D{i:0;uuid:"2712b56b-a381-5428-8f53-9e11ed5bd370"}
}
##^##*/

