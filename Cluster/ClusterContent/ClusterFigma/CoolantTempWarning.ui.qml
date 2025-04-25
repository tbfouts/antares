import QtQuick
import QtQuick.Controls

Rectangle {
    id: coolantTempWarning
    width: 40
    height: 40
    color: "transparent"

    Image {
        id: coolantTempIcon
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: "assets/coolantTempIcon.png"
    }
}

/*##^##
Designer {
    D{i:0;uuid:"5c7b625b-5a4a-56cd-9bff-98bffe59a4ac"}D{i:1;uuid:"b5020128-971f-5f22-803a-68a336133c1b"}
}
##^##*/

