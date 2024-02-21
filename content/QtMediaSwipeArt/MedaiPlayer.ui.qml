import QtQuick
import QtQuick.Controls
import Data 1.0 as Data

Rectangle {
    id: medaiPlayer
    width: 734
    height: 356
    color: "transparent"

    Rectangle {
        id: backgroundMediaPlayer
        x: -1
        y: -1
        width: 737
        height: 359
        opacity: 1
        visible: true
        color: "#717171"
        radius: 16
        border.color: "#d5d5d5"
    }



    MiniPlayer {
        id: miniPlayer
        width: 354
        height: 262
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 349
        anchors.topMargin: 54
        txtTrackText: Data.Themes.trackTitle
        txtArtistText: Data.Themes.trackArtist
        clip: true
    }




    AlbumArtComp {
        id: albumArtComp
        width: 302
        height: 302
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 25
        anchors.topMargin: 26
        stardustMirageSource: Data.Themes.albumArt
        clip: true
    }

}

/*##^##
Designer {
    D{i:0;uuid:"ac35268a-fc2f-5686-8907-da40284cb91e"}D{i:2;uuid:"998c6d86-0ade-5b4f-a4c3-d9ebf7e76874"}
D{i:3;uuid:"f0486293-3431-5fe4-bd11-bf0baf249f1a"}D{i:4;uuid:"e333522d-eb61-5b31-bcc0-f2960d8eb71f"}
}
##^##*/

