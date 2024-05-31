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

    property WebSocket wsClient: WebSocket
    {
        id: webSocketClient
        url: "ws://127.0.0.1:8080"
        onTextMessageReceived: function(message) {
            console.log(qsTr("IVI Client received theme message: %1").arg(message));
        }

        onStatusChanged: {
            console.log("IVI WebSocket Status: " + webSocketClient.status + " " + url)
            if(webSocketClient.status == WebSocket.Open)
            {
                webSocketClient.sendTextMessage("theme:" + currentTheme)
                webSocketClient.sendTextMessage("doorRight:" + doorR)
                webSocketClient.sendTextMessage("doorLeft:" + doorL)
                webSocketClient.sendTextMessage("adasEnabled:" + adasEnabled)
                webSocketClient.sendTextMessage("lamps:" + lamps)
            }
        }

        property Timer timer: Timer {
            interval: 100
            running: webSocketClient.status != WebSocket.Open
            onTriggered: {
                webSocketClient.active = true;
            }
        }
    }
}



