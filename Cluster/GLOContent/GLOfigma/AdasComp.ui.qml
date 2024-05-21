import QtQuick
import QtQuick.Controls
import QtQuick.Studio.DesignEffects
import QtQuick.Timeline 1.0
import GLO 1.0

Rectangle {
    id: adasComp
    width: 480
    height: 592
    color: "transparent"
    clip: true
    state: "AdasOFF"
    property alias txtADASEngText: txtADASEng.text
    property bool adasOFF: false
    property bool adasON: false

    Image {
        id: adasHaloVec
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 17
        anchors.topMargin: 55
        source: "assets/adasHaloVec.png"
    }

    Text {
        id: txtADASEng
        width: 256
        height: 31
        color: "#818181"
        text: qsTr("ADAS ENGAGED")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 117
        anchors.topMargin: 508
        font.letterSpacing: 4.938
        font.pixelSize: 26
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.NoWrap
        styleColor: "#1e1e1e"
        font.weight: Font.Normal
        font.family: "Oxanium"

        DesignEffect {
            effects: [
                DesignDropShadow {
                    color: "#878eff2b"
                    offsetY: 0
                    blur: 26
                }
            ]
        }
    }

    ADAS_Front {
        id: aDAS_Front
        width: 81
        height: 22
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 200
        anchors.topMargin: 37
        adasFRLeve3Opacity: 0
        adasFRLeve3FillColor: "#e0e0e0"
        adasFRLeve2Opacity: 0
        adasFRLeve1Opacity: 0
    }

    ADAS_Rear {
        id: aDAS_Rear
        width: 81
        height: 22
        visible: false
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 200
        anchors.topMargin: 549
        rotation: -180
    }

    ADAS_Right {
        id: aDAS_Right
        width: 81
        height: 22
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 397
        anchors.topMargin: 268
        adasRtLeve3Opacity: 1
        adasRtLeve2Opacity: 0
        adasRtLeve1Opacity: 0
        adasRtLeve3FillColor: "#e0e0e0"
        adasRtLeve2FillColor: "#fbf88d"
        adasRtLeve1FillColor: "#fbf88d"
        rotation: 82
    }

    ADAS_Left {
        id: aDAS_Left
        width: 81
        height: 22
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 3
        anchors.topMargin: 270
        adasLtLeve2Opacity: 0
        adasLtLeve3Opacity: 1
        adasLtLeve1Opacity: 0
        adasLtLeve3FillColor: "#e0e0e0"
        adasLtLeve2FillColor: "#fbf88d"
        adasLtLeve1FillColor: "#ff0000"
        rotation: -82
    }

    Timeline {
        id: timelineAdasCtrl
        startFrame: 0
        endFrame: 360
        enabled: true
        currentFrame: JsonData.adasRot

        KeyframeGroup {
            target: aDAS_Front
            property: "adasFRLeve1FillColor"
            Keyframe {
                value: "#ff0000"
                frame: 180
            }

            Keyframe {
                value: "#e0e0e0"
                frame: 270
            }

            Keyframe {
                value: "#e0e0e0"
                frame: 90
            }
        }

        KeyframeGroup {
            target: aDAS_Front
            property: "adasFRLeve2FillColor"
            Keyframe {
                value: "#ff0000"
                frame: 180
            }

            Keyframe {
                value: "#e0e0e0"
                frame: 270
            }

            Keyframe {
                value: "#fbf88d"
                frame: 210
            }

            Keyframe {
                value: "#fbf88d"
                frame: 150
            }

            Keyframe {
                value: "#e0e0e0"
                frame: 90
            }
        }

        KeyframeGroup {
            target: aDAS_Front
            property: "adasFRLeve3FillColor"
            Keyframe {
                value: "#ff0000"
                frame: 180
            }

            Keyframe {
                value: "#e0e0e0"
                frame: 270
            }

            Keyframe {
                value: "#fbf88d"
                frame: 210
            }

            Keyframe {
                value: "#fbf88d"
                frame: 240
            }

            Keyframe {
                value: "#fbf88d"
                frame: 150
            }

            Keyframe {
                value: "#fbf88d"
                frame: 120
            }

            Keyframe {
                value: "#e0e0e0"
                frame: 90
            }
        }

        KeyframeGroup {
            target: aDAS_Front
            property: "adasFRLeve1Opacity"
            Keyframe {
                value: 1
                frame: 180
            }

            Keyframe {
                value: 0
                frame: 210
            }

            Keyframe {
                value: 0
                frame: 150
            }

            Keyframe {
                value: 0
                frame: 0
            }
        }

        KeyframeGroup {
            target: aDAS_Front
            property: "adasFRLeve2Opacity"
            Keyframe {
                value: 1
                frame: 210
            }

            Keyframe {
                value: 1
                frame: 180
            }

            Keyframe {
                value: 0
                frame: 240
            }

            Keyframe {
                value: 1
                frame: 150
            }

            Keyframe {
                value: 0
                frame: 120
            }

            Keyframe {
                value: 0
                frame: 0
            }
        }

        KeyframeGroup {
            target: aDAS_Front
            property: "adasFRLeve3Opacity"
            Keyframe {
                value: 1
                frame: 180
            }

            Keyframe {
                value: 1
                frame: 210
            }

            Keyframe {
                value: 1
                frame: 240
            }

            Keyframe {
                value: 1
                frame: 270
            }

            Keyframe {
                value: 1
                frame: 150
            }

            Keyframe {
                value: 1
                frame: 120
            }

            Keyframe {
                value: 1
                frame: 90
            }

            Keyframe {
                value: 1
                frame: 0
            }
        }

        KeyframeGroup {
            target: aDAS_Left
            property: "adasLtLeve1FillColor"
            Keyframe {
                value: "#ff0000"
                frame: 70
            }

            Keyframe {
                value: "#ff0000"
                frame: 130
            }

            Keyframe {
                value: "#ff0000"
                frame: 10
            }

            Keyframe {
                value: "#ff0000"
                frame: 0
            }
        }

        KeyframeGroup {
            target: aDAS_Left
            property: "adasLtLeve2FillColor"
            Keyframe {
                value: "#ff0000"
                frame: 70
            }

            Keyframe {
                value: "#fbf88d"
                frame: 100
            }

            Keyframe {
                value: "#fbf88d"
                frame: 130
            }

            Keyframe {
                value: "#fbf88d"
                frame: 40
            }

            Keyframe {
                value: "#fbf88d"
                frame: 10
            }

            Keyframe {
                value: "#fbf88d"
                frame: 0
            }
        }

        KeyframeGroup {
            target: aDAS_Left
            property: "adasLtLeve1Opacity"
            Keyframe {
                value: 1
                frame: 70
            }

            Keyframe {
                value: 0
                frame: 100
            }

            Keyframe {
                value: 0
                frame: 130
            }

            Keyframe {
                value: 0
                frame: 40
            }

            Keyframe {
                value: 0
                frame: 10
            }

            Keyframe {
                value: 0
                frame: 0
            }
        }

        KeyframeGroup {
            target: aDAS_Left
            property: "adasLtLeve2Opacity"
            Keyframe {
                value: 1
                frame: 70
            }

            Keyframe {
                value: 1
                frame: 100
            }

            Keyframe {
                value: 0
                frame: 130
            }

            Keyframe {
                value: 1
                frame: 40
            }

            Keyframe {
                value: 0
                frame: 10
            }

            Keyframe {
                value: 0
                frame: 0
            }
        }

        KeyframeGroup {
            target: aDAS_Left
            property: "adasLtLeve3Opacity"
            Keyframe {
                value: 1
                frame: 70
            }

            Keyframe {
                value: 1
                frame: 100
            }

            Keyframe {
                value: 1
                frame: 130
            }

            Keyframe {
                value: 1
                frame: 40
            }

            Keyframe {
                value: 1
                frame: 10
            }

            Keyframe {
                value: 1
                frame: 0
            }
        }

        KeyframeGroup {
            target: aDAS_Left
            property: "adasLtLeve3FillColor"
            Keyframe {
                value: "#fbf88d"
                frame: 100
            }

            Keyframe {
                value: "#e0e0e0"
                frame: 130
            }

            Keyframe {
                value: "#ff0000"
                frame: 70
            }

            Keyframe {
                value: "#fbf88d"
                frame: 40
            }

            Keyframe {
                value: "#e0e0e0"
                frame: 10
            }

            Keyframe {
                value: "#e0e0e0"
                frame: 0
            }
        }

        KeyframeGroup {
            target: aDAS_Right
            property: "adasRtLeve1FillColor"
            Keyframe {
                value: "#ff0000"
                frame: 270
            }

            Keyframe {
                value: "#fbf88d"
                frame: 240
            }

            Keyframe {
                value: "#fbd97b"
                frame: 210
            }

            Keyframe {
                value: "#fbf88d"
                frame: 300
            }

            Keyframe {
                value: "#fbd97b"
                frame: 330
            }
        }

        KeyframeGroup {
            target: aDAS_Right
            property: "adasRtLeve1Opacity"
            Keyframe {
                value: 1
                frame: 270
            }

            Keyframe {
                value: 0
                frame: 240
            }

            Keyframe {
                value: 0
                frame: 210
            }

            Keyframe {
                value: 0
                frame: 300
            }

            Keyframe {
                value: 0
                frame: 330
            }

            Keyframe {
                value: 0
                frame: 0
            }
        }

        KeyframeGroup {
            target: aDAS_Right
            property: "adasRtLeve2FillColor"
            Keyframe {
                value: "#ff0000"
                frame: 270
            }

            Keyframe {
                value: "#fbf88d"
                frame: 240
            }

            Keyframe {
                value: "#fbd97b"
                frame: 210
            }

            Keyframe {
                value: "#fbf88d"
                frame: 300
            }

            Keyframe {
                value: "#fbd97b"
                frame: 330
            }
        }

        KeyframeGroup {
            target: aDAS_Right
            property: "adasRtLeve2Opacity"
            Keyframe {
                value: 1
                frame: 270
            }

            Keyframe {
                value: 1
                frame: 240
            }

            Keyframe {
                value: 0
                frame: 210
            }

            Keyframe {
                value: 1
                frame: 300
            }

            Keyframe {
                value: 0
                frame: 330
            }

            Keyframe {
                value: 0
                frame: 0
            }
        }

        KeyframeGroup {
            target: aDAS_Right
            property: "adasRtLeve3Opacity"
            Keyframe {
                value: 1
                frame: 270
            }

            Keyframe {
                value: 1
                frame: 240
            }

            Keyframe {
                value: 1
                frame: 210
            }

            Keyframe {
                value: 1
                frame: 300
            }

            Keyframe {
                value: 1
                frame: 330
            }

            Keyframe {
                value: 1
                frame: 0
            }
        }

        KeyframeGroup {
            target: aDAS_Right
            property: "adasRtLeve3FillColor"
            Keyframe {
                value: "#fbf88d"
                frame: 240
            }

            Keyframe {
                value: "#e0e0e0"
                frame: 210
            }

            Keyframe {
                value: "#ff0000"
                frame: 270
            }

            Keyframe {
                value: "#fbf88d"
                frame: 300
            }

            Keyframe {
                value: "#e0e0e0"
                frame: 330
            }

            Keyframe {
                value: "#e0e0e0"
                frame: 0
            }
        }
    }
    states: [
        State {
            name: "AdasOFF"
            when: adasOFF && !adasON

            PropertyChanges {
                target: adasHaloVec
                opacity: 0
            }

            PropertyChanges {
                target: txtADASEng
                width: 0
            }

            PropertyChanges {
                target: aDAS_Front
                opacity: 0
            }

            PropertyChanges {
                target: aDAS_Rear
                opacity: 0
            }

            PropertyChanges {
                target: aDAS_Right
                opacity: 0
            }

            PropertyChanges {
                target: aDAS_Left
                opacity: 0
            }
        },
        State {
            name: "AdasON"
            when: adasON && !adasOFF

            PropertyChanges {
                target: txtADASEng
                width: 257
            }

            PropertyChanges {
                target: timelineAdasCtrl
                enabled: true
            }

            PropertyChanges {
                target: adasComp
                clip: false
            }
        }
    ]
    transitions: [
        Transition {
            id: transition
            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: aDAS_Rear
                        property: "opacity"
                        duration: 1251
                    }
                }
            }

            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: aDAS_Front
                        property: "opacity"
                        duration: 1251
                    }
                }
            }

            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: aDAS_Right
                        property: "opacity"
                        duration: 1251
                    }
                }
            }

            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: adasHaloVec
                        property: "opacity"
                        duration: 247
                    }
                }
            }

            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: aDAS_Left
                        property: "opacity"
                        duration: 1252
                    }
                }
            }

            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: txtADASEng
                        property: "width"
                        duration: 462
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
    D{i:0;uuid:"97212efc-7f1f-5ef5-9364-24daa493dd12"}D{i:12;property:"adasFRLeve1FillColor";target:"aDAS_Front"}
D{i:16;property:"adasFRLeve2FillColor";target:"aDAS_Front"}D{i:17;property:"adasFRLeve2FillColor";target:"aDAS_Front"}
D{i:22;property:"adasFRLeve3FillColor";target:"aDAS_Front"}D{i:23;property:"adasFRLeve3FillColor";target:"aDAS_Front"}
D{i:24;property:"adasFRLeve3FillColor";target:"aDAS_Front"}D{i:30;property:"adasFRLeve1Opacity";target:"aDAS_Front"}
D{i:34;property:"adasFRLeve2Opacity";target:"aDAS_Front"}D{i:36;property:"adasFRLeve2Opacity";target:"aDAS_Front"}
D{i:42;property:"adasFRLeve3Opacity";target:"aDAS_Front"}D{i:43;property:"adasFRLeve3Opacity";target:"aDAS_Front"}
D{i:44;property:"adasFRLeve3Opacity";target:"aDAS_Front"}D{i:51;property:"adasLtLeve1FillColor";target:"aDAS_Left"}
D{i:52;property:"adasLtLeve1FillColor";target:"aDAS_Left"}D{i:56;property:"adasLtLeve2FillColor";target:"aDAS_Left"}
D{i:57;property:"adasLtLeve2FillColor";target:"aDAS_Left"}D{i:59;property:"adasLtLeve2FillColor";target:"aDAS_Left"}
D{i:63;property:"adasLtLeve1Opacity";target:"aDAS_Left"}D{i:64;property:"adasLtLeve1Opacity";target:"aDAS_Left"}
D{i:66;property:"adasLtLeve1Opacity";target:"aDAS_Left"}D{i:70;property:"adasLtLeve2Opacity";target:"aDAS_Left"}
D{i:71;property:"adasLtLeve2Opacity";target:"aDAS_Left"}D{i:73;property:"adasLtLeve2Opacity";target:"aDAS_Left"}
D{i:77;property:"adasLtLeve3Opacity";target:"aDAS_Left"}D{i:78;property:"adasLtLeve3Opacity";target:"aDAS_Left"}
D{i:80;property:"adasLtLeve3Opacity";target:"aDAS_Left"}D{i:83;property:"adasLtLeve3FillColor";target:"aDAS_Left"}
D{i:84;property:"adasLtLeve3FillColor";target:"aDAS_Left"}D{i:87;property:"adasLtLeve3FillColor";target:"aDAS_Left"}
D{i:91;property:"adasRtLeve1FillColor";target:"aDAS_Right"}D{i:92;property:"adasRtLeve1FillColor";target:"aDAS_Right"}
D{i:97;property:"adasRtLeve1Opacity";target:"aDAS_Right"}D{i:98;property:"adasRtLeve1Opacity";target:"aDAS_Right"}
D{i:104;property:"adasRtLeve2FillColor";target:"aDAS_Right"}D{i:105;property:"adasRtLeve2FillColor";target:"aDAS_Right"}
D{i:110;property:"adasRtLeve2Opacity";target:"aDAS_Right"}D{i:111;property:"adasRtLeve2Opacity";target:"aDAS_Right"}
D{i:117;property:"adasRtLeve3Opacity";target:"aDAS_Right"}D{i:118;property:"adasRtLeve3Opacity";target:"aDAS_Right"}
D{i:123;property:"adasRtLeve3FillColor";target:"aDAS_Right"}D{i:124;property:"adasRtLeve3FillColor";target:"aDAS_Right"}
D{i:140;transitionDuration:2000}
}
##^##*/

