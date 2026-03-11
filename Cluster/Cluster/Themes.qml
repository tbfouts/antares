pragma Singleton
import QtQuick 2.12
import QtMultimedia
import Cluster 1.0
import VehicleData 1.0

Item {
    id: themes

    property string currentTheme: "luna"

    // Sync with VehicleData
    Connections {
        target: VehicleData
        function onThemeChanged() {
            themes.currentTheme = VehicleData.theme
        }
    }

    property color themeColor1: "#ACE1CC"
    property color themeColor2: "#1D406C"
    property color themeColor3: "#0A1527"
    property color backgroundColor: "#000000"

    property string albumArt: "assets/albumArt.png"
    property string trackArtist: "Luna Nova"
    property string trackTitle: "Midnight Serenade"

    property variant songs: ["stardust", "luna", "electric", "pixel", "crystal", "sonic", "ethereal", "mind", "gravity", "zen", "ultraviolet", "velvet"]

    property int trackSpeed: 1200

    function nextTrack()
    {
        var numSongs = songs.length
        var nextTrackIndex = songs.indexOf(themes.state) + 1

        if(nextTrackIndex === numSongs)
            nextTrackIndex = 0

        console.log("Current theme: " + themes.state + ", next track index: " + nextTrackIndex + ", new theme: " + songs[nextTrackIndex])
        themes.state = songs[nextTrackIndex]
    }

    function previousTrack()
    {
        var prevTrackIndex = songs.indexOf(themes.state) - 1

        if(prevTrackIndex < 0)
            prevTrackIndex = songs.length - 1

        console.log("Current theme: " + themes.state + ", prev track index: " + prevTrackIndex + ", new theme: " + songs[prevTrackIndex])

        themes.state = songs[prevTrackIndex]
    }

    states: [
        State {
            name: "stardust"
            when: themes.currentTheme === "stardust"

            PropertyChanges {
                target: themes
                themeColor1: "#BD4C35"
                themeColor2: "#8E4362"
                themeColor3: "#8F3329"
                albumArt: "assets/stardustMirage.png"
                trackArtist: "Stardust Mirage"
                trackTitle: "Celestial Echoes"
                trackspeed: 600
            }
        },

        State {
            name: "luna"
            when: themes.currentTheme === "luna"

            PropertyChanges {
                target: themes
                themeColor1: "#ACE1CC"
                themeColor2: "#395B85"
                themeColor3: "#B793A3"
                albumArt: "assets/lunaNova.png"
                trackArtist: "Luna Nova"
                trackTitle: "Midnight Serenade"
                trackSpeed: 600
            }
        },

        State {
            name: "pixel"
            when: themes.currentTheme === "pixel"

            PropertyChanges {
                target: themes
                themeColor1: "#65A08F"
                themeColor2: "#FD825F"
                themeColor3: "#2F4C62"
                albumArt: "assets/pixelPulse.png"
                trackArtist: "Pixel Pulse"
                trackTitle: "Digital Dreams"
                trackSpeed: 500
            }
        },

        State {
            name: "electric"
            when: themes.currentTheme === "electric"

            PropertyChanges {
                target: themes
                themeColor1: "#DB3E47"
                themeColor2: "#4D5674"
                themeColor3: "#B93971"
                albumArt: "assets/electricDreamscape.png"
                trackArtist: "Electric Dreamscape"
                trackTitle: "Neon Reverie"
                trackSpeed: 900
            }
        },

        State {
            name: "crystal"
            when: themes.currentTheme === "crystal"

            PropertyChanges {
                target: themes
                themeColor1: "#C39CD2"
                themeColor2: "#7CDAE0"
                themeColor3: "#D0FAFA"
                albumArt: "assets/crystalCascade.png"
                trackArtist: "Crystal Cascade"
                trackTitle: "Iridescent Illusion"
                trackSpeed: 800
            }
        },

        State {
            name: "sonic"
            when: themes.currentTheme === "sonic"

            PropertyChanges {
                target: themes
                themeColor1: "#F07128"
                themeColor2: "#89BFBF"
                themeColor3: "#B66D98"
                albumArt: "assets/sonicPrism.png"
                trackArtist: "Sonic Prism"
                trackTitle: "Aurora Beats"
                trackSpeed: 600
            }
        },

        State {
            name: "ethereal"
            when: themes.currentTheme === "ethereal"

            PropertyChanges {
                target: themes
                themeColor1: "#FDD778"
                themeColor2: "#DB752C"
                themeColor3: "#5A301E"
                albumArt: "assets/etheral.png"
                trackArtist: "Ethereal Essence"
                trackTitle: "Whispers of the Wind"
                trackSpeed: 600
            }
        },

        State {
            name: "mind"
            when: themes.currentTheme === "mind"

            PropertyChanges {
                target: themes
                themeColor1: "#479769"
                themeColor2: "#EEA153"
                themeColor3: "#856279"
                albumArt: "assets/mindWarp.png"
                trackArtist: "Psychedelic Pulsar"
                trackTitle: "Mind Warp"
                trackSpeed: 600
            }
        },

        State {
            name: "gravity"
            when: themes.currentTheme === "gravity"

            PropertyChanges {
                target: themes
                themeColor1: "#DF5789"
                themeColor2: "#79AA8D"
                themeColor3: "#FAC674"
                albumArt: "assets/gravityGroove.png"
                trackArtist: "Gravity Groove"
                trackTitle: "Gravitational Waves"
                trackSpeed: 600
            }
        },

        State {
            name: "zen"
            when: themes.currentTheme === "zen"

            PropertyChanges {
                target: themes
                themeColor1: "#2F5163"
                themeColor2: "#E78F54"
                themeColor3: "#F2EFDB"
                albumArt: "assets/zenZephyr.png"
                trackArtist: "Zen Zephyr"
                trackTitle: "Tranquil Torrent"
                trackSpeed: 500
            }
        },

        State {
            name: "ultraviolet"
            when: themes.currentTheme === "ultraviolet"

            PropertyChanges {
                target: themes
                themeColor1: "#9443B2"
                themeColor2: "#FC715A"
                themeColor3: "#EA50B8"
                albumArt: "assets/ultravioletUtopia.png"
                trackArtist: "Ultraviolet Utopia"
                trackTitle: "Vivid Vision"
                trackSpeed: 600
            }
        },

        State {
            name: "velvet"
            when: themes.currentTheme === "velvet"

            PropertyChanges {
                target: themes
                themeColor1: "#D75666"
                themeColor2: "#485557"
                themeColor3: "#CBAA7B"
                albumArt: "assets/velvetVoyager.png"
                trackArtist: "Velvet Voyager"
                trackTitle: "Velvet Vortex"
                trackSpeed: 700
            }
        }
    ]

    // SequentialAnimation {
    //         id: trackProgress
    //         running: true
    //         paused: false
    //         loops: Animation.Infinite
    //         PropertyAnimation {
    //             property: "animRunning"
    //             duration: 50000
    //             target: trackProgress
    //             from: 0
    //             to: 323
    //             easing.type: Easing.InOutQuad;
    //         }
    // }

    transitions: [
        Transition {
            id: transition
            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: themes
                        property: "themeColor1"
                        duration: 300
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: themes
                        property: "themeColor2"
                        duration: 300
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: themes
                        property: "themeColor3"
                        duration: 300
                    }
                }
    }
}
]

}


/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
