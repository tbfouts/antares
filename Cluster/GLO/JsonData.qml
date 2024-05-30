pragma Singleton

import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Studio.Utils 1.0
import QtWebSockets
import GLO 1.0

JsonBackend {
    id: jsonBackEnd
    source: Qt.resolvedUrl("data.json")

    property string driveMode: adas ? "ADAS" : "SPORT"

    property int speed: 20
    property int fuel: 100
    property int battery: 100
    property int adasRot: 0

    property bool lights: false
    property bool adas: false
    property bool doorDrvr: false
    property bool doorPsgr: false
    property bool gear: false
    property bool switchTurnL: false
    property bool switchTurnR: false
    property bool qsrIcons: false

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
                default:
                    console.log("message went unhandled")
                }

            });
        }
        onErrorStringChanged: {
            console.log(qsTr("Server error: %1").arg(errorString));
        }
    }
}
