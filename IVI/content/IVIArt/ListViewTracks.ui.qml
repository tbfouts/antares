import QtQuick
import QtQuick.Controls
import Data 1.0 as Data
import VehicleData 1.0

Item {
    id: listViewTracks
    width: 730
    height: 500

    ListModel {
        id: tracksModel
        ListElement { trackTheme: "stardust";    artistInfo: "Stardust Mirage - \"Celestial Echoes\"";          duration: "3:22" }
        ListElement { trackTheme: "luna";        artistInfo: "Luna Nova - \"Midnight Serenade\"";               duration: "2:56" }
        ListElement { trackTheme: "electric";    artistInfo: "Electric Dreamscape - \"Neon Reverie\"";          duration: "3:11" }
        ListElement { trackTheme: "pixel";       artistInfo: "Pixel Pulse - \"Digital Dreams\"";                duration: "4:06" }
        ListElement { trackTheme: "crystal";     artistInfo: "Crystal Cascade - \"Iridescent Illusion\"";      duration: "3:45" }
        ListElement { trackTheme: "sonic";       artistInfo: "Sonic Prism - \"Aurora Beats\"";                 duration: "3:48" }
        ListElement { trackTheme: "ethereal";    artistInfo: "Ethereal Essence - \"Whispers of the Wind\"";    duration: "4:38" }
        ListElement { trackTheme: "mind";        artistInfo: "Psychedelic Pulsar - \"Mind Warp\"";             duration: "5:12" }
        ListElement { trackTheme: "gravity";     artistInfo: "Gravity Groove - \"Gravitational Waves\"";       duration: "2:07" }
        ListElement { trackTheme: "zen";         artistInfo: "Zen Zephyr - \"Tranquil Torrent\"";              duration: "8:08" }
        ListElement { trackTheme: "ultraviolet"; artistInfo: "Ultraviolet Utopia - \"Vivid Vision\"";          duration: "3:42" }
        ListElement { trackTheme: "velvet";      artistInfo: "Velvet Voyager - \"Velvet Vortex\"";             duration: "4:01" }
    }

    ListView {
        id: trackList
        anchors.fill: parent
        model: tracksModel
        clip: true
        interactive: false

        delegate: ArtistTrack {
            width: 734
            height: 53
            autoExclusive: true
            theme: model.trackTheme
            artistInfoText: model.artistInfo
            elementText: model.duration
            checked: Data.Themes.state === model.trackTheme

            onPressed: {
                VehicleData.theme = model.trackTheme
                Data.Themes.currentTheme = model.trackTheme
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;uuid:"4097ad32-4a74-5a77-98d4-d7c2a59b6af1"}
}
##^##*/
