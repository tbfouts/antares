import QtQuick
import QtQuick.Controls
import Data 1.0 as Data

Item {
    id: listViewTracks
    width: 730
    height: 500

    ArtistTrack {
        id: artistTrack
        width: 734
        height: 53
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: -2
        anchors.topMargin: 5
        checked: Data.Themes.listTrack1Checked
        autoExclusive: true
        theme: "stardust"

        clip: false

        Connections {
            target: artistTrack
            onPressed: Data.Themes.currentTheme = "stardust"
        }
    }

    ArtistTrack {
        id: artistTrack1
        width: 734
        height: 53
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: -2
        anchors.topMargin: 62
        checked: Data.Themes.listTrack2Checked
        autoExclusive: true
        theme: "luna"

        artistInfoText: "Luna Nova - \"Midnight Serenade\""
        elementText: "2:56"
        clip: false

        Connections {
            target: artistTrack1
            onPressed: {
                Data.Themes.currentTheme = "luna"
            }
        }
    }

    ArtistTrack {
        id: artistTrack2
        width: 734
        height: 53
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: -2
        anchors.topMargin: 119
        autoExclusive: true
        theme: "electric"

        artistInfoText: "Electric Dreamscape - \"Neon Reverie\""
        elementText: "3:11"
        clip: false

        Connections {
            target: artistTrack2
            onPressed: Data.Themes.currentTheme = "electric"
        }
    }

    ArtistTrack {
        id: artistTrack3
        width: 734
        height: 53
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: -2
        anchors.topMargin: 176
        checked: true
        autoExclusive: true
        theme: "pixel"

        artistInfoText: "Pixel Pulse - \"Digital Dreams\""
        elementText: "4:06"
        clip: false

        Connections {
            target: artistTrack3
            onPressed: Data.Themes.currentTheme = "pixel"
        }
    }

    ArtistTrack {
        id: artistTrack4
        width: 734
        height: 53
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: -2
        anchors.topMargin: 233
        autoExclusive: true
        theme: "crystal"

        artistInfoText: "Crystal Cascade - \"Iridescent Illusion\""
        elementText: "3:45"
        clip: false

        Connections {
            target: artistTrack4
            onPressed: Data.Themes.currentTheme = "crystal"
        }
    }

    ArtistTrack {
        id: artistTrack5
        width: 734
        height: 53
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: -2
        anchors.topMargin: 290
        autoExclusive: true
        artistInfoText: "Sonic Prism - \"Aurora Beats\""
        elementText: "3:48"
        clip: false
        theme: "sonic"

        Connections {
            target: artistTrack5
            onPressed: Data.Themes.currentTheme = "sonic"
        }
    }

    ArtistTrack {
        id: artistTrack6
        width: 734
        height: 53
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: -2
        anchors.topMargin: 347
        autoExclusive: true
        theme: "ethereal"

        artistInfoText: "Ethereal Essence - \"Whispers of the Wind\""
        elementText: "4:38"
        clip: false

        Connections {
            target: artistTrack6
            onPressed: Data.Themes.currentTheme = "ethereal"
        }
    }

    ArtistTrack {
        id: artistTrack7
        width: 734
        height: 53
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: -2
        anchors.topMargin: 404
        autoExclusive: true
        theme: "mind"

        artistInfoText: "Psychedelic Pulsar - \"Mind Warp\""
        elementText: "5:12"
        clip: false

        Connections {
            target: artistTrack7
            onPressed: Data.Themes.currentTheme = "mind"
        }
    }

    ArtistTrack {
        id: artistTrack8
        width: 734
        height: 53
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: -2
        anchors.topMargin: 461
        autoExclusive: true
        theme: "gravity"

        artistInfoText: "Gravity Groove - \"Gravitational Waves\""
        elementText: "2:07"
        clip: false

        Connections {
            target: artistTrack8
            onPressed: Data.Themes.currentTheme = "gravity"
        }
    }

    ArtistTrack {
        id: artistTrack9
        width: 734
        height: 53
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: -2
        anchors.topMargin: 518
        autoExclusive: true
        theme: "zen"

        artistInfoText: "Zen Zephyr - \"Tranquil Torrent\""
        elementText: "8:08"
        clip: false

        Connections {
            target: artistTrack9
            onPressed: Data.Themes.currentTheme = "zen"
        }
    }

    ArtistTrack {
        id: artistTrack10
        width: 734
        height: 53
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: -2
        anchors.topMargin: 575
        autoExclusive: true
        theme: "ultraviolet"

        artistInfoText: "Ultraviolet Utopia - \"Vivid Vision\""
        elementText: "3:42"
        clip: false

        Connections {
            target: artistTrack10
            onPressed: Data.Themes.currentTheme = "ultraviolet"
        }
    }

    ArtistTrack {
        id: artistTrack11
        width: 734
        height: 53
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: -2
        anchors.topMargin: 632
        autoExclusive: true
        theme: "velvet"

        artistInfoText: "Velvet Voyager - \"Velvet Vortex\""
        elementText: "4:01"
        clip: false

        Connections {
            target: artistTrack11
            onPressed: Data.Themes.currentTheme = "velvet"
        }
    }
}

/*##^##
Designer {
    D{i:0;uuid:"4097ad32-4a74-5a77-98d4-d7c2a59b6af1"}D{i:1;uuid:"586f7f72-2b3e-5c9d-9cc6-50f54eaffe07"}
D{i:3;uuid:"ba548428-bc0f-529a-b618-1e365049077b"}D{i:5;uuid:"75a697d9-a07f-5c36-8378-728f9b34be10"}
D{i:7;uuid:"41e30e71-c6cb-5016-a71a-12fc276a3f4c"}D{i:9;uuid:"c46eb60d-0016-5ed0-bd38-a1f2368db0da"}
D{i:11;uuid:"ce3f7a38-b5cc-591f-8be7-80989322183f"}D{i:13;uuid:"25246540-cef5-5d1e-91cd-202363d587b9"}
D{i:15;uuid:"7241f5c5-deb9-5a0a-8750-47e414fec19d"}D{i:17;uuid:"6dff30a3-1957-5db4-83a7-e2605c1220f8"}
D{i:19;uuid:"9ce2f49c-fb56-569a-b971-1eba55f704ea"}D{i:21;uuid:"c91bd3ae-1957-5c02-987f-db2896a7a0c5"}
D{i:23;uuid:"dc957274-beab-58d3-8557-6c30c5ac7820"}
}
##^##*/

