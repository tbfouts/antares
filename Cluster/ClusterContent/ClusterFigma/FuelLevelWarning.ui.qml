import QtQuick
import QtQuick.Controls

Rectangle {
    id: fuelLevelWarning
    width: 40
    height: 40
    color: "transparent"

    Image {
        id: fuelLevelIcon
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/fuelLevelIcon.png"
    }
}

/*##^##
Designer {
    D{i:0;uuid:"c59ea79e-1ff1-5b39-a73f-9ff2c5ac54cc"}D{i:1;uuid:"c69024a1-f46c-5289-b22f-32ce622e2157"}
}
##^##*/

