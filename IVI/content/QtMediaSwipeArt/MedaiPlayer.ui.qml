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
        radius: 16
        border.color: Data.Themes.themeColor3
        gradient: Gradient {
            GradientStop {
                position: 0
                color: Data.Themes.themeColor2
            }

            GradientStop {
                position: 1
                color: "#000000"
            }

            orientation: Gradient.Vertical
        }
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
    D{i:0;uuid:"ac35268a-fc2f-5686-8907-da40284cb91e"}D{i:5;uuid:"998c6d86-0ade-5b4f-a4c3-d9ebf7e76874"}
D{i:6;uuid:"f0486293-3431-5fe4-bd11-bf0baf249f1a"}
}
##^##*/

