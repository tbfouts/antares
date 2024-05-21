import QtQuick
import QtQuick.Controls
import QtQuick.Studio.DesignEffects

Rectangle {
    id: bkgrdRectangleSmall
    width: 885
    height: 890
    color: "transparent"

    Image {
        id: rectangleSmall
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 5
        source: "assets/rectangleSmall.png"
    }
}

/*##^##
Designer {
    D{i:0;uuid:"2d5cf3a1-ed5c-5386-986a-94395d1c1b7d"}D{i:1;uuid:"d9ee73d3-2f25-5b89-9825-071b1e2b47f6"}
}
##^##*/

