import QtQuick
import QtQuick.Controls
import QtQuick.Studio.DesignEffects
import GLO 1.0
import VehicleData 1.0

Rectangle {
    id: speedometer_Value
    width: 320
    height: 320
    color: "transparent"
    property alias speedGaugeCoverColor: speedGaugeCover.color
    property alias designInnerShadowColor: designInnerShadow.color
    property alias designDropShadowColor: designDropShadow.color
    property alias speedGaugeCoverRadius: speedGaugeCover.radius
    property alias txtMPHvalueFRText: txtMPHvalueFR.text
    property alias txtMPHvalueRRText: txtMPHvalueRR.text
    property alias txtMPHText: txtMPH.text

    Rectangle {
        id: speedGaugeCover
        color: "#1e1e1e"
        radius: 80
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        DesignEffect {
            effects: [
                DesignDropShadow {
                    id: designDropShadow
                    color: "#a2757575"
                    offsetY: 6
                    offsetX: 2
                    spread: 1
                    blur: 30
                },
                DesignInnerShadow {
                    id: designInnerShadow
                    color: "#80ffffff"
                    offsetY: -9
                    offsetX: 20
                    spread: -20
                    blur: 18
                }
            ]
        }
    }

    Text {
        id: txtMPHvalueRR
        color: "#727272"
        text: qsTr("126")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 20
        anchors.rightMargin: 16
        anchors.topMargin: 88
        anchors.bottomMargin: 83
        font.pixelSize: 160
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Oxanium"
    }

    Text {
        id: txtMPHvalueFR
        color: "#fef4d0"
        text: qsTr("126")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 18
        anchors.rightMargin: 18
        anchors.topMargin: 86
        anchors.bottomMargin: 85
        font.pixelSize: 160
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Oxanium"
    }

    Text {
        id: txtMPH
        color: "#a8a8a8"
        text: VehicleData.UnitType.Metric === VehicleData.units ? "KPH" : "MPH"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 111
        anchors.rightMargin: 107
        anchors.topMargin: 221
        anchors.bottomMargin: 44
        font.pixelSize: 34
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Oxanium"
    }
}

/*##^##
Designer {
    D{i:0;uuid:"19142a57-5eeb-506f-a93e-ef2a0d80cee3"}D{i:1;uuid:"4c7e53cc-9bf8-5b28-a305-8a5b8f2ee3b7"}
D{i:5;uuid:"812d7766-f48a-51f7-848c-e3b2acd2a20e"}D{i:6;uuid:"339e745e-bf45-5791-83e1-246b6ee33d6d"}
D{i:7;uuid:"b8502301-a787-5c0c-b3ba-83454c8dd760"}
}
##^##*/

