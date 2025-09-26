import QtQuick
import QtQuick.Controls
import QtQuick.Studio.Utils
import GLO 1.0
import VehicleData 1.0
import QtQuick.Shapes 1.15
import "../IPIncCall"
import "../../advancedADAS"
import "../../advancedTPMS"



Rectangle {
    id: gLOlayout
    width: Constants.width
    height: Constants.height
    color: "#1c1c1c"
    property alias veclowBeamsVisible: veclowBeams.visible
    property alias adasDRVVisible: adasDRV.visible
    property alias recBkgrdRecBkgrdVisible: recBkgrd.recBkgrdVisible
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
    //  property alias adasCompVisible: adasComp.visible
    clip: true

    RecBkgrd {
        id: recBkgrd
        width: 1920
        height: 720
        visible: true
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
        visible: true
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
        visible: true
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
        visible: false
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 246
        anchors.topMargin: -108
    }

    BkgrdRectangleSmall {
        id: bkgrdRectangleSmall
        width: 885
        height: 890
        opacity: 0
        visible: false
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
        modeDrive: false
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
        visible: VehicleData.units === "Imperial"
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 1398
        anchors.topMargin: 550

        Text {
            id: txtSpeedLimit
            text: qsTr("SPEED\nLIMIT")
            color: "#545454"
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
            color: "#545454"
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

    AdasDRV {
        id: adasDRV
        y: 60
        anchors.horizontalCenter: parent.horizontalCenter
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

    Shape {
        id: veclowBeams
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 523
        anchors.rightMargin: 1290
        anchors.topMargin: 300
        anchors.bottomMargin: 327
        layer.samples: 16
        layer.enabled: true
        ShapePath {
            id: veclowBeams_ShapePath_0
            strokeWidth: 1
            strokeColor: "transparent"
            PathSvg {
                id: veclowBeams_PathSvg_0
                path: "M 57.07999801635742 0 C 41.979997634887695 0 27.769999504089355 3.27000093460083 17.049999237060547 9.210000991821289 C 6.049999237060547 15.310000896453857 0 23.510001182556152 0 32.310001373291016 C 0 41.11000156402588 6.059999465942383 49.30999755859375 17.049999237060547 55.39999771118164 C 27.769999504089355 61.3399977684021 41.979997634887695 64.61000061035156 57.07999801635742 64.61000061035156 C 57.90999799966812 64.61000061035156 58.57999801635742 63.939996778964996 58.57999801635742 63.1099967956543 L 58.57999801635742 1.5 C 58.57999801635742 0.6700000166893005 57.90999799966812 0 57.07999801635742 0 Z M 3 32.310001373291016 C 3 24.650001525878906 8.510000228881836 17.380000114440918 18.510000228881836 11.84000015258789 C 26.25 7.550000190734863 35.9300012588501 4.709999680519104 46.470001220703125 3.5699996948242188 L 46.470001220703125 61.03999710083008 C 35.9300012588501 59.89999711513519 26.25 57.0600004196167 18.510000228881836 52.77000045776367 C 8.510000228881836 47.230000495910645 3 39.959999084472656 3 32.29999923706055 L 3 32.310001373291016 Z M 55.57999801635742 61.60000228881836 C 53.51999807357788 61.57000228948891 51.47999906539917 61.47000351548195 49.459999084472656 61.320003509521484 L 49.459999084472656 3.2900009155273438 C 51.46999907493591 3.1400009095668793 53.509998083114624 3.0400002282112837 55.57999801635742 3.010000228881836 L 55.57999801635742 61.59000015258789 L 55.57999801635742 61.60000228881836 Z M 63.4900016784668 2.260000228881836 C 63.77000167965889 1.4800002574920654 64.62000155448914 1.0700001418590546 65.4000015258789 1.3400001525878906 L 91.96000671386719 10.710000991821289 C 92.74000668525696 10.990000993013382 93.15000489354134 11.840000867843628 92.8800048828125 12.620000839233398 C 92.6600048840046 13.24000084400177 92.08000671863556 13.620000839233398 91.46000671386719 13.620000839233398 C 91.29000671207905 13.620000839233398 91.13000671565533 13.590000685304403 90.96000671386719 13.530000686645508 L 64.4000015258789 4.159999847412109 C 63.620001554489136 3.8799998462200165 63.20999953150749 3.0299999713897705 63.47999954223633 2.25 L 63.4900016784668 2.260000228881836 Z M 92.8800048828125 55.310001373291016 C 92.6600048840046 55.93000137805939 92.08000671863556 56.310001373291016 91.46000671386719 56.310001373291016 C 91.29000671207905 56.310001373291016 91.13000671565533 56.279997404664755 90.96000671386719 56.21999740600586 L 64.4000015258789 46.85000228881836 C 63.620001554489136 46.57000228762627 63.20999953150749 45.719998598098755 63.47999954223633 44.939998626708984 C 63.75999954342842 44.159998655319214 64.6100070476532 43.750000447034836 65.39000701904297 44.02000045776367 L 91.95000457763672 53.3900032043457 C 92.73000454902649 53.670003205537796 93.14000275731087 54.519999265670776 92.87000274658203 55.29999923706055 L 92.8800048828125 55.310001373291016 Z M 92.8800048828125 26.85000228881836 C 92.6600048840046 27.47000229358673 92.08000671863556 27.85000228881836 91.46000671386719 27.85000228881836 C 91.29000671207905 27.85000228881836 91.13000671565533 27.820002134889364 90.96000671386719 27.76000213623047 L 64.4000015258789 18.389999389648438 C 63.620001554489136 18.109999388456345 63.20999953150749 17.2599995136261 63.47999954223633 16.479999542236328 C 63.75999954342842 15.699999570846558 64.6100070476532 15.29000136256218 65.39000701904297 15.560001373291016 L 91.95000457763672 24.93000030517578 C 92.73000454902649 25.210000306367874 93.14000275731087 26.06000018119812 92.87000274658203 26.84000015258789 L 92.8800048828125 26.85000228881836 Z M 92.8800048828125 41.08000183105469 C 92.6600048840046 41.70000183582306 92.08000671863556 42.08000183105469 91.46000671386719 42.08000183105469 C 91.29000671207905 42.08000183105469 91.13000671565533 42.05000167712569 90.96000671386719 41.9900016784668 L 64.4000015258789 32.619998931884766 C 63.620001554489136 32.33999893069267 63.20999953150749 31.489999055862427 63.47999954223633 30.709999084472656 C 63.75999954342842 29.929999113082886 64.6100070476532 29.520000904798508 65.39000701904297 29.790000915527344 L 91.95000457763672 39.15999984741211 C 92.73000454902649 39.4399998486042 93.14000275731087 40.28999972343445 92.87000274658203 41.06999969482422 L 92.8800048828125 41.08000183105469 Z M 92.8800048828125 69.53999328613281 C 92.6600048840046 70.15999329090118 92.08000671863556 70.53999328613281 91.46000671386719 70.53999328613281 C 91.29000671207905 70.53999328613281 91.13000671565533 70.50999694690108 90.96000671386719 70.44999694824219 L 64.4000015258789 61.07999801635742 C 63.620001554489136 60.79999801516533 63.20999953150749 59.95000195503235 63.47999954223633 59.17000198364258 C 63.75999954342842 58.39000201225281 64.6100070476532 57.98000380396843 65.39000701904297 58.250003814697266 L 91.95000457763672 67.6199951171875 C 92.73000454902649 67.8999951183796 93.14000275731087 68.7499988079071 92.87000274658203 69.52999877929688 L 92.8800048828125 69.53999328613281 Z"
            }
            fillRule: ShapePath.WindingFill
            fillColor: "#818181"
        }
        antialiasing: true
    }

    // AdasComp {
    //     id: adasComp
    //     width: 480
    //     height: 592
    //     visible: false
    //     anchors.verticalCenter: parent.verticalCenter
    //    adasON: VehicleData.driveMode === "ADAS"
    //    adasOFF: false
    //     anchors.verticalCenterOffset: -4
    //     anchors.horizontalCenterOffset: -1
    //     anchors.horizontalCenter: parent.horizontalCenter
    // }


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
D{i:20}
}
##^##*/

