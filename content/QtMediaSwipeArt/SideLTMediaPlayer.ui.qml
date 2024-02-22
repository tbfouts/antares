import QtQuick
import QtQuick.Controls
import Data 1.0 as Data

Rectangle {
    id: sideLTMediaPlayer
    width: 444
    height: 1020
    color: "transparent"

    Image {
        id: sideLTMediaPlayer1
        x: -60
        opacity: 1
        source: "assets/sideRTMediaPlayer1.png"
        rotation: 180
    }

    MiniPlayer {
        id: miniPlayer
        width: 354
        height: 262
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 45
        anchors.topMargin: 544
        txtTrackText: Data.Themes.trackTitle
        txtArtistText: Data.Themes.trackArtist
        clip: true
    }

    AlbumArtComp {
        id: albumArtComp
        x: 59
        y: 213
        stardustMirageSource: Data.Themes.albumArt
    }
}

/*##^##
Designer {
    D{i:0;uuid:"2cc01c3e-841c-5f97-94b6-596d44cfc31c"}D{i:1;uuid:"4769fa10-d36c-592a-af34-00c44a077ac8"}
D{i:2;uuid:"6066176f-3935-5796-855a-cfed96f11ed8"}
}
##^##*/

