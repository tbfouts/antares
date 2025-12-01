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
    color: Data.Themes.backgroundColor
    property alias carDoorR: view3DCar.doorR
    property alias carDoorL: view3DCar.doorL
    property alias debugViewVisible: debugView.visible
    clip: true
    state: "front"
    property alias view3D: view3DCar

    View3DCar {
        id: view3DCar
        doorL: false
        doorR: false
        lightsVisible: true
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
        visible: true
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
        x: 809
        y: 99
        width: 364
        height: 65
        spacing: 5


        Btn3DView {
            id: btn3DViewSide
            autoExclusive: true
            txtViewText: "XRAY"

            Connections {
                target: btn3DViewSide
                onPressed: {
                  //  topBar.btn3DViewLampsState = "!btn3DView.checked"
                    //view3DCar.lightsVisible = false
                   // Data.Values.lamps = false
                    view3DCar.state = "xray"
                }
            }
        }

        Btn3DView {
            id: btn3DViewFront
            checked: true
            autoExclusive: true
            txtViewText: "BASE"

            Connections {
                id: connections
                target: btn3DViewFront
                onPressed: {
                   // topBar.btn3DViewLampsState = "btn3DView.checked"
                    //view3DCar.lightsVisible = true
                   // Data.Values.lamps = true
                    view3DCar.state = "front"
                }
            }
        }

        Btn3DView {
            id: btn3DViewInt
            autoExclusive: true
            txtViewText: "INT"

            Connections {
                target: btn3DViewInt
                onPressed: {
                   // view3DCar.lightsVisible = false
                   // Data.Values.lamps = true
                    view3DCar.state = "int"
                }
            }
        }
    }








}




/*##^##
Designer {
    D{i:0}D{i:1;cameraSpeed3d:25;cameraSpeed3dMultiplier:1}
}
##^##*/
