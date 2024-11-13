// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.7
import GLO
import QtWebSockets
import VehicleData 1.0

Window {
    width: mainScreen.width
    height: mainScreen.height

    visibility: Qt.platform.os === 'android' ? Window.FullScreen : Window.AutomaticVisibility

    visible: true
    title: "Antares Cluster"

    Rectangle
    {
        id: bg
        anchors.fill: parent
        color: "black"

        Screen01 {
            id: mainScreen
            anchors.centerIn: parent

            transform: Scale {
                origin.x: mainScreen.width / 2
                origin.y: mainScreen.height / 2
                readonly property real xRatio: bg.width / mainScreen.width
                readonly property real yRatio: bg.height / mainScreen.height
                xScale: Math.min(xRatio, yRatio)
                yScale: Math.min(xRatio, yRatio)
            }
        }
    }

    property WebSocketServer wss: WebSocketServer
    {
        id: wsVehicleDataServer

        listen: true
        host: "127.0.0.1"
        port: 5555
        property WebSocket ws
        onClientConnected: function(webSocket) {
            ws = webSocket
            ws.onTextMessageReceived.connect(function(message) {
                console.log(qsTr("Cluster received message: %1").arg(message));
                const data = message.split(":")

                switch(data[0]){
                case "theme":
                    Themes.state = data[1]
                    break;
                case "doorLeft":
                    VehicleData.doorDrvr = ("true" === data[1])
                    break;
                case "doorRight":
                    VehicleData.doorPsgr = ("true" === data[1])
                    break;
                case "turnSignalLeft":
                    VehicleData.switchTurnL = ("true" === data[1])
                    break;
                case "turnSignalRight":
                    VehicleData.switchTurnR = ("true" === data[1])
                    break;
                case "qsrIcons":
                    VehicleData.qsrIcons = ("true" === data[1])
                    break;
                case "gear":
                    VehicleData.gear = ("true" === data[1])
                    break;
                case "lamps":
                    VehicleData.lights = ("true" === data[1])
                    break;
                case "adasEnabled":
                    VehicleData.driveMode = ("true" === data[1]) ? "ADAS" : "SPORT"
                    break;
                case "speed":
                    VehicleData.speed = Number(data[1])
                    break;
                case "fuel":
                    VehicleData.fuel = Number(data[1])
                    break;
                case "battery":
                    VehicleData.battery = Number(data[1])
                    break;
                case "adasRot":
                    VehicleData.adasRot = Number(data[1])
                    break;
                case "units":
                    VehicleData.units = data[1]
                    break;

                default:
                    console.log("Warning: message went unhandled")
                }
            });
        }
        onErrorStringChanged: {
            console.log(qsTr("Server error: %1").arg(errorString));
        }

    }

    Window {
        id: controlsWindow
        title: "Antares Controls"
        width: 1000
        height: 400
        visible: Qt.platform.os !== 'android'
        x: mainScreen.x + 1180
        y: mainScreen.y + 1320

        Screen02 {
            id: controlPanel
        }
    }

    Component.onDestruction: controlsWindow.close()
}
