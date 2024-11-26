pragma Singleton
import QtQuick 2.12
import QtWebSockets
import Data 1.0 as Data

Item {
    id: values

    property bool doorL: false
    property bool doorR: false
    property bool lamps: true
    property bool adasEnabled: false
    property string currentTheme: "luna"

    onDoorLChanged: webSocketClient.sendTextMessage("doorLeft:" + doorL)
    onDoorRChanged: webSocketClient.sendTextMessage("doorRight:" + doorR)
    onLampsChanged: webSocketClient.sendTextMessage("lamps:" + lamps)
    onCurrentThemeChanged: webSocketClient.sendTextMessage("theme:" + currentTheme)
    onAdasEnabledChanged: webSocketClient.sendTextMessage("adasEnabled:" + adasEnabled)

    Component.onCompleted: {
        connectSocket()
    }

    function connectSocket() {
        webSocketClient.active = true
    }

    property WebSocket wsClient: WebSocket
    {
        id: webSocketClient
        url: "ws://127.0.0.1:8080"
        onTextMessageReceived: function(message) {
            console.log(qsTr("IVI Client received theme message: %1").arg(message));
        }

        onStatusChanged: {
            if (webSocketClient.status === WebSocket.Error) {
                console.log("IVI WS Error: " + webSocketClient.errorString)
                reconnectionTimer.start()
            } else if (webSocketClient.status === WebSocket.Open) {
                console.log("IVI WS Connection established")
                webSocketClient.sendTextMessage("theme:" + currentTheme)
                webSocketClient.sendTextMessage("doorRight:" + doorR)
                webSocketClient.sendTextMessage("doorLeft:" + doorL)
                webSocketClient.sendTextMessage("adasEnabled:" + adasEnabled)
                webSocketClient.sendTextMessage("lamps:" + lamps)
                reconnectionTimer.stop()
            } else if (webSocketClient.status === WebSocket.Closed) {
                reconnectionTimer.start()
            }
        }

        property Timer timer: Timer {
            id: reconnectionTimer
            interval: 5000 // 5 seconds
            repeat: false
            onTriggered: {
                console.log("Attempting to reconnect...")
                webSocketClient.active = false
                webSocketClient.active = true
            }
        }
    }
}



