import QtQuick
import QtQuick.Controls
import QtQuick 6.5
import QtQuick.Controls 6.5
import QtQuick3D 6.5
import QtQuick3D.Effects 6.5
import Quick3DAssets.GenericCarModel
import Quick3DAssets.Lights
import QtQuick3D.Helpers 6.5
import Data 1.0 as Data

Rectangle {
    id: carView3D
    width: 1920
    height: 1080
    color: "transparent"
    property alias debugViewVisible: debugView.visible
    clip: true
    state: "front"
    property alias view3D: view3DCar

    View3DCar {
        id: view3DCar
        doorL: false
        doorR: false
        lightsVisible: false
    }



    SideLTMediaPlayer {
        id: sideLTMediaPlayer
        width: 444
        height: 1020
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: -1
        anchors.topMargin: 60
    }

    EqBars {
        id: eqBars
        x: 1635
        y: 371
        opacity: 0.521
        visible: false
        eQAnimationRunning: Data.Themes.mediaPlaying
        scale: 1.5
        rotation: -90
    }


    Item {
        id: __materialLibrary__
    }

    DebugView {
        id: debugView
        x: 139
        y: 72
        visible: false
        source: view3DCar
    }

    Row {
        id: row3DViews
        x: 812
        y: 82
        width: 364
        height: 65
        spacing: 0

        // Btn3DView {
        //     id: btn3DViewBase
        //     autoExclusive: true
        //     checked: true
        //     // checked: true
        //     txtViewText: "BASE"

        //     Connections {
        //         target: btn3DViewBase
        //         onPressed: view3DCar.state = "base"
        //     }
        // }

        Btn3DView {
            id: btn3DViewSide
            autoExclusive: true
            txtViewText: "SIDE"

            Connections {
                target: btn3DViewSide
                onPressed: view3DCar.state = "side"
            }
        }

        Btn3DView {
            id: btn3DViewFront
            autoExclusive: true
            txtViewText: "FRONT"

            Connections {
                id: connections
                target: btn3DViewFront
                onPressed: view3DCar.state = "front"
            }
        }

        Btn3DView {
            id: btn3DViewRear
            autoExclusive: true
            txtViewText: "REAR"

            Connections {
                target: btn3DViewRear
                onPressed: view3DCar.state = "rear"
            }
        }
    }


    Switch {
        id: headlightSwitch
        x: 739
        y: 163
        width: 153
        height: 33
        text: qsTrId("HEADLAMPS")
        font.pointSize: 16
        font.family: "Oxanium"

        Connections {
            target: headlightSwitch
            onToggled: {
                if (view3DCar.lightsVisible === true)
                    view3DCar.lightsVisible = false
                else if (view3DCar.lightsVisible === false)
                    view3DCar.lightsVisible = true
            }
        }
    }

    Switch {
        id: doorLeft
        x: 911
        y: 166
        text: qsTrId("DOOR L")
        font.pointSize: 16
        font.family: "Oxanium"

        Connections {
            target: doorLeft
            onToggled: {
                if (view3DCar.doorL === true)
                    view3DCar.doorL = false
                else if (view3DCar.doorL === false)
                    view3DCar.doorL = true
            }
        }
    }

    Switch {
        id: doorRight
        x: 1043
        y: 166
        text: qsTrId("DOOR R")
        font.pointSize: 16
        font.family: "Oxanium"

        Connections {
            target: doorRight
            onToggled: {
                if (view3DCar.doorR === true)
                    view3DCar.doorR = false
                else if (view3DCar.doorR === false)
                    view3DCar.doorR = true
            }
        }
    }






}



