import QtQuick
import QtQuick.Controls
import QtQuick.Timeline 1.0
import Data 1.0 as Data

Rectangle {
    id: trackBar
    width: 323
    height: 6
    color: "transparent"

    Rectangle {
        id: vecSongFullLength
        width: 323
        height: 6
        color: "#9494a8"
        radius: 2
        anchors.left: parent.left
        anchors.top: parent.top
    }

    Rectangle {
        id: vecSongplayed
        width: 323
        height: 6
        color: "#8bf3fa"
        radius: 2
        anchors.left: parent.left
        anchors.top: parent.top
    }

    Timeline {
        id: timelineSongDuration
        animations: [
            TimelineAnimation {
                id: songDurAnimation
                paused: Data.Themes.animPaused
                running: Data.Themes.animRunning
                loops: 1
                duration: 80000
                to: 10000
                from: 0
            }
        ]
        startFrame: 0
        endFrame: 10000
        enabled: true

        KeyframeGroup {
            target: vecSongplayed
            property: "width"
            Keyframe {
                value: 0
                frame: 0
            }

            Keyframe {
                value: 323
                frame: 10000
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;uuid:"ffbe9355-0a5e-5085-a827-88dbd678fefe"}D{i:2;uuid:"a55113a1-e52d-57fb-acfd-1131bb07aea2"}
}
##^##*/

