pragma Singleton
import QtQuick 2.12

Item {
    id: themes
      property string currentTheme: "pixel"

      property color themeColor1: "#ACE1CC"
      property color themeColor2: "#1D406C"
      property color themeColor3: "#0A1527"
      property color backgroundColor: "#000000"

      property string albumArt: "assets/albumArt.png"
      property string trackArtist: "Luna Nova"
      property string trackTitle: "Midnight Serenade"

      property int trackSpeed: 1200

      property bool animRunning: true
      property bool animPaused: false
      // property bool listTrack1Checked: true
      // property bool listTrack2Checked: false

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
                trackspeed: 800
            }
        },

        State {
            name: "luna"
            when: themes.currentTheme === "luna"

            PropertyChanges {
                target: themes
                themeColor1: "#ACE1CC"
                themeColor2: "#1D406C"
                themeColor3: "#0A1527"
                albumArt: "assets/lunaNova.png"
                trackArtist: "Luna Nova"
                trackTitle: "Midnight Serenade"
                trackSpeed: 1200
            }
        },

        State {
            name: "pixel"
            when: themes.currentTheme === "pixel"

            PropertyChanges {
                target: themes
                themeColor1: "#F9E17F"
                themeColor2: "#387179"
                themeColor3: "#B5253A"
                albumArt: "assets/pixelPulse.png"
                trackArtist: "Pixel Pulse"
                trackTitle: "Digital Dreams"
                trackSpeed: 1600
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
                trackSpeed: 1600
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
                trackSpeed: 1600
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
                trackSpeed: 1600
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
                trackSpeed: 1600
            }
        },

        State {
            name: "gravity"
            when: themes.currentTheme === "gravity"

            PropertyChanges {
                target: themes
                themeColor1: "#F9E17F"
                themeColor2: "#387179"
                themeColor3: "#B5253A"
                albumArt: "assets/gravityGroove.png"
                trackArtist: "Gravity Groove"
                trackTitle: "Gravitational Waves"
                trackSpeed: 1600
            }
        },

        State {
            name: "zen"
            when: themes.currentTheme === "zen"

            PropertyChanges {
                target: themes
                themeColor1: "#F9E17F"
                themeColor2: "#387179"
                themeColor3: "#B5253A"
                albumArt: "assets/zenZephyr.png"
                trackArtist: "Zen Zephyr"
                trackTitle: "Tranquil Torrent"
                trackSpeed: 1600
            }
        },

        State {
            name: "ultraviolet"
            when: themes.currentTheme === "ultraviolet"

            PropertyChanges {
                target: themes
                themeColor1: "#F9E17F"
                themeColor2: "#387179"
                themeColor3: "#B5253A"
                albumArt: "assets/ultravioletUtopia.png"
                trackArtist: "Ultraviolet Utopia"
                trackTitle: "Vivid Vision"
                trackSpeed: 1600
            }
        },

        State {
            name: "velvet"
            when: themes.currentTheme === "velvet"

            PropertyChanges {
                target: themes
                themeColor1: "#F9E17F"
                themeColor2: "#387179"
                themeColor3: "#B5253A"
                albumArt: "assets/velvetVoyager.png"
                trackArtist: "Velvet Voyager"
                trackTitle: "Velvet Vortex"
                trackSpeed: 1600
            }
        }
    ]

    SequentialAnimation {
            id: trackProgress
            running: true
            paused: false
            loops: Animation.Infinite
            PropertyAnimation {
                property: "animRunning"
                duration: 50000
                target: trackProgress
                from: 0
                to: 323
                easing.type: Easing.InOutQuad;
            }
    }
}





/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
