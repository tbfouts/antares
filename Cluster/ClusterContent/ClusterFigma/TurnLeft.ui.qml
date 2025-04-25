import QtQuick
import QtQuick.Controls
import QtQuick.Timeline 1.0

Rectangle {
    id: turnLeft
    width: 50
    height: 50
    color: "transparent"

    Image {
        id: turnLeftIcon
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: "assets/turnLeftIcon.png"
    }
}

/*##^##
Designer {
    D{i:0;uuid:"2344a885-d124-5e58-aed5-27aaeb91aec7"}D{i:1;uuid:"48d43fdf-7ebc-5908-a81c-d99b58c97bec"}
}
##^##*/

