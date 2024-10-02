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
    title: "GLO"

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
            Component.onCompleted:
            {
                if(Qt.platform.os === 'android')
                {
                    JsonData.simulationRunning = true
                }
            }
        }
    }

    property WebSocketServer wss: WebSocketServer
    {
        id: wsVehicleDataServer

        listen: true
        host: "127.0.0.1"
        port: 8080
        property WebSocket ws
        onClientConnected: function(webSocket) {
            ws = webSocket
            ws.onTextMessageReceived.connect(function(message) {
                console.log(qsTr("Server received message: %1").arg(message));
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
                case "lamps":
                    VehicleData.lights = ("true" === data[1])
                    break;
                case "adasEnabled":
                    VehicleData.driveMode = ("true" === data[1]) ? "ADAS" : "SPORT"
                    break;
                case "speed":
                    VehicleData.speed = Number(data[1])
                    break;
                default:
                    console.log("message went unhandled")
                }
            });
        }
        onErrorStringChanged: {
            console.log(qsTr("Server error: %1").arg(errorString));
        }

    }

    Window {
        id: controlsWindow
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
