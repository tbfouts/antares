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
        eQAnimationRunning: Data.Themes.animRunning
        scale: 1.5
        rotation: -90
    }

    Button {
        id: buttonBase
        x: 782
        y: 84
        width: 80
        height: 49
        text: qsTrId("Base")

        Connections {
            target: buttonBase
            onPressed: view3DCar.state = ""
        }
    }

    Button {
        id: buttonFront
        x: 965
        y: 84
        width: 80
        height: 49
        text: qsTrId("Front")

        Connections {
            target: buttonFront
            onPressed: view3DCar.state = "front"
        }
    }

    Button {
        id: buttonSide
        x: 874
        y: 84
        width: 80
        height: 49
        text: qsTrId("Side")

        Connections {
            target: buttonSide
            onPressed: view3DCar.state = "side"
        }
    }

    Button {
        id: buttonRear
        x: 1059
        y: 84
        width: 80
        height: 49
        text: qsTrId("Rear")

        Connections {
            target: buttonRear
            onPressed: view3DCar.state = "rear"
        }
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






}

/*##^##
Designer {
    D{i:0;uuid:"828fdd3c-9baf-5cae-89b2-e7028487a7b1"}D{i:2;uuid:"62f406a7-b577-5fb3-9782-241e271307e3"}
}
##^##*/

