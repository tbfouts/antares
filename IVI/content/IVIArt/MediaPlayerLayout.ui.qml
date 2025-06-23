import QtQuick
import QtQuick.Controls
import Data 1.0 as Data

Rectangle {
    id: mediaPlayerLayout
    width: 1920
    height: 1080
    color: Data.Themes.backgroundColor

    KnobComponent_1 {
        id: knobComponent
        width: 1148
        height: 999
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 808
        anchors.topMargin: 34
        eqBarsTopEQAnimationRunning: true
        eqBarsBottomEQAnimationRunning: true
        dialValue: -101
    }

    MediaPlayerWindow {
        id: mediaPlayerWindow
        width: 767
        height: 877
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 139
        anchors.topMargin: 95
        clip: true
    }
}

/*##^##
Designer {
    D{i:0;uuid:"0e2990a8-9472-5db2-980d-00a4f3530a02"}D{i:1;uuid:"b55ed149-828d-5963-ad2d-33c082c48591"}
D{i:2;uuid:"78eb8a21-04a0-511e-b6ec-3e67119c2ee5"}
}
##^##*/

