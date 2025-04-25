import QtQuick
import QtQuick.Controls

Rectangle {
    id: seatBeltWarning
    width: 40
    height: 40
    color: "transparent"

    Image {
        id: seatBeltIcon
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: "assets/seatBeltIcon.png"
    }
}

/*##^##
Designer {
    D{i:0;uuid:"5dfb9987-6d98-5a2b-b5a1-881f37cfdb4d"}D{i:1;uuid:"d97fd6d5-49e3-5076-a193-73ad2a0f91a1"}
}
##^##*/

