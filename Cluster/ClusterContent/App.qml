// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.7
import Cluster
import QtWebSockets
import VehicleData 1.0
import ClusterContent 1.0

Window {
    id: root
    width: mainScreen.width
    height: mainScreen.height

    property string webSocketAddress: "127.0.0.1"
    property string webSocketPort: "5555"
    property string currentTestName: ""

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

        Text {
            id: testName
            text: "Now testing: " + root.currentTestName
            visible: "" != root.currentTestName
            anchors.bottom: bg.bottom
            font.pixelSize: 60
            color: "light gray"
            anchors.bottomMargin: 100
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    property WebSocketServer wss: WebSocketServer
    {
        id: wsVehicleDataServer

        listen: true
        host: root.webSocketAddress
        port: root.webSocketPort
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
                case "testName":
                    root.currentTestName = data[1]
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
        visible: true
        x: mainScreen.x + 1180
        y: mainScreen.y + 1320

        Loader
        {
            active: parent.visible
            sourceComponent: Component
            {
                Screen02
                {
                    address: root.webSocketAddress
                    portNumber: root.webSocketPort
                }
            }
        }
    }

    Component.onDestruction: controlsWindow.close()
}
