import QtQuick
import QtQuick.Controls
import GLO 1.0

Rectangle {
    id: clock
    width: 166
    height: 50
    color: "transparent"
    // property alias txtClockampmText: txtClockampm.text
    property alias txtClockTimeText: txtClockTime.text

    // Text {
    //     id: txtClockampm
    //     width: 87
    //     height: 50
    //     color: "#b3b3b3"
    //     text: qsTr("am")
    //     anchors.left: parent.left
    //     anchors.top: parent.top
    //     anchors.leftMargin: 109
    //     font.pixelSize: 40
    //     horizontalAlignment: Text.AlignLeft
    //     verticalAlignment: Text.AlignTop
    //     wrapMode: Text.Wrap
    //     font.weight: Font.Light
    //     font.family: "Oxanium"
    // }
    Text {
        id: txtClockTime
        width: 115
        height: 50
        color: "#b3b3b3"
        text: DateTime.timeString
        anchors.left: parent.left
        anchors.top: parent.top
        font.pixelSize: 40
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Light
        font.family: "Oxanium"
    }
}

/*##^##
Designer {
    D{i:0;uuid:"a4ae23fe-ffc7-547c-aa50-de18262a629b"}D{i:1;uuid:"02b14f94-9441-5746-b90a-e3b828caf4ea"}
}
##^##*/

