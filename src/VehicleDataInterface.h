#ifndef VEHICLEDATAINTERFACE_H
#define VEHICLEDATAINTERFACE_H

#include <QObject>

/**
 * @brief The VehicleDataInterface class provides an interface for accessing and modifying vehicle data.
 *
 * This abstract class defines the interface for interacting with various aspects of a vehicle's
 * state, including drive mode, speed, fuel level, and various system statuses.
 */
class VehicleDataInterface : public QObject
{
    Q_OBJECT

public:
    /**
     * @brief Constructs a VehicleDataInterface object.
     * @param parent The parent QObject (default is nullptr).
     */
    explicit VehicleDataInterface(QObject *parent = nullptr) : QObject(parent) {}

    /**
     * @brief Virtual destructor to ensure proper cleanup of derived classes.
     */
    virtual ~VehicleDataInterface() = default;

    /**
     * @brief Enumeration of available drive modes.
     */
    // enum class DriveMode {
    //     Adas,
    //     Sport
    // };
    // Q_ENUM(DriveMode)

    /**
     * @brief Enumeration of available unit types.
     */
    // enum class UnitType {
    //     Metric,
    //     Imperial
    // };
    // Q_ENUM(UnitType)

    /**
     * @brief Get the current drive mode.
     * @return The current DriveMode.
     */
    virtual QString driveMode() const = 0;

    /**
     * @brief Set the drive mode.
     * @param driveMode The DriveMode to set.
     */
    virtual void setDriveMode(const QString &driveMode) = 0;

    /**
     * @brief Get the current unit type.
     * @return The current UnitType.
     */
    virtual QString units() const = 0;

    /**
     * @brief Set the unit type.
     * @param units The UnitType to set.
     */
    virtual void setUnits(const QString &units) = 0;

    /**
     * @brief Get the current demo mode.
     * @return The current demo mode as a QString.
     */
    virtual QString demoMode() const = 0;

    /**
     * @brief Set the demo mode.
     * @param demoMode The demo mode to set.
     */
    virtual void setDemoMode(const QString &demoMode) = 0;

    /**
     * @brief Check if the simulation is running.
     * @return true if the simulation is running, false otherwise.
     */
    virtual bool simulationRunning() const = 0;

    /**
     * @brief Set the simulation running state.
     * @param simulationRunning The simulation state to set.
     */
    virtual void setSimulationRunning(bool simulationRunning) = 0;

    /**
     * @brief Get the current speed.
     * @return The current speed as an integer.
     */
    virtual int speed() const = 0;

    /**
     * @brief Set the speed.
     * @param speed The speed to set.
     */
    virtual void setSpeed(int speed) = 0;

    /**
     * @brief Get the current fuel level.
     * @return The current fuel level as an integer.
     */
    virtual int fuel() const = 0;

    /**
     * @brief Set the fuel level.
     * @param fuel The fuel level to set.
     */
    virtual void setFuel(int fuel) = 0;

    /**
     * @brief Get the current battery level.
     * @return The current battery level as an integer.
     */
    virtual int battery() const = 0;

    /**
     * @brief Set the battery level.
     * @param battery The battery level to set.
     */
    virtual void setBattery(int battery) = 0;

    /**
     * @brief Get the current ADAS rotation.
     * @return The current ADAS rotation as an integer.
     */
    virtual int adasRot() const = 0;

    /**
     * @brief Set the ADAS rotation.
     * @param adasRot The ADAS rotation to set.
     */
    virtual void setAdasRot(int adasRot) = 0;

    /**
     * @brief Check if the lights are on.
     * @return true if the lights are on, false otherwise.
     */
    virtual bool lights() const = 0;

    /**
     * @brief Set the lights state.
     * @param lights The lights state to set.
     */
    virtual void setLights(bool lights) = 0;

    /**
     * @brief Check if ADAS is enabled.
     * @return true if ADAS is enabled, false otherwise.
     */
    virtual bool adas() const = 0;

    /**
     * @brief Set the ADAS state.
     * @param adas The ADAS state to set.
     */
    virtual void setAdas(bool adas) = 0;

    /**
     * @brief Check if the driver's door is open.
     * @return true if the driver's door is open, false otherwise.
     */
    virtual bool doorDrvr() const = 0;

    /**
     * @brief Set the driver's door state.
     * @param doorDrvr The driver's door state to set.
     */
    virtual void setDoorDrvr(bool doorDrvr) = 0;

    /**
     * @brief Check if the passenger's door is open.
     * @return true if the passenger's door is open, false otherwise.
     */
    virtual bool doorPsgr() const = 0;

    /**
     * @brief Set the passenger's door state.
     * @param doorPsgr The passenger's door state to set.
     */
    virtual void setDoorPsgr(bool doorPsgr) = 0;

    /**
     * @brief Check if the gear is engaged.
     * @return true if the gear is engaged, false otherwise.
     */
    virtual bool gear() const = 0;

    /**
     * @brief Set the vehicle in gear or not.
     * @param gear The state of the gearbox (true if in park, false otherwise)
     * @note This should be updated to be an enum value of PRDNL rather than a bool.
     */
    virtual void setGear(bool gear) = 0;

    /**
     * @brief Check if the left turn signal is on.
     * @return true if the left turn signal is on, false otherwise.
     */
    virtual bool switchTurnL() const = 0;

    /**
     * @brief Set the left turn signal state.
     * @param switchTurnL The left turn signal state to set.
     */
    virtual void setSwitchTurnL(bool switchTurnL) = 0;

    /**
     * @brief Check if the right turn signal is on.
     * @return true if the right turn signal is on, false otherwise.
     */
    virtual bool switchTurnR() const = 0;

    /**
     * @brief Set the right turn signal state.
     * @param switchTurnR The right turn signal state to set.
     */
    virtual void setSwitchTurnR(bool switchTurnR) = 0;

    /**
     * @brief Check if QSR icons should be displayed.
     * @return true if QSR icons should be displayed, false otherwise.
     */
    virtual bool qsrIcons() const = 0;

    /**
     * @brief Set the QSR icons state.
     * @param qsrIconsEnabled The QSR icon state to set.
     */
    virtual void setQsrIcons(bool qsrIconsEnabled) = 0;

signals:
    /**
     * @brief Signal emitted when the drive mode changes.
     */
    void driveModeChanged();

    /**
     * @brief Signal emitted when the unit type changes.
     */
    void unitsChanged();

    /**
     * @brief Signal emitted when the demo mode changes.
     */
    void demoModeChanged();

    /**
     * @brief Signal emitted when the simulation running state changes.
     */
    void simulationRunningChanged();

    /**
     * @brief Signal emitted when the speed changes.
     */
    void speedChanged();

    /**
     * @brief Signal emitted when the fuel level changes.
     */
    void fuelChanged();

    /**
     * @brief Signal emitted when the battery level changes.
     */
    void batteryChanged();

    /**
     * @brief Signal emitted when the ADAS rotation changes.
     */
    void adasRotChanged();

    /**
     * @brief Signal emitted when the lights state changes.
     */
    void lightsChanged();

    /**
     * @brief Signal emitted when the ADAS state changes.
     */
    void adasChanged();

    /**
     * @brief Signal emitted when the driver's door state changes.
     */
    void doorDrvrChanged();

    /**
     * @brief Signal emitted when the passenger's door state changes.
     */
    void doorPsgrChanged();

    /**
     * @brief Signal emitted when the gear state changes.
     */
    void gearChanged();

    /**
     * @brief Signal emitted when the left turn signal state changes.
     */
    void switchTurnLChanged();

    /**
     * @brief Signal emitted when the right turn signal state changes.
     */
    void switchTurnRChanged();

    /**
     * @brief Signal emitted when the QSR icons state changes.
     */
    void qsrIconsChanged();
};

#endif // VEHICLEDATAINTERFACE_H
