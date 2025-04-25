import QtQuick
import QtQuick.Controls
import Data 1.0 as Data

Rectangle {
    id: sideRTMediaPlayer
    width: 564
    height: 1020
    color: "transparent"

    Image {
        id: sideRTMediaPlayer1
        opacity: 0.906
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: -119
        source: "assets/sideRTMediaPlayer1.png"
    }

    MiniPlayer {
        id: miniPlayer
        width: 354
        height: 262
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 184
        anchors.topMargin: 546
        txtTrackText: Data.Themes.trackTitle
        txtArtistText: Data.Themes.trackArtist
        clip: true
    }

    AlbumArtComp {
        id: albumArtComp
        x: 196
        y: 228
        stardustMirageSource: Data.Themes.albumArt
    }
}

/*##^##
Designer {
    D{i:0;uuid:"c562b9ff-0b3a-5fa7-8277-b480d27adeb3"}D{i:1;uuid:"8ec55948-336f-5d1b-b8e4-f72e2a27db39"}
D{i:2;uuid:"9b201fde-7eb8-5927-9048-be7805e6926c"}
}
##^##*/

