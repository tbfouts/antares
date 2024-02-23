import QtQuick
import QtQuick.Controls
import QtQuick.Timeline 1.0
import Data 1.0 as Data

Rectangle {
    id: trackBar
    width: 323
    height: 6
    color: "transparent"
    state: "playing"

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

    // commenting this out for now because the TimelineAnimation emits finished when it is paused which erroneously triggers this(!)
    // Connections {
    //     target: songDurAnimation
    //     onStopped: {
    //         Data.Themes.nextTrack()
    //         songDurAnimation.restart()
    //     }
    // }

    Timeline {
        id: timelineSongDuration
        animations: [
            TimelineAnimation {
                id: songDurAnimation
                alwaysRunToEnd: false
                paused: Data.Themes.animPaused
                running: true
                loops: 1
                duration: 80000
                to: 10000
                from: 0
            }
        ]
        startFrame: 0
        endFrame: 10000
        enabled: false

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

    Timeline {
        id: timelineIdle
        animations: [
            TimelineAnimation {
                id: timelineIdleAnimation
                onFinished: trackBar.state = "playing"
                running: true
                loops: 1
                duration: 1000
                to: 1000
                from: 0
            }
        ]
        startFrame: 0
        endFrame: 1000
        enabled: false
    }
    states: [
        State {
            name: "idle"

            PropertyChanges {
                target: timelineSongDuration
            }

            PropertyChanges {
                target: vecSongFullLength
                width: 323
            }

            PropertyChanges {
                target: vecSongplayed
                width: 0
            }

            PropertyChanges {
                target: timelineIdleAnimation
                running: true
            }
        },
        State {
            name: "playing"

            PropertyChanges {
                target: timelineSongDuration
                enabled: true
            }

            PropertyChanges {
                target: songDurAnimation
                running: true

            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;uuid:"ffbe9355-0a5e-5085-a827-88dbd678fefe"}D{i:2;uuid:"a55113a1-e52d-57fb-acfd-1131bb07aea2"}
}
##^##*/

