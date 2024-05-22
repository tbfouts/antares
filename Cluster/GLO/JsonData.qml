pragma Singleton

import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Studio.Utils 1.0

JsonBackend {
    source: Qt.resolvedUrl("data.json")

    property string driveMode: "SPORT"

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
}
