import QtQuick
import QtQuick.Controls
import Data 1.0 as Data

Button {
    id: artistTrackBtn
    width: 734
    height: 53
    checkable: true
    background: artistTrackbkgrd
    property alias elementText: timeDuration.text
    property alias artistInfoText: albumInfo.text
    property string theme: "stardust"
    state: theme === Data.Themes.state ? "Playing" : "Default"

    // onStateChanged: console.log(albumInfo.text)
    Rectangle {
        id: artistTrackbkgrd
        x: 16
        y: 7
        width: 707
        height: 38
        visible: false
        color: "#4d737373"
        radius: 14
        clip: true
    }

    Text {
        id: albumInfo
        x: 20
        y: 1
        width: 660
        height: 38
        color: "#249bce"
        text: qsTrId("Stardust Mirage - \"Celestial Echoes")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 28
        anchors.topMargin: 7
        font.pixelSize: 26
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Bold
        font.family: "Oxanium"
    }

    Text {
        id: timeDuration
        x: 581
        y: 5
        width: 129
        height: 34
        color: "#249bce"
        text: qsTrId("4:20")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 589
        anchors.topMargin: 11
        font.letterSpacing: 0.281
        font.pixelSize: 24
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Monofonto"
    }

    Connections {
        target: artistTrackBtn
        onReleased: Data.Themes.animRunning = true
    }

    states: [
        State {
            name: "Default"

            when: !artistTrackBtn.checked
            PropertyChanges {
                target: timeDuration
                color: "#C5C5C5"
            }

            PropertyChanges {
                target: albumInfo
                color: "#C5C5C5"
                font.weight: Font.Normal
            }

            PropertyChanges {
                target: artistTrackbkgrd
                visible: false
                color: "transparent"
            }
        },
        State {
            name: "Playing"

            when: artistTrackBtn.checked
            PropertyChanges {
                target: timeDuration
                color: "#ffffff"
            }

            PropertyChanges {
                target: albumInfo
                color: "#ffffff"
                font.pixelSize: 28
                font.weight: Font.Bold
            }

            PropertyChanges {
                target: artistTrackbkgrd
                visible: true
                color: "#4d737373"
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;uuid:"ef4602bd-d182-57f6-88cb-fca904d3dd1e"}
}
##^##*/

