import QtQuick
import QtQuick.Controls
import VehicleData 1.0
import QtQuick.Timeline 1.0

Rectangle {
    id: adasDRV
    width: 851
    height: 649
    color: "transparent"
    property alias txtADASEngText: txtADASEng.text

    Image {
        id: adasBorder
        width: 560
        visible: true
        source: "assets/adasBorder.png"
        anchors.centerIn: parent
    }

    Text {
        id: txtADASEng
        width: 389
        height: 31
        color: "#818181"
        text: qsTr("ADAS ENGAGED")
        anchors.verticalCenter: parent.verticalCenter
        font.letterSpacing: 7.594
        font.pixelSize: 40
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Oxanium"
        anchors.verticalCenterOffset: 202
        anchors.horizontalCenterOffset: 9
        anchors.horizontalCenter: parent.horizontalCenter
    }

    ADAS_FRT {
        id: aDAS_FRT
        width: 117
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 367
        anchors.topMargin: 150
        adasFRLeveAOpacity: 0
        adasFRLeveBOpacity: 0
        adasFRLeveC_ShapePath_0FillColor: "#c3c1a1"
        adasFRLeveB_ShapePath_0FillColor: "#d6d4ad"
        adasFRLeveA_ShapePath_0FillColor: "#d3d3d3"
    }

    ADAS_LT {
        id: aDAS_LT
        width: 145
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 125
        anchors.topMargin: 241
        adasLtLeveCOpacity: 1
        adasLtLeveBOpacity: 1
        adasLtLeveAOpacity: 0
        adasLtLeveA_ShapePath_0FillColor: "#cfc93b"
        adasLtLeveB_ShapePath_0FillColor: "#cfc93b"
        adasLtLeveC_ShapePath_0FillColor: "#cfc93b"
        rotation: -60.75
    }

    ADAS_RT {
        id: aDAS_RT
        width: 145
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 591
        anchors.topMargin: 259
        adasRtLeveA_ShapePath_0FillColor: "#cf3b3b"
        adasRtLeveB_ShapePath_0FillColor: "#cfc93b"
        adasRtLeveC_ShapePath_0FillColor: "#eaeaea"
        adasRtLeveCOpacity: 1
        adasRtLeveBOpacity: 1
        adasRtLeveAOpacity: 1
        rotation: 60.711
    }


    Timeline {
        id: timelineADAS
        currentFrame: VehicleData.adasRot
        animations: [
            TimelineAnimation {
                id: animationADAS
                running: false
                loops: 1
                duration: 1000
                to: 360
                from: 0
            }
        ]
        startFrame: 0
        endFrame: 360
        enabled: true

        KeyframeGroup {
            target: aDAS_FRT
            property: "adasFRLeveAOpacity"
            Keyframe {
                value: 1
                frame: 180
            }

            Keyframe {
                value: 0
                frame: 0
            }

            Keyframe {
                value: 0
                frame: 90
            }

            Keyframe {
                value: 0
                frame: 135
            }

            Keyframe {
                value: 0
                frame: 225
            }

            Keyframe {
                value: 0
                frame: 270
            }

            Keyframe {
                value: 0
                frame: 360
            }
        }

        KeyframeGroup {
            target: aDAS_FRT
            property: "adasFRLeveA_ShapePath_0FillColor"
            Keyframe {
                value: "#cf3b3b"
                frame: 180
            }

            Keyframe {
                value: "#cfc93b"
                frame: 0
            }

            Keyframe {
                value: "#cfc93b"
                frame: 135
            }

            Keyframe {
                value: "#d3d3d3"
                frame: 90
            }

            Keyframe {
                value: "#cfc93b"
                frame: 225
            }

            Keyframe {
                value: "#d3d3d3"
                frame: 270
            }

            Keyframe {
                value: "#cfc93b"
                frame: 360
            }
        }

        KeyframeGroup {
            target: aDAS_FRT
            property: "adasFRLeveBOpacity"
            Keyframe {
                value: 1
                frame: 180
            }

            Keyframe {
                value: 0
                frame: 0
            }

            Keyframe {
                value: 0.5
                frame: 135
            }

            Keyframe {
                value: 0.5
                frame: 225
            }

            Keyframe {
                value: 0
                frame: 360
            }

            Keyframe {
                value: 0
                frame: 90
            }

            Keyframe {
                value: 0
                frame: 270
            }
        }

        KeyframeGroup {
            target: aDAS_FRT
            property: "adasFRLeveB_ShapePath_0FillColor"
            Keyframe {
                value: "#cf3b3b"
                frame: 180
            }

            Keyframe {
                value: "#cfc93b"
                frame: 135
            }

            Keyframe {
                value: "#cfc93b"
                frame: 0
            }

            Keyframe {
                value: "#d6d4ad"
                frame: 90
            }

            Keyframe {
                value: "#cfc93b"
                frame: 225
            }

            Keyframe {
                value: "#d6d4ad"
                frame: 270
            }

            Keyframe {
                value: "#cfc93b"
                frame: 360
            }
        }

        KeyframeGroup {
            target: aDAS_FRT
            property: "adasFRLeveCOpacity"
            Keyframe {
                value: 1
                frame: 180
            }

            Keyframe {
                value: 0.5
                frame: 0
            }

            Keyframe {
                value: 1
                frame: 360
            }
        }

        KeyframeGroup {
            target: aDAS_FRT
            property: "adasFRLeveC_ShapePath_0FillColor"
            Keyframe {
                value: "#cf3b3b"
                frame: 180
            }

            Keyframe {
                value: "#adadad"
                frame: 0
            }

            Keyframe {
                value: "#cfc93b"
                frame: 135
            }

            Keyframe {
                value: "#c3c1a1"
                frame: 90
            }

            Keyframe {
                value: "#cfc93b"
                frame: 225
            }

            Keyframe {
                value: "#c3c1a1"
                frame: 270
            }

            Keyframe {
                value: "#adadad"
                frame: 360
            }
        }

        KeyframeGroup {
            target: aDAS_LT
            property: "adasLtLeveC_ShapePath_0FillColor"

            Keyframe {
                value: "#cf3b3b"
                frame: 0
            }


            Keyframe {
                value: "#d3d3d3"
                frame: 180
            }

            Keyframe {
                value: "#cf3b3b"
                frame: 90
            }

            Keyframe {
                value: "#cfc93b"
                frame: 135
            }
        }

        KeyframeGroup {
            target: aDAS_LT
            property: "adasLtLeveB_ShapePath_0FillColor"
            Keyframe {
                value: "#d3d3d3"
                frame: 180
            }

            Keyframe {
                value: "#cf3b3b"
                frame: 0
            }

            Keyframe {
                value: "#cf3b3b"
                frame: 90
            }

            Keyframe {
                value: "#cfc93b"
                frame: 135
            }
        }

        KeyframeGroup {
            target: aDAS_LT
            property: "adasLtLeveA_ShapePath_0FillColor"
            Keyframe {
                value: "#d3d3d3"
                frame: 180
            }

            Keyframe {
                value: "#cf3b3b"
                frame: 0
            }

            Keyframe {
                value: "#cf3b3b"
                frame: 90
            }

            Keyframe {
                value: "#cfc93b"
                frame: 135
            }
        }

        KeyframeGroup {
            target: aDAS_LT
            property: "adasLtLeveAOpacity"
            Keyframe {
                value: 0
                frame: 180
            }

            Keyframe {
                value: 1
                frame: 0
            }

            Keyframe {
                value: 1
                frame: 90
            }

            Keyframe {
                value: 0
                frame: 135
            }
        }

        KeyframeGroup {
            target: aDAS_LT
            property: "adasLtLeveBOpacity"
            Keyframe {
                value: 0
                frame: 180
            }

            Keyframe {
                value: 1
                frame: 0
            }

            Keyframe {
                value: 1
                frame: 90
            }

            Keyframe {
                value: 0.5
                frame: 135
            }
        }

        KeyframeGroup {
            target: aDAS_LT
            property: "adasLtLeveCOpacity"

            Keyframe {
                value: 0.5
                frame: 180
            }

            Keyframe {
                value: 1
                frame: 0
            }

            Keyframe {
                value: 1
                frame: 90
            }

            Keyframe {
                value: 1
                frame: 135
            }
        }

        KeyframeGroup {
            target: aDAS_RT
            property: "adasRtLeveAOpacity"
            Keyframe {
                value: 0
                frame: 0
            }

            Keyframe {
                value: 0
                frame: 180
            }

            Keyframe {
                value: 0
                frame: 225
            }

            Keyframe {
                value: 1
                frame: 270
            }

            Keyframe {
                value: 1
                frame: 360
            }
        }

        KeyframeGroup {
            target: aDAS_RT
            property: "adasRtLeveBOpacity"
            Keyframe {
                value: 0
                frame: 0
            }

            Keyframe {
                value: 0
                frame: 180
            }

            Keyframe {
                value: 1
                frame: 270
            }

            Keyframe {
                value: 0.5
                frame: 225
            }

            Keyframe {
                value: 1
                frame: 360
            }
        }

        KeyframeGroup {
            target: aDAS_RT
            property: "adasRtLeveC_ShapePath_0FillColor"
            Keyframe {
                value: "#d3d3d3"
                frame: 0
            }

            Keyframe {
                value: "#cf3b3b"
                frame: 270
            }

            Keyframe {
                value: "#cfc93b"
                frame: 225
            }

            Keyframe {
                value: "#eaeaea"
                frame: 180
            }

            Keyframe {
                value: "#cf3b3b"
                frame: 360
            }
        }

        KeyframeGroup {
            target: aDAS_RT
            property: "adasRtLeveCOpacity"
            Keyframe {
                value: 0.5
                frame: 0
            }

            Keyframe {
                value: 0.5
                frame: 90
            }

            Keyframe {
                value: 0.5
                frame: 180
            }

            Keyframe {
                value: 0.75
                frame: 225
            }

            Keyframe {
                value: 1
                frame: 270
            }

            Keyframe {
                value: 1
                frame: 360
            }
        }

        KeyframeGroup {
            target: aDAS_RT
            property: "adasRtLeveB_ShapePath_0FillColor"
            Keyframe {
                value: "#cf3b3b"
                frame: 270
            }

            Keyframe {
                value: "#eaeaea"
                frame: 180
            }

            Keyframe {
                value: "#cfc93b"
                frame: 225
            }

            Keyframe {
                value: "#cf3b3b"
                frame: 360
            }
        }

        KeyframeGroup {
            target: aDAS_RT
            property: "adasRtLeveA_ShapePath_0FillColor"
            Keyframe {
                value: "#eaeaea"
                frame: 180
            }

            Keyframe {
                value: "#cfc93b"
                frame: 225
            }

            Keyframe {
                value: "#cf3b3b"
                frame: 270
            }

            Keyframe {
                value: "#cf3b3b"
                frame: 360
            }
        }
    }
    states: [
        State {
            name: "adasON"
            when: VehicleData.adas

            PropertyChanges {
                target: adasBorder
                opacity: 1
            }

            PropertyChanges {
                target: txtADASEng
                opacity: 1
            }

            PropertyChanges {
                target: aDAS_FRT
                opacity: 1
            }

            PropertyChanges {
                target: aDAS_RT
                opacity: 1
            }

            PropertyChanges {
                target: aDAS_LT
                opacity: 1
            }
        },
        State {
            name: "adasOFF"
            when: !VehicleData.adas

            PropertyChanges {
                target: adasBorder
                opacity: 0
            }

            PropertyChanges {
                target: txtADASEng
                opacity: 0
            }

            PropertyChanges {
                target: aDAS_FRT
                opacity: 0
            }

            PropertyChanges {
                target: aDAS_RT
                opacity: 0
            }

            PropertyChanges {
                target: aDAS_LT
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
                        target: aDAS_LT
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
                        target: aDAS_FRT
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
                        target: adasBorder
                        property: "opacity"
                        duration: 1803
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
                        duration: 1639
                    }
                }
            }

            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 0
                    }

                    PropertyAnimation {
                        target: aDAS_RT
                        property: "opacity"
                        duration: 2000
                    }
                }
            }
            to: "*"
            from: "*"
        }
    ]
}

/*##^##
Designer {
    D{i:0;uuid:"110f5d8c-5d30-531b-b778-2aca5c38a693"}D{i:1;uuid:"dac85b4b-8afe-559c-8ea0-f989f2c9cc1b"}
D{i:2;uuid:"fc54a9e4-b187-5b29-8b15-06bb5b4b8f2c"}D{i:3;uuid:"66fae9aa-5827-5d47-889e-06982c06ad56"}
D{i:4;uuid:"ae110756-63e9-54d7-a322-cac811537b77"}D{i:5;uuid:"bb3702d0-bbab-58ab-9295-29bc2d33f657"}
D{i:10;property:"adasFRLeveAOpacity";target:"aDAS_FRT"}D{i:11;property:"adasFRLeveAOpacity";target:"aDAS_FRT"}
D{i:12;property:"adasFRLeveAOpacity";target:"aDAS_FRT"}D{i:18;property:"adasFRLeveA_ShapePath_0FillColor";target:"aDAS_FRT"}
D{i:19;property:"adasFRLeveA_ShapePath_0FillColor";target:"aDAS_FRT"}D{i:20;property:"adasFRLeveA_ShapePath_0FillColor";target:"aDAS_FRT"}
D{i:26;property:"adasFRLeveBOpacity";target:"aDAS_FRT"}D{i:27;property:"adasFRLeveBOpacity";target:"aDAS_FRT"}
D{i:34;property:"adasFRLeveB_ShapePath_0FillColor";target:"aDAS_FRT"}D{i:35;property:"adasFRLeveB_ShapePath_0FillColor";target:"aDAS_FRT"}
D{i:36;property:"adasFRLeveB_ShapePath_0FillColor";target:"aDAS_FRT"}D{i:42;property:"adasFRLeveCOpacity";target:"aDAS_FRT"}
D{i:46;property:"adasFRLeveC_ShapePath_0FillColor";target:"aDAS_FRT"}D{i:47;property:"adasFRLeveC_ShapePath_0FillColor";target:"aDAS_FRT"}
D{i:48;property:"adasFRLeveC_ShapePath_0FillColor";target:"aDAS_FRT"}D{i:53;property:"adasLtLeveC_ShapePath_0FillColor";target:"aDAS_LT"}
D{i:59;property:"adasLtLeveB_ShapePath_0FillColor";target:"aDAS_LT"}D{i:64;property:"adasLtLeveA_ShapePath_0FillColor";target:"aDAS_LT"}
D{i:69;property:"adasLtLeveAOpacity";target:"aDAS_LT"}D{i:74;property:"adasLtLeveBOpacity";target:"aDAS_LT"}
D{i:79;property:"adasLtLeveCOpacity";target:"aDAS_LT"}D{i:86;property:"adasRtLeveAOpacity";target:"aDAS_RT"}
D{i:91;property:"adasRtLeveBOpacity";target:"aDAS_RT"}D{i:96;property:"adasRtLeveC_ShapePath_0FillColor";target:"aDAS_RT"}
D{i:105;property:"adasRtLeveCOpacity";target:"aDAS_RT"}D{i:108;property:"adasRtLeveB_ShapePath_0FillColor";target:"aDAS_RT"}
D{i:115;property:"adasRtLeveA_ShapePath_0FillColor";target:"aDAS_RT"}D{i:129;transitionDuration:2000}
}
##^##*/

