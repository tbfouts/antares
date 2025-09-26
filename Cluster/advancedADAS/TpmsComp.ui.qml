import QtQuick
import QtQuick.Controls
import QtQuick.Shapes 1.15

Rectangle {
    id: tpmsComp
    width: 692
    height: 438
    color: "transparent"
    property alias txtPSI_RFText: txtPSI_RF.text
    property alias txtPSI_LFText: txtPSI_LF.text
    property alias txtADASEngText: txtADASEng.text
    property alias txtPSI_RRText: txtPSI_RR.text
    property alias txtPSI_LRText: txtPSI_LR.text

    Text {
        id: txtPSI_RF
        color: "#818181"
        text: qsTr("46")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 600
        anchors.rightMargin: -1
        anchors.topMargin: 82
        anchors.bottomMargin: 282
        font.pixelSize: 60
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Oxanium"
    }

    Text {
        id: txtPSI_RR
        color: "#818181"
        text: qsTr("46")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 600
        anchors.rightMargin: -1
        anchors.topMargin: 364
        font.pixelSize: 60
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Oxanium"
    }

    Text {
        id: txtPSI_LF
        color: "#818181"
        text: qsTr("46")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 148
        anchors.rightMargin: 451
        anchors.topMargin: 82
        anchors.bottomMargin: 282
        font.pixelSize: 60
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Oxanium"
    }

    Text {
        id: txtPSI_LR
        color: "#818181"
        text: qsTr("46")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 148
        anchors.rightMargin: 451
        anchors.topMargin: 364
        font.pixelSize: 60
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Oxanium"
    }

    Rectangle {
        id: line_PSI_RF
        color: "#6a6a6a"
        radius: 4
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 534
        anchors.rightMargin: 101
        anchors.topMargin: 119
        anchors.bottomMargin: 315
    }

    Rectangle {
        id: line_PSI_RR
        color: "#6a6a6a"
        radius: 4
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 553
        anchors.rightMargin: 101
        anchors.topMargin: 399
        anchors.bottomMargin: 35
    }

    Rectangle {
        id: line_PSI_LF
        color: "#6a6a6a"
        radius: 4
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 226
        anchors.rightMargin: 409
        anchors.topMargin: 123
        anchors.bottomMargin: 311
    }

    Rectangle {
        id: line_PSI_LR
        color: "#6a6a6a"
        radius: 4
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 226
        anchors.rightMargin: 428
        anchors.topMargin: 403
        anchors.bottomMargin: 31
    }

    Text {
        id: txtADASEng
        color: "#818181"
        text: qsTr("TIRE PRESSURE (PSI)")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 133
        anchors.rightMargin: 0
        anchors.bottomMargin: 407
        font.letterSpacing: 7.594
        font.pixelSize: 40
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Oxanium"
    }

    Shape {
        id: veclowBeams
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 599
        anchors.topMargin: 234
        anchors.bottomMargin: 134
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
}

/*##^##
Designer {
    D{i:0;uuid:"bc7b0c70-7356-5722-bcbc-a9e32975173d"}D{i:1;uuid:"a164412a-ffef-5b3a-a1b4-0f4e53046362"}
D{i:2;uuid:"e9fd9dcc-aaa2-5084-9699-a816f04df439"}D{i:3;uuid:"ed0bfe73-4154-51de-a4ba-df60bcf60b59"}
D{i:4;uuid:"5c397327-a83b-5d96-95da-6b23ac9aafad"}D{i:5;uuid:"069b976e-953a-5bd8-94f0-c8457df85573"}
D{i:6;uuid:"61296e88-d414-53c8-9526-d5547be19bda"}D{i:7;uuid:"03a11cd5-af16-5612-9e67-187d8e9a7ee6"}
D{i:8;uuid:"53b93181-3273-5f5e-8cfa-33475cf5abac"}D{i:9;uuid:"9e724508-9afe-5920-93f6-8b20479c50b0"}
D{i:10;uuid:"36be5267-7276-5f13-985d-68d63eaca3bf"}D{i:11;uuid:"36be5267-7276-5f13-985d-68d63eaca3bf_ShapePath_0"}
D{i:12;uuid:"36be5267-7276-5f13-985d-68d63eaca3bf-PathSvg_0"}
}
##^##*/

