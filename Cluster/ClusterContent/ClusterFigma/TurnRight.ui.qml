import QtQuick
import QtQuick.Controls

Rectangle {
    id: turnRight
    width: 50
    height: 50
    color: "transparent"

    Image {
        id: turnRightIcon
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: "assets/turnRightIcon.png"
    }
}

/*##^##
Designer {
    D{i:0;uuid:"dcd00e3c-2b26-5497-8a8f-335d5ce1fd6c"}D{i:1;uuid:"85f68087-2877-565b-8aaf-02690c158544"}
}
##^##*/

