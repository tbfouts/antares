pragma Singleton

import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Studio.Utils 1.0
import QtWebSockets
import GLO 1.0
import VehicleData 1.0

Item {
    id: jsonBackEnd
    // source: Qt.resolvedUrl("data.json")

    enum UnitType
    {
        Metric,
        Imperial
    }

    enum DriveMode
    {
        Adas,
        Sport
    }

    property var driveMode: JsonData.DriveMode.Sport
    property var units: JsonData.UnitType.Imperial

    property string demoMode: "manual"
    property bool simulationRunning: false

    property int speed: 0
    property int fuel: 100
    property int battery: 100
    property int adasRot: 0

    onAdasRotChanged: console.log(adasRot)

    property bool lights: true
    property bool adas: false
    property bool doorDrvr: false
    property bool doorPsgr: false
    property bool gear: speed == 0
    property bool switchTurnL: false
    property bool switchTurnR: false
    property bool qsrIcons: gear

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
                    doorDrvr = ("true" === data[1])
                    break;
                case "doorRight":
                    doorPsgr = ("true" === data[1])
                    break;
                case "lamps":
                    lights = ("true" === data[1])
                    break;
                case "adasEnabled":
                    driveMode = ("true" === data[1]) ? JsonData.DriveMode.Adas : JsonData.DriveMode.Sport
                    break;
                case "speed":
                    speed = Number(data[1])
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

    states: [
            State {
                name: "manual"
                when: jsonBackEnd.demoMode === "manual"

                PropertyChanges {
                target: drivingSimulation
                paused: true
                }


            },
            State {
                name: "auto"
                when: jsonBackEnd.demoMode === "auto"

                PropertyChanges {
                target: drivingSimulation
                paused: false
                }

                PropertyChanges {
                target: adasSimulation
                paused: false
                }
            }
    ]

    // speed
       SequentialAnimation {
           id: drivingSimulation
           running: simulationRunning
           paused: false
           loops: Animation.Infinite
           PauseAnimation { duration: 5000 }
           PropertyAnimation {
               property: "speed"
               duration: 9000
               target: jsonBackEnd
               from: 0
               to: 55
               easing.type: Easing.InOutQuad;
           }
           PropertyAnimation {
               property: "speed"
               duration: 5000
               target: jsonBackEnd
               from: 55
               to: 75
               easing.type: Easing.InOutQuad;
           }
           PropertyAnimation {
               property: "speed"
               duration: 4000
               target: jsonBackEnd
               from: 75
               to: 40
               easing.type: Easing.InOutQuad;
           }
           PropertyAnimation {
               property: "speed"
               duration: 6000
               target: jsonBackEnd
               from: 40
               to: 95
               easing.type: Easing.InOutQuad;
           }
           PropertyAnimation {
               property: "speed"
               duration: 3000
               target: jsonBackEnd
               from: 95
               to: 125
               easing.type: Easing.InOutQuad;
           }
           PropertyAnimation {
               property: "speed"
               duration: 12000
               target: jsonBackEnd
               from: 125
               to: 0
               easing.type: Easing.InOutQuad;
           }
         }

    // adas
       SequentialAnimation {
           id: adasSimulation
           running: simulationRunning
           paused: false
           loops: Animation.Infinite
           PropertyAnimation {
               property: "adasRot"
               duration: 4000
               target: jsonBackEnd
               from: 180
               to: 0
               easing.type: Easing.InOutQuad;
           }
           PropertyAnimation {
               property: "adasRot"
               duration: 6000
               target: jsonBackEnd
               from: 0
               to: 360
               easing.type: Easing.InOutQuad;
           }
           PropertyAnimation {
               property: "adasRot"
               duration: 4000
               target: jsonBackEnd
               from: 360
               to: 180
               easing.type: Easing.InOutQuad;
            }
        }
}
