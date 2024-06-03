import QtQuick
import QtQuick.Controls
import QtQuick.Studio.Components 1.0
import Data 1.0 as Data

Rectangle {
    id: topBarSwipe
    width: 1920
    height: 80
    color: Data.Themes.backgroundColor
    property alias btnSoundChecked: btnSound.checked
    property alias mediaSwipeText: mediaSwipe.text

    SvgPathItem {
        id: qtVec
        y: 18
        width: 58
        height: 44
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        strokeWidth: 1
        strokeStyle: 1
        strokeColor: "transparent"
        path: "M 15.973358154296875 12.461273193359375 C 16.7755126953125 11.049915313720703 18.27520751953125 10.327022552490234 20.472412109375 10.327022552490234 C 22.66961669921875 10.327022552490234 24.1693115234375 11.049915313720703 24.971466064453125 12.461273193359375 C 25.77362060546875 13.90705680847168 26.157257080078125 16.179000854492188 26.157257080078125 19.31153106689453 C 26.157257080078125 22.444061279296875 25.77362060546875 24.681583404541016 25.00634765625 25.989673614501953 C 24.23907470703125 27.29776382446289 22.7393798828125 27.951805114746094 20.507293701171875 27.951805114746094 C 18.27520751953125 27.951805114746094 16.7755126953125 27.29776382446289 15.973358154296875 25.955249786376953 C 15.17120361328125 24.612735748291016 14.787567138671875 22.409637451171875 14.787567138671875 19.277109146118164 C 14.787567138671875 16.17900276184082 15.17120361328125 13.90705680847168 15.973358154296875 12.461273193359375 Z M 55.034881591796875 0 L 55.034881591796875 32.461273193359375 L 47.396942138671875 40 L 0 40 L 0 7.538726806640625 L 7.637908935546875 0 L 55.034881591796875 0 Z M 25.703857421875 36.14457702636719 L 29.296142578125 34.492252349853516 L 26.401397705078125 29.8450927734375 C 27.7266845703125 28.950084686279297 28.7032470703125 27.641998291015625 29.296142578125 25.955249786376953 C 29.8890380859375 24.26850128173828 30.16802978515625 22.030982971191406 30.16802978515625 19.277109146118164 C 30.16802978515625 15.111875534057617 29.435638427734375 12.013769149780273 28.005706787109375 10.0172119140625 C 26.5408935546875 8.020654678344727 24.064666748046875 7.022375106811523 20.472412109375 7.022375106811523 C 16.9150390625 7.022375106811523 14.4039306640625 8.020654678344727 12.939117431640625 10.0516357421875 C 11.509185791015625 12.048192977905273 10.77679443359375 15.146299362182617 10.77679443359375 19.31153106689453 C 10.77679443359375 23.476764678955078 11.47430419921875 26.506023406982422 12.90423583984375 28.433734893798828 C 14.33416748046875 30.361446380615234 16.84527587890625 31.325302124023438 20.472412109375 31.325302124023438 C 21.448944091796875 31.325302124023438 22.146484375 31.256454467773438 22.599884033203125 31.118762969970703 L 25.703857421875 36.14457702636719 Z M 36.13189697265625 29.53528594970703 C 36.864288330078125 30.430294036865234 38.189605712890625 30.877796173095703 40.17755126953125 30.877796173095703 C 40.979705810546875 30.877796173095703 42.165496826171875 30.74010467529297 43.73492431640625 30.464717864990234 L 43.560546875 27.469879150390625 L 40.70068359375 27.573150634765625 C 39.82879638671875 27.573150634765625 39.305633544921875 27.332183837890625 39.09637451171875 26.884681701660156 C 38.887115478515625 26.437175750732422 38.782501220703125 25.50774383544922 38.782501220703125 24.096385955810547 L 38.782501220703125 16.523235321044922 L 43.595428466796875 16.523235321044922 L 43.595428466796875 13.321859359741211 L 38.8173828125 13.321859359741211 L 38.8173828125 8.330465316772461 L 35.05072021484375 8.330465316772461 L 35.05072021484375 13.321859359741211 L 32.400115966796875 13.321859359741211 L 32.400115966796875 16.523235321044922 L 35.05072021484375 16.523235321044922 L 35.05072021484375 24.47504425048828 C 35.05072021484375 26.953529357910156 35.399505615234375 28.640277862548828 36.13189697265625 29.53528594970703 Z"
        joinStyle: 0
        fillColor: "#bababa"
        antialiasing: true
    }

    Text {
        id: mediaSwipe
        x: 110
        y: 15
        width: 164
        height: 31
        visible: false
        color: "#ffffff"
        text: qsTrId("MediaSwipe")
        font.letterSpacing: 0.281
        font.pixelSize: 28
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.DemiBold
        font.family: "Oxanium"
    }

    MouseArea {
        id: maDebugView
        x: 903
        y: 0
        width: 119
        height: 60

        Connections {
            target: maDebugView
            onPressed: {
                if (carView3D.debugViewVisible === true)
                    carView3D.debugViewVisible = false
                else if (carView3D.debugViewVisible === false)
                    carView3D.debugViewVisible = true
            }
        }
    }

    BtnSound {
        id: btnSound
        x: 1858
        y: 20

        Connections {
            target: btnSound
            onPressed: {
                if (Data.Themes.mediaSoundMute === true)
                    Data.Themes.mediaSoundMute = false
                else if (Data.Themes.mediaSoundMute === false)
                    Data.Themes.mediaSoundMute = true
            }
        }
    }

    Btn3DView {
        id: btn3DViewLamps
        x: 49
        y: 12
        checked: true
        txtViewText: "LAMPS"

        Connections {
            target: btn3DViewLamps
            onPressed: {
                if (Data.Values.lamps === true)
                    Data.Values.lamps = false
                else if (Data.Values.lamps === false)
                    Data.Values.lamps = true
            }
        }
    }

    Btn3DView {
        id: btn3DViewDRVR
        x: 194
        y: 12
        checked: false
        txtViewText: "DRIVER DOOR"

        Connections {
            target: btn3DViewDRVR
            onPressed: {
                if (Data.Values.doorL === true)
                    Data.Values.doorL = false
                else if (Data.Values.doorL === false)
                    Data.Values.doorL = true
            }
        }
    }

    Btn3DView {
        id: btn3DViewPSGR
        x: 342
        y: 12
        txtViewText: "SIDE DOOR"
        checked: false

        Connections {
            target: btn3DViewPSGR
            onPressed: {
                if (Data.Values.doorR === true)
                    Data.Values.doorR = false
                else if (Data.Values.doorR === false)
                    Data.Values.doorR = true
            }
        }
    }

    Btn3DView {
        id: btn3ADASview
        x: 498
        y: 12
        txtViewText: "ADAS"

        Connections {
            target: btn3ADASview
            onPressed: {
                Data.Values.adasEnabled = !Data.Values.adasEnabled
            }
        }

        checked: false
    }

    Image {
        id: lamps
        x: 17
        y: 27
        source: "assets/lamps.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: carDoorL
        x: 168
        y: 19
        source: "assets/carDoorL.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: carDoorR
        x: 317
        y: 19
        source: "assets/carDoorR.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: btnAdas
        x: 450
        y: 15
        source: "assets/btnAdas.png"
        fillMode: Image.PreserveAspectFit
    }
}

/*##^##
Designer {
    D{i:0;uuid:"f1d29a34-1966-5fbb-b9d5-550da3aae6b8"}D{i:1;uuid:"fbf4d9c1-7d16-5947-b578-674145f3f7be"}
D{i:2;uuid:"c976690e-9fc9-57f3-b5b0-c3465ef12556"}
}
##^##*/

