import QtQuick
import QtTest
import Cluster

Item {
    id: root
    width: 200
    height: 200

    TestCase {
        name: "ThemesTests"
        when: windowShown

        function test_singletonAccessible() {
            verify(Themes !== null)
            compare(Themes.currentTheme, qsTr("luna"))
        }

        function test_defaultThemeColors() {
            let originalTheme = Themes.currentTheme
            Themes.currentTheme = "luna"
            tryCompare(Themes, "themeColor1", '#ace1cc')
            tryCompare(Themes, "themeColor2", '#395b85')
            tryCompare(Themes, "themeColor3", '#b793a3')
            Themes.currentTheme = originalTheme
        }

        function test_defaultTrackMetadata() {
            let originalTheme = Themes.currentTheme
            Themes.currentTheme = "luna"
            compare(Themes.trackArtist, qsTr("Luna Nova"))
            compare(Themes.trackTitle, qsTr("Midnight Serenade"))
            compare(Themes.trackSpeed, 600)
            Themes.currentTheme = originalTheme
        }

        function test_stardustThemeColors() {
            let originalTheme = Themes.currentTheme
            Themes.currentTheme = "stardust"
            tryCompare(Themes, "themeColor1", '#bd4c35')
            compare(Themes.themeColor2, '#8e4362')
            compare(Themes.themeColor3, '#8f3329')
            compare(Themes.trackArtist, qsTr("Stardust Mirage"))
            compare(Themes.trackTitle, qsTr("Celestial Echoes"))
            Themes.currentTheme = originalTheme
        }

        function test_pixelThemeColors() {
            let originalTheme = Themes.currentTheme
            Themes.currentTheme = "pixel"
            tryCompare(Themes, "themeColor1", '#65a08f')
            compare(Themes.themeColor2, '#fd825f')
            compare(Themes.themeColor3, '#2f4c62')
            compare(Themes.trackArtist, qsTr("Pixel Pulse"))
            compare(Themes.trackTitle, qsTr("Digital Dreams"))
            Themes.currentTheme = originalTheme
        }

        function test_electricThemeColors() {
            let originalTheme = Themes.currentTheme
            Themes.currentTheme = "electric"
            tryCompare(Themes, "themeColor1", '#db3e47')
            compare(Themes.themeColor2, '#4d5674')
            compare(Themes.themeColor3, '#b93971')
            compare(Themes.trackArtist, qsTr("Electric Dreamscape"))
            Themes.currentTheme = originalTheme
        }

        function test_nextTrackCycles() {
            let originalTheme = Themes.currentTheme
            Themes.currentTheme = "luna"
            tryCompare(Themes, "state", "luna")
            Themes.nextTrack()
            tryCompare(Themes, "state", "electric")
            Themes.currentTheme = originalTheme
        }

        function test_previousTrackCycles() {
            let originalTheme = Themes.currentTheme
            Themes.currentTheme = "luna"
            tryCompare(Themes, "state", "luna")
            Themes.previousTrack()
            tryCompare(Themes, "state", "stardust")
            Themes.currentTheme = originalTheme
        }

        function test_nextTrackWrapsAround() {
            let originalTheme = Themes.currentTheme
            Themes.currentTheme = "velvet"
            tryCompare(Themes, "state", "velvet")
            Themes.nextTrack()
            tryCompare(Themes, "state", "stardust")
            Themes.currentTheme = originalTheme
        }

        function test_previousTrackWrapsAround() {
            let originalTheme = Themes.currentTheme
            Themes.currentTheme = "stardust"
            tryCompare(Themes, "state", "stardust")
            Themes.previousTrack()
            tryCompare(Themes, "state", "velvet")
            Themes.currentTheme = originalTheme
        }

        function test_songsListComplete() {
            compare(Themes.songs.length, 12)
            compare(Themes.songs[0], qsTr("stardust"))
            compare(Themes.songs[11], qsTr("velvet"))
        }
    }
}
