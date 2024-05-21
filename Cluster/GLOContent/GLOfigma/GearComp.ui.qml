import QtQuick
import QtQuick.Controls
import QtQuick.Timeline 1.0

Rectangle {
    id: gearComp
    width: 51
    height: 272
    color: "transparent"
    state: "Drive"
    property alias txtGearDText: txtGearD.text
    property alias txtGearR1Text: txtGearP.text
    property alias txtGearRText: txtGearR.text
    property bool modePark: false
    property bool modeDrive: true

    Text {
        id: txtGearD
        y: 79
        width: 39
        height: 72
        color: "#9b9b9b"
        text: qsTr("D")
        font.pixelSize: 60
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Bold
        font.family: "Oxanium"
    }

    Text {
        id: txtGearR
        x: 6
        y: 43
        color: "#464646"
        text: qsTr("R")
        font.pixelSize: 45
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Light
        font.family: "Oxanium"
    }

    Text {
        id: txtGearP
        x: 6
        y: 0
        color: "#464646"
        text: qsTr("P")
        font.pixelSize: 45
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Light
        font.family: "Oxanium"
    }
    states: [
        State {
            name: "Drive"
            when: modeDrive && !modePark
        },
        State {
            name: "Park"
            when: modePark && !modeDrive

            PropertyChanges {
                target: txtGearD
                x: 6
                y: 168
                color: "#464646"
                font.pixelSize: 45
                font.styleName: "Light"
                font.family: "Oxanium"
                font.weight: Font.Medium
            }

            PropertyChanges {
                target: txtGearR
                x: 6
                y: 126
            }

            PropertyChanges {
                target: txtGearP
                x: 0
                y: 75
                width: 43
                height: 52
                color: "#9e9ea0"
                font.pixelSize: 60
                font.styleName: "Bold"
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
                        target: txtGearP
                        property: "color"
                        duration: 251
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: txtGearP
                        property: "font.pixelSize"
                        duration: 251
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: txtGearP
                        property: "height"
                        duration: 251
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: txtGearP
                        property: "width"
                        duration: 251
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: txtGearP
                        property: "x"
                        duration: 251
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: txtGearP
                        property: "y"
                        duration: 251
                    }
                }
            }

            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: txtGearD
                        property: "color"
                        duration: 251
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: txtGearD
                        property: "font.pixelSize"
                        duration: 251
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: txtGearD
                        property: "font.weight"
                        duration: 251
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: txtGearD
                        property: "x"
                        duration: 251
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: txtGearD
                        property: "y"
                        duration: 251
                    }
                }
            }

            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: txtGearR
                        property: "x"
                        duration: 251
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: txtGearR
                        property: "y"
                        duration: 251
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
    D{i:0;uuid:"2c7394f1-482e-57d1-a84f-e6681fd9f785"}D{i:1;uuid:"45c8a16a-532b-5d65-860b-b97cd1666484"}
D{i:2;uuid:"a5ab7368-241c-504d-9be1-7840e87234fc"}D{i:3}D{i:9;transitionDuration:2000}
}
##^##*/

