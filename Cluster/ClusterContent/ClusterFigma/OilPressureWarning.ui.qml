import QtQuick
import QtQuick.Controls

Rectangle {
    id: oilPressureWarning
    width: 40
    height: 40
    color: "transparent"

    Image {
        id: oilPressureIcon
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: "assets/oilPressureIcon.png"
    }
}

/*##^##
Designer {
    D{i:0;uuid:"d4dea1d7-e968-5040-8bd8-c4306eb63e35"}D{i:1;uuid:"6bc99cbb-fbd2-5613-9036-087efe27631e"}
}
##^##*/

