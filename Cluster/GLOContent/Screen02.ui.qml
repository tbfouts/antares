/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/

import QtQuick 2.15
import QtQuick.Controls 2.15
import GLO 1.0

Rectangle {
    id: controlPanel
    width: 1000
    height: 400
    color: "#1e1e1e"

    Slider {
        id: sliderSpeed
        x: 17
        y: 45
        width: 575
        height: 40
        value: 20
        stepSize: 1

        Connections {
            target: sliderSpeed
            onValueChanged: {
                (JsonData.speed = sliderSpeed.value)
            }
        }
        Connections {
            target: sliderSpeed
            onValueChanged: {
                if (sliderSpeed.value >= 1)
                    (switchGear.enabled = false)
                            (JsonData.gear = false)

                else if (sliderSpeed.value < 1)
                    (switchGear.enabled = true)
                            (JsonData.gear = true)

            }

        }

        Text {
            id: textSPEED
            x: 256
            y: 30
            width: 64
            height: 18
            color: "#e9e9e9"
            text: qsTr("SPEED")
            font.pixelSize: 20
            font.family: "Oxanium"
        }

        Connections {
            target: sliderSpeed
            //onMoved: console.log("clicked")
        }
        to: 130
    }

    Slider {
        id: sliderFuel
        x: 53
        y: 127
        width: 210
        height: 13
        value: 100
        stepSize: 1

        Connections {
            target: sliderFuel
            onValueChanged: JsonData.fuel = sliderFuel.value
        }

        Text {
            id: textFuel
            x: 72
            y: 14
            width: 52
            height: 18
            color: "#e9e9e9"
            text: qsTr("FUEL")
            font.pixelSize: 20
            font.family: "Oxanium"
        }
        to: 100
    }

    Slider {
        id: sliderBattery
        x: 343
        y: 127
        width: 210
        height: 13
        value: 100
        stepSize: 1

        Connections {
            target: sliderBattery
            onValueChanged: JsonData.battery = sliderBattery.value
        }

        Text {
            id: textBattery
            x: 59
            y: 14
            width: 93
            height: 18
            color: "#e9e9e9"
            text: qsTr("BATTERY")
            font.pixelSize: 20
            font.family: "Oxanium"
        }
        to: 100
    }

    Switch {
        id: switchGear
        x: 48
        y: 189
        text: qsTr("GEAR")
        font.pointSize: 20
        font.styleName: "Regular"
        font.family: "Oxanium"
        font.bold: true
        icon.color: "#ffffff"

        Connections {
            target: switchGear
            onToggled: {
                if (JsonData.gear === true)
                    (JsonData.gear = false)

                else if (JsonData.gear === false)
                    (JsonData.gear = true)

            }
        }
    }

    Switch {
        id: switchAdas
        x: 751
        y: 49
        text: qsTr("ADAS")
        font.family: "Oxanium"
        font.pointSize: 20

        Connections {
            target: switchAdas
            onToggled: {
                if (JsonData.adas === false)
                    (JsonData.adas = true)
                            (dialAdas.enabled = true)
                else if (JsonData.adas === true)
                    (JsonData.adas = false)
                            (dialAdas.enabled = false)

            }
        }

        Connections {
            target: switchAdas
            onToggled: {
             if (JsonData.adas === false)
                (adasText.opacity = 0.8)
                (dialAdas.opacity = 1)
             else if (JsonData.adas === true)
                 (adasText.opacity = 0)
             (dialAdas.opacity = 0.4)

            }
        }
    }

    Switch {
        id: switchLights
        x: 424
        y: 189
        text: qsTr("LIGHTS")
        font.pointSize: 20
        font.family: "Oxanium"

        Connections {
            target: switchLights
            onToggled: {
                if (JsonData.lights === false)
                    JsonData.lights = true
                else if (JsonData.lights === true)
                    JsonData.lights = false
            }

        }
    }

    Switch {
        id: switchDoorL
        x: 120
        y: 258
        text: qsTr("DOOR LEFT")
        font.pointSize: 18
        font.family: "Oxanium"
        enabled: true

        Connections {
            target: switchDoorL
            onToggled: {
                if (JsonData.doorDrvr === false)
                    JsonData.doorDrvr = true
                else if (JsonData.doorDrvr === true)
                    JsonData.doorDrvr = false
            }

        }
    }

    Switch {
        id: switchDoorR
        x: 327
        y: 258
        text: qsTr("DOOR RIGHT")
        font.pointSize: 18
        font.family: "Oxanium"
        enabled: true

        Connections {
            target: switchDoorR
            onToggled: {
                if (JsonData.doorPsgr === false)
                    JsonData.doorPsgr = true
                else if (JsonData.doorPsgr === true)
                    JsonData.doorPsgr = false
            }

        }
    }

    ComboBox {
        id: comboBox
        x: 53
        y: 329
        width: 124
        height: 30
        rightPadding: 20
        wheelEnabled: true
        font.pointSize: 18
        font.family: "Oxanium"
        editable: false
        onActivated: Themes.currentTheme = comboBox.currentText

        model: ListModel {
            id: themeSelect
            ListElement { text: "stardust"}
            ListElement { text: "luna" }
            ListElement { text: "pixel" }
            ListElement { text: "electric" }
            ListElement { text: "crystal" }
            ListElement { text: "sonic" }
            ListElement { text: "ethereal" }
            ListElement { text: "mind" }
            ListElement { text: "gravity" }
            ListElement { text: "zen" }
            ListElement { text: "ultraviolet" }
            ListElement { text: "velvet" }
        }

        Text {
            id: textTHEME
            x: 130
            y: 6
            width: 64
            height: 18
            color: "#e9e9e9"
            text: qsTr("THEME")
            font.pixelSize: 18
            font.family: "Oxanium"
        }
    }

    Text {
        id: textSpd
        x: sliderSpeed.handle.x + 5
        y: 39
        width: 37
        height: 17
        text: sliderSpeed.value.toFixed(0)
        font.pixelSize: 18
        horizontalAlignment: Text.AlignHCenter
        font.family: "Oxanium"
        color: "#48a7ff"
    }

    Text {
        id: textFuelValue
        x: sliderFuel.handle.x + 38
        y: 104
        width: 43
        height: 23
        color: "#48a7ff"
        text: sliderFuel.value.toFixed(0)
        font.pixelSize: 18
        horizontalAlignment: Text.AlignHCenter
        font.family: "Oxanium"
    }

    Text {
        id: textBatteryValue
        x: sliderBattery.handle.x + 326
        y: 104
        width: 43
        height: 23
        color: "#48a7ff"
        text: sliderBattery.value.toFixed(0)
        font.pixelSize: 18
        horizontalAlignment: Text.AlignHCenter
        font.family: "Oxanium"
    }

    Button {
        id: buttonLeftTurn
        x: 309
        y: 329
        width: 116
        height: 30
        text: qsTr("< LEFT TURN")
        checked: false
        font.pointSize: 16
        font.family: "Oxanium"
        autoExclusive: true
        checkable: true

        Connections {
            target: buttonLeftTurn
            onPressed: (JsonData.switchTurnL = true) && (JsonData.switchTurnR = false)
        }
    }

    Button {
        id: buttonLeftRight
        x: 481
        y: 329
        width: 116
        height: 30
        text: qsTr("RIGHT TURN >")
        checked: false
        font.pointSize: 16
        font.family: "Oxanium"
        autoExclusive: true
        checkable: true

        Connections {
            target: buttonLeftRight
            onPressed: (JsonData.switchTurnR = true) && (JsonData.switchTurnL = false)
        }
    }

    Button {
        id: buttonSignalsOff
        x: 431
        y: 329
        width: 44
        height: 30
        text: qsTr("OFF")
        checked: false
        font.pointSize: 16
        font.family: "Oxanium"
        autoExclusive: true
        checkable: false

        Connections {
            target: buttonSignalsOff
            onPressed: (JsonData.switchTurnR = false) && (JsonData.switchTurnL = false)
        }
    }

    Switch {
        id: switchQSR
        x: 248
        y: 191
        text: qsTr("QSR")
        font.pointSize: 18
        font.family: "Oxanium"

        Connections {
            target: switchQSR
            onToggled: {
                if (JsonData.qsrIcons === true)
                    JsonData.qsrIcons = false
                else if (JsonData.qsrIcons === false)
                    JsonData.qsrIcons = true
            }
        }
    }

    Dial {
        id: dialAdas
        x: 673
        y: 104
        width: 280
        height: 280
        opacity: 0.4
        value: 180
        stepSize: 1
        enabled: false

        Connections {
            target: dial
            onValueChanged: JsonData.adasRot = dialAdas.value
        }

        Image {
            id: adasText
            x: -3
            y: -6
            opacity: 0
            source: "GLOfigma/assets/adasText.png"
            fillMode: Image.PreserveAspectFit
        }
        to: 360
    }



}
