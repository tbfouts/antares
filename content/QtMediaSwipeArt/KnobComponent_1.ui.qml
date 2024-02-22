import QtQuick
import QtQuick.Controls
import QtQuick.Studio.Components 1.0
import QtQuick.Shapes 1.0
import Data 1.0 as Data

Rectangle {
    id: knobComponent
    width: 1148
    height: 999
    color: "transparent"
    property alias dialValue: dial.value
    property alias eqBarsBottomEQAnimationRunning: eqBarsBottom.eQAnimationRunning
    property alias eqBarsTopEQAnimationRunning: eqBarsTop.eQAnimationRunning
    property alias txtDialValueText: txtDialValue.text



    Image {
        id: eqBarBlur
        x: 72
        y: -14
        width: 998
        height: 1053
        opacity: 0.556
        source: "assets/eqBarBlur.png"
        fillMode: Image.PreserveAspectFit
    }

    EqBars {
        id: eqBarsBottom
        x: 224
        y: 558
        width: 700
        height: 399
        eQAnimationRunning: Data.Themes.animRunning
        rotation: 180
        clip: true
    }



    EqBars {
        id: eqBarsTop
        width: 700
        height: 399
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 224
        anchors.topMargin: 43
        eQAnimationRunning: Data.Themes.animRunning
        clip: true
    }


    Image {
        id: knobVolumeBackground
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 185
        anchors.topMargin: 126
        source: "assets/knobVolumeBackground_1.png"
    }





    ArcItem {
        id: knobVolumeIndicator
        width: 648
        height: 646
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 250
        anchors.topMargin: 176
        roundEnd: true
        roundBegin: true
        end: dial.value
        strokeWidth: 0
        strokeStyle: 0
        strokeColor: "transparent"
        rotation: -0.943
        outlineArc: true
        fillColor: Data.Themes.themeColor2
        begin: -130
        arcWidth: 32.37948
        antialiasing: true
    }









    Dial {
        id: dial
        x: 218
        y: 142
        width: 710
        height: 710
        value: -130
        stepSize: 1
        handle: knobHandle

        Image {
            id: knobVolumeForeground
            x: 1
            y: 32
            visible: true
            source: "assets/knobVolumeForeground_1.png"
        }
        to: 130
        from: -130
    }



    Image {
        id: knobHandle
        x: 317
        y: 242
        visible: true
        source: "assets/knobHandle_1.png"
        rotation: dial.value - 15
    }

    Text {
        id: txtDialValue
        width: 331
        height: 161
        color: "#2e3c3c43"
        text: dial.value + 130
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 410
        anchors.topMargin: 419
        font.letterSpacing: 0.281
        font.pixelSize: 175
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.DemiBold
        font.family: "Oxanium"
    }

}

/*##^##
Designer {
    D{i:0;uuid:"ed0bfe73-4154-51de-a4ba-df60bcf60b59"}D{i:2;uuid:"5c397327-a83b-5d96-95da-6b23ac9aafad"}
D{i:3;uuid:"069b976e-953a-5bd8-94f0-c8457df85573"}D{i:4;uuid:"61296e88-d414-53c8-9526-d5547be19bda"}
D{i:5;uuid:"03a11cd5-af16-5612-9e67-187d8e9a7ee6"}D{i:7;uuid:"53b93181-3273-5f5e-8cfa-33475cf5abac"}
D{i:9;uuid:"36be5267-7276-5f13-985d-68d63eaca3bf"}
}
##^##*/

