import QtQuick
import QtQuick.Controls

Rectangle {
    id: albumArtComp
    width: 302
    height: 302
    color: "transparent"
    border.color: "#00000000"
    border.width: 0
    property alias stardustMirageSource: stardustMirage.source

    Image {
        id: stardustMirage
        anchors.verticalCenter: parent.verticalCenter
        source: "assets/stardustMirage.png"
        anchors.horizontalCenter: parent.horizontalCenter
    }
}

/*##^##
Designer {
    D{i:0;uuid:"7f027c87-47a4-5841-a0f6-85cb2c493b0f"}D{i:1;uuid:"d29c80f0-c210-56f3-a9f2-1cbb0b2cf593"}
}
##^##*/

