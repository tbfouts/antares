import QtQuick
import QtQuick.Controls

Rectangle {
    id: slipWarning
    width: 40
    height: 40
    color: "transparent"

    Image {
        id: slipIcon
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/slipIcon.png"
    }
}

/*##^##
Designer {
    D{i:0;uuid:"0fdaf502-f30a-5fcc-adec-748c10f16122"}D{i:1;uuid:"2e3aa598-50dc-528c-861f-3b95ffe5de37"}
}
##^##*/

