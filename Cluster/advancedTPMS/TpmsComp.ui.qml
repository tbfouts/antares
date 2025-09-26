import QtQuick
import QtQuick.Controls
import QtQuick.Shapes 1.15
import VehicleData 1.0

Rectangle {
    id: tpmsComp
    width: 692
    height: 438
    color: "transparent"
    state: "tmpsON"
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
        anchors.leftMargin: 582
        anchors.rightMargin: 17
        anchors.topMargin: 88
        anchors.bottomMargin: 276
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
        anchors.leftMargin: 582
        anchors.rightMargin: 17
        anchors.topMargin: 368
        anchors.bottomMargin: -4
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
        anchors.leftMargin: 159
        anchors.rightMargin: 440
        anchors.topMargin: 88
        anchors.bottomMargin: 276
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
        anchors.leftMargin: 159
        anchors.rightMargin: 440
        anchors.topMargin: 368
        anchors.bottomMargin: -4
        font.pixelSize: 60
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Oxanium"
    }

    Rectangle {
        id: line_PSI_RF
        color: "#6e8665"
        radius: 4
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 522
        anchors.rightMargin: 113
        anchors.topMargin: 119
        anchors.bottomMargin: 315
    }

    Rectangle {
        id: line_PSI_RR
        color: "#6e8665"
        radius: 4
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 541
        anchors.rightMargin: 113
        anchors.topMargin: 399
        anchors.bottomMargin: 35
    }

    Rectangle {
        id: line_PSI_LF
        color: "#6e8665"
        radius: 4
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 233
        anchors.rightMargin: 402
        anchors.topMargin: 123
        anchors.bottomMargin: 311
    }

    Rectangle {
        id: line_PSI_LR
        color: "#6e8665"
        radius: 4
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 233
        anchors.rightMargin: 421
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
        anchors.leftMargin: 202
        anchors.rightMargin: 0
        anchors.topMargin: -6
        anchors.bottomMargin: 406
        font.letterSpacing: 4
        font.pixelSize: 36
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Oxanium"
    }
    states: [
        State {
            name: "tmpsON"
            when: VehicleData.adasOFF
        },
        State {
            name: "tpmsOFF"
            when: VehicleData.adasON

            PropertyChanges {
                target: txtPSI_RF
                opacity: 0
            }

            PropertyChanges {
                target: txtPSI_RR
                opacity: 0
            }

            PropertyChanges {
                target: txtPSI_LF
                opacity: 0
            }

            PropertyChanges {
                target: txtPSI_LR
                opacity: 0
            }

            PropertyChanges {
                target: line_PSI_RF
                opacity: 0
            }

            PropertyChanges {
                target: line_PSI_RR
                opacity: 0
            }

            PropertyChanges {
                target: line_PSI_LF
                opacity: 0
            }

            PropertyChanges {
                target: line_PSI_LR
                opacity: 0
            }

            PropertyChanges {
                target: txtADASEng
                opacity: 0
            }
        }
    ]
    transitions: [
        Transition {
            id: transition
            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 0
                    }

                    PropertyAnimation {
                        target: txtPSI_LF
                        property: "opacity"
                        duration: 2000
                    }
                }
            }

            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 0
                    }

                    PropertyAnimation {
                        target: line_PSI_LF
                        property: "opacity"
                        duration: 2000
                    }
                }
            }

            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 0
                    }

                    PropertyAnimation {
                        target: txtPSI_RR
                        property: "opacity"
                        duration: 2000
                    }
                }
            }

            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 0
                    }

                    PropertyAnimation {
                        target: txtPSI_LR
                        property: "opacity"
                        duration: 2000
                    }
                }
            }

            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 0
                    }

                    PropertyAnimation {
                        target: line_PSI_RR
                        property: "opacity"
                        duration: 2000
                    }
                }
            }

            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 0
                    }

                    PropertyAnimation {
                        target: txtADASEng
                        property: "opacity"
                        duration: 2000
                    }
                }
            }

            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 0
                    }

                    PropertyAnimation {
                        target: line_PSI_LR
                        property: "opacity"
                        duration: 2000
                    }
                }
            }

            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 0
                    }

                    PropertyAnimation {
                        target: line_PSI_RF
                        property: "opacity"
                        duration: 2000
                    }
                }
            }

            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 0
                    }

                    PropertyAnimation {
                        target: txtPSI_RF
                        property: "opacity"
                        duration: 2000
                    }
                }
            }
            to: "tmpsON"
            from: "tpmsOFF"
        }
    ]


}

/*##^##
Designer {
    D{i:0;uuid:"bc7b0c70-7356-5722-bcbc-a9e32975173d"}D{i:1;uuid:"a164412a-ffef-5b3a-a1b4-0f4e53046362"}
D{i:2;uuid:"e9fd9dcc-aaa2-5084-9699-a816f04df439"}D{i:3;uuid:"ed0bfe73-4154-51de-a4ba-df60bcf60b59"}
D{i:4;uuid:"5c397327-a83b-5d96-95da-6b23ac9aafad"}D{i:5;uuid:"069b976e-953a-5bd8-94f0-c8457df85573"}
D{i:6;uuid:"61296e88-d414-53c8-9526-d5547be19bda"}D{i:7;uuid:"03a11cd5-af16-5612-9e67-187d8e9a7ee6"}
D{i:8;uuid:"53b93181-3273-5f5e-8cfa-33475cf5abac"}D{i:9;uuid:"9e724508-9afe-5920-93f6-8b20479c50b0"}
D{i:21;transitionDuration:2000}
}
##^##*/

