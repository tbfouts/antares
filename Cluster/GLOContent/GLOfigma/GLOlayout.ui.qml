import QtQuick
import QtQuick.Controls
import QtQuick.Studio.Utils
import GLO 1.0
import VehicleData 1.0

Rectangle {
    id: gLOlayout
    width: Constants.width
    height: Constants.height
    color: "#000000"
    property alias qsrTurnSignalsVisible: qsrTurnSignals.visible
    property alias qsrWarningsVisible: qsrWarnings.visible
    state: VehicleData.driveMode
    property alias rpmGauge_ValueRpmGaugeCoverColor: rpmGauge_Value.rpmGaugeCoverColor
    property alias speedometer_ValueSpeedGaugeCoverColor: speedometer_Value.speedGaugeCoverColor

    property alias rpmGauge_ValueInnerShadowColor: rpmGauge_Value.designInnerShadowColor
    property alias rpmGauge_ValueDropShadowColor: rpmGauge_Value.designDropShadowColor
    property alias speedometer_ValueInnerShadowColor: speedometer_Value.designInnerShadowColor
    property alias speedometer_ValueDropShadowColor: speedometer_Value.designDropShadowColor
    property alias rpmGauge_ShadowColor: rpmGauge_ShadowEffect.designDropShadowColor
    property alias speedGauge_ShadowColor: speedGauge_ShadowEffect.designDropShadowColor
    property alias bkgrdRectangleSmallVisible: bkgrdRectangleSmall.visible
    property alias adasCompVisible: adasComp.visible
    clip: true

    RecBkgrd {
        id: recBkgrd
        width: 1920
        height: 720
        anchors.left: parent.left
        anchors.top: parent.top
    }

    SpeedGauge_ShadowEffect {
        id: speedGauge_ShadowEffect
        width: 600
        height: 600
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 1349
        anchors.topMargin: 39
        speedGaugeEffectRadius: VehicleData.speed + 30
    }

    RpmGauge_ShadowEffect {
        id: rpmGauge_ShadowEffect
        width: 600
        height: 560
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: -47
        anchors.topMargin: 59
        rpmGaugeEffectRadius: VehicleData.speed + 30
    }

    CircuitBoard {
        id: circuitBoard
        width: 552
        height: 534
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 1357
        anchors.topMargin: 46
        clip: true
    }

    CircuitBoard {
        id: circuitBoard1
        width: 552
        height: 534
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: -2
        anchors.topMargin: 47
        clip: true
    }

    BkgrdRectangleLarge {
        id: bkgrdRectangleLarge
        width: 1429
        height: 890
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 246
        anchors.topMargin: -108
    }

    BkgrdRectangleSmall {
        id: bkgrdRectangleSmall
        width: 885
        height: 890
        visible: true
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 523
        anchors.topMargin: -108
        clip: true
    }

    DirectionsMini_Comp {
        id: directionsMini_Comp
        width: 647
        height: 206
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 1442
        anchors.topMargin: 576
    }

    MusicPlayer_Comp {
        id: musicPlayer_Comp
        width: 647
        height: 206
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: -182
        anchors.topMargin: 576
    }

    FuelGauge_Comp {
        id: fuelGauge_Comp
        width: 589
        height: 161
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: -12
        anchors.topMargin: 643
    }

    GearComp {
        id: gearComp
        width: 51
        height: 265
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 1337
        anchors.topMargin: 214
        modePark: VehicleData.gear
        modeDrive: !VehicleData.gear
        state: "Drive"
    }

    BatteryGauge_Comp {
        id: batteryGauge_Comp
        width: 647
        height: 161
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 1337
        anchors.topMargin: 643
    }

    SpeedLimit_KPH {
        id: speedLimit_KPH
        width: 86
        height: 86
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 1398
        anchors.topMargin: 550
        visible: VehicleData.units === "Metric"
    }

    Rectangle {
        id: speedLimit_MPH

        width: 66
        height: 86
        color: "#ffffff"
        radius: 3
        border.color: "red"
        border.width: VehicleData.speed > 55 ? 3 : 0
        visible: VehicleData.units === "Imperial"
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 1398
        anchors.topMargin: 550

        Text {
            id: txtSpeedLimit
            text: qsTr("SPEED\nLIMIT")
            color: VehicleData.speed > 55 ? "red" : "#545454"
            anchors.top: parent.top
            anchors.topMargin: 5
            width: parent.width
            font.pixelSize: 15
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.weight: Font.DemiBold
            font.family: "Oxanium"
        }

        Text {
            id: txtKiSL
            color: VehicleData.speed > 55 ? "red" : "#545454"
            text: qsTr("55")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.leftMargin: 3
            anchors.rightMargin: 5
            anchors.topMargin: 0
            anchors.bottomMargin: 0
            font.letterSpacing: -1.797
            font.pixelSize: 40
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.weight: Font.DemiBold
            font.family: "Oxanium"
        }
    }

    Speedometer_Value {
        id: speedometer_Value
        width: 320
        height: 320
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 1425
        anchors.topMargin: 178
        speedGaugeCoverRadius: VehicleData.speed + 30
        txtMPHvalueRRText: VehicleData.speed
        txtMPHvalueFRText: VehicleData.speed
    }

    RpmGauge_Value {
        id: rpmGauge_Value
        width: 320
        height: 320
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 175
        anchors.topMargin: 178
        txtRPMValueRRText: Math.min((VehicleData.speed / (3.14 * 6)) + 1).toFixed(0)
        txtRPMValueFRText: Math.min((VehicleData.speed / (3.14 * 6)) + 1).toFixed(0)
        rpmGaugeCoverRadius: VehicleData.speed + 30
    }

    DriveMode {
        id: driveMode
        width: 291
        height: 35
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 65
        anchors.verticalCenterOffset: -319
    }

    TractionComp {
        id: tractionComp
        width: 218
        height: 35
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 106
        anchors.verticalCenterOffset: -319
    }

    QsrWarnings {
        id: qsrWarnings
        x: 602
        y: 662
        width: 713
        height: 60
        qsrON: VehicleData.qsrIcons
        clip: true
    }
    Clock {
        id: clock
        width: 166
        height: 50
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 457
        anchors.topMargin: 13
    }

    Qt_logo_white_rgb_1 {
        id: qt_logo_white
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 930
        anchors.rightMargin: 931
        anchors.topMargin: 6
        anchors.bottomMargin: 671
        clip: true
    }

    WeatherComp {
        id: weatherComp
        width: 195
        height: 50
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 1310
        anchors.topMargin: 13
    }

    AdasComp {
        id: adasComp
        width: 480
        height: 592
        visible: false
        anchors.verticalCenter: parent.verticalCenter
        adasON: VehicleData.driveMode === "ADAS"
        adasOFF: false
        anchors.verticalCenterOffset: -4
        anchors.horizontalCenterOffset: -1
        anchors.horizontalCenter: parent.horizontalCenter
    }

    QsrTurnSignals {
        id: qsrTurnSignals
        width: 500
        height: 60
        visible: true
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 710
        anchors.topMargin: 24
        turnRightSignal: VehicleData.switchTurnR
        turnLeftSignal: VehicleData.switchTurnL
        clip: true
    }
    Item {
        id: __materialLibrary__
    }
}

/*##^##
Designer {
    D{i:0;uuid:"9613340e-a63c-57ea-ba26-a6f50478d083"}D{i:1;uuid:"55714a13-6098-5e01-8efc-db9188e3550e"}
D{i:2;uuid:"427b066e-7a3c-5047-af51-cb5f9e547bda"}D{i:3;uuid:"fda77c2f-b263-5cf6-ad89-ccf7085f0256"}
D{i:4;uuid:"c01bd443-d2cb-530d-a188-0b6a213f2f4a"}D{i:5;uuid:"0adecfcb-be8e-55b6-8907-2ca6a0d3f16b"}
D{i:6;uuid:"27c019d7-02f8-53b4-8cfe-f0163ce353dc"}D{i:7;uuid:"d1903e74-1dda-5aa8-aa80-e39f65dc424c"}
D{i:8;uuid:"6cde417c-6ad1-5542-aef0-6c0b5f2b12cf"}D{i:9;uuid:"ff5b4c02-ca53-5562-92c7-c88afdd79914"}
D{i:10;uuid:"9f8cbf5b-d381-57ce-bded-6f035a8b8ede"}D{i:11;uuid:"eec0a678-b761-5d9d-a113-37bda6e97b6e"}
D{i:12;uuid:"8a123f28-ffe0-58fd-adbb-656ac97a4828"}D{i:13;uuid:"434ae6df-097a-581e-ad95-956420a62740"}
}
##^##*/

