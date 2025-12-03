pragma Singleton
import QtQuick

/**
 * @brief VehicleData QML Singleton
 *
 * This file is a mock file to satisfy the interface requirements of Design Studio.
 * This file is not used in a compiled application scenario.
 *
 * In production, this singleton is replaced by the C++ VehicleData class which provides
 * real-time vehicle data from the vehicle's systems.
 *
 * @note All properties mirror the C++ VehicleData class interface
 * @see VehicleData.h for the C++ implementation
 */
Item {
    id: root

    /**
     * @brief Measurement units for vehicle data display
     * @type {string}
     * @default "Imperial"
     * @values "Imperial", "Metric"
     */
    property string units: "Imperial"

    /**
     * @brief Current drive mode of the vehicle
     * @type {string}
     * @default "SPORT"
     * @values "SPORT", "ECO", "COMFORT", "ADAS", etc.
     */
    property string driveMode: "SPORT"

    /**
     * @brief Demo mode control for simulation scenarios
     * @type {string}
     * @default "manual"
     * @values "manual", "auto", etc.
     */
    property string demoMode: "manual"

    /**
     * @brief Indicates if simulation is currently running
     * @type {bool}
     * @default false
     */
    property bool simulationRunning: false

    /**
     * @brief Current vehicle speed
     * @type {int}
     * @default 0
     * @note Units depend on the 'units' property (mph for Imperial, km/h for Metric)
     * @emits speedChanged, gearChanged, qsrIconsChanged when modified via setter
     */
    property int speed: 0

    /**
     * @brief Current fuel level percentage
     * @type {int}
     * @default 100
     * @range 0-100
     */
    property int fuel: 100

    /**
     * @brief Current battery level percentage
     * @type {int}
     * @default 100
     * @range 0-100
     */
    property int battery: 100

    /**
     * @brief ADAS (Advanced Driver Assistance Systems) rotation angle
     * @type {int}
     * @default 0
     * @note Used for rotating ADAS display elements
     */
    property int adasRot: 0

    /**
     * @brief Lights status
     * @type {bool}
     * @default false
     * @note true when headlights are on
     */
    property bool lights: false

    /**
     * @brief ADAS system enabled status
     * @type {bool}
     * @default false
     * @note true when ADAS features are active
     */
    property bool adas: "ADAS" === driveMode

    /**
     * @brief Driver door status
     * @type {bool}
     * @default false
     * @note true when driver door is open
     */
    property bool doorDrvr: false

    /**
     * @brief Passenger door status
     * @type {bool}
     * @default false
     * @note true when passenger door is open
     */
    property bool doorPsgr: false

    /**
     * @brief Gear status
     * @type {bool}
     * @default false
     * @note Initial value is true in C++ implementation
     */
    property bool gear: false

    /**
     * @brief Left turn signal status
     * @type {bool}
     * @default false
     * @note true when left turn signal is active
     */
    property bool switchTurnL: false

    /**
     * @brief Right turn signal status
     * @type {bool}
     * @default false
     * @note true when right turn signal is active
     */
    property bool switchTurnR: false

    /**
     * @brief QSR (Quick Status Report) icons enabled status
     * @type {bool}
     * @default false
     * @note Controls visibility of quick status icons in the UI
     */
    property bool qsrIcons: false
}
