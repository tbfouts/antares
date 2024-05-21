import QtQuick
import QtQuick.Controls
import QtQuick.Studio.Components 1.0
import QtQuick.Shapes 1.0
import GLO 1.0

Rectangle {
    id: musicPlayer_Comp
    width: 647
    height: 206
    color: "transparent"
    property alias txtArtistText: txtArtist.text
    property alias txtTrackText: txtTrack.text

    SvgPathItem {
        id: musicPlayer_Border
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 7
        anchors.topMargin: 2
        anchors.bottomMargin: -2
        strokeWidth: 1
        strokeStyle: 1
        strokeColor: "#3f3f3f"
        path: "M 575.40283203125 10.497797012329102 C 573.0937287807465 4.192593574523926 567.0933880805969 0 560.378662109375 0 L 15.999985694885254 0 C 7.163430213928223 0 0 7.163444519042969 0 16 L 0 189.99998474121094 C 0 198.83654022216797 7.163443565368652 206 15.999999046325684 206 L 624.1012573242188 206 C 635.2201585769653 206 642.9490668773651 194.9385757446289 639.1254272460938 184.497802734375 L 575.40283203125 10.497797012329102 Z"
        joinStyle: 0
        fillColor: "#1e1e1e"
        antialiasing: true
    }

    Text {
        id: txtTrack
        color: "#c5c5c5"
        text: Themes.trackTitle
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 238
        anchors.rightMargin: 67
        anchors.topMargin: 14
        anchors.bottomMargin: 163
        font.letterSpacing: 0.281
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Bold
        font.family: "Oxanium"
    }

    Text {
        id: txtArtist
        color: "#b6b6b6"
        text: Themes.trackArtist
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 239
        anchors.rightMargin: 176
        anchors.topMargin: 40
        anchors.bottomMargin: 144
        font.pixelSize: 16
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Oxanium"
    }

    EqBars {
        id: eqBars
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 464
        anchors.rightMargin: 75
        anchors.topMargin: 36
        anchors.bottomMargin: 111
        clip: true
    }

    ArcItem {
        id: btnMediabkgrd
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 194
        anchors.rightMargin: 419
        anchors.topMargin: 19
        anchors.bottomMargin: 153
        strokeWidth: 0
        strokeStyle: 0
        strokeColor: "transparent"
        outlineArc: true
        fillColor: "#343434"
        end: 450.00001
        begin: 90
        arcWidth: 17
        antialiasing: true
    }

    SvgPathItem {
        id: btnPlay
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 208
        anchors.rightMargin: 431
        anchors.topMargin: 31
        anchors.bottomMargin: 165
        strokeWidth: 1
        strokeStyle: 1
        strokeColor: "transparent"
        path: "M 8 4.999997158172159 L 0 0 L 0 10 L 8 4.999997158172159 Z"
        joinStyle: 0
        fillColor: "#d9d9d9"
        antialiasing: true
    }

    SvgPathItem {
        id: btnPause
        visible: false
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 208
        anchors.rightMargin: 432
        anchors.topMargin: 30
        anchors.bottomMargin: 164
        strokeWidth: 1
        strokeStyle: 1
        strokeColor: "transparent"
        path: "M 2.1875 0 L 0 0 L 0 12 L 2.1875 12 L 2.1875 0 Z M 7 0 L 4.8125 0 L 4.8125 12 L 7 12 L 7 0 Z"
        joinStyle: 0
        fillColor: "#d9d9d9"
        antialiasing: true
    }
}

/*##^##
Designer {
    D{i:0;uuid:"541b14fb-8968-5e8b-9580-7cf5fd91e869"}D{i:1;uuid:"8a985107-73fd-537e-ade1-5434eb8a23f0"}
D{i:2;uuid:"624c0205-7bfe-5a54-b172-8dcf6c0a26ac"}D{i:3;uuid:"b07380fd-a5a4-5a6c-a91d-638b6bcf4c87"}
D{i:4;uuid:"91636d04-bcc0-5cad-8cc3-182f6878ce1c"}D{i:5;uuid:"a510a585-2ce4-548b-8602-c33a2139bcf2"}
D{i:6;uuid:"1bab5bf4-a0a2-54ba-9b76-b383f7644ec6"}D{i:7;uuid:"21bb51b9-eec9-58ed-aaef-56a1f31d7534"}
}
##^##*/

