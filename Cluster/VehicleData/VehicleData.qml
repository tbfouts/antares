pragma Singleton
import QtQuick

// This file is a mock file to satisfy the interface requirements of Design Studio
// This file is not used in a compiled application scenario

Item {
    id: root

    property string units: "Imperial"
    property string driveMode: "SPORT"
    property string demoMode: "manual"
    property bool simulationRunning: false
    property int speed: 0
    property int fuel: 0
    property int battery: 0
    property int adasRot: 0
    property bool lights: false
    property bool adas: false
    property bool doorDrvr: false
    property bool doorPsgr: false
    property bool gear: false
    property bool switchTurnL: false
    property bool switchTurnR: false
    property bool qsrIcons: false
    property bool adasOFF: true
    property bool adasON: false
}
