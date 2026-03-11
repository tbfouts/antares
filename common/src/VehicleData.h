#ifndef VEHICLEDATA_H
#define VEHICLEDATA_H

#include "VehicleDataInterface.h"

class VehicleData : public VehicleDataInterface
{
    Q_OBJECT

    Q_PROPERTY(QString driveMode READ driveMode WRITE setDriveMode NOTIFY driveModeChanged)
    Q_PROPERTY(QString units READ units WRITE setUnits NOTIFY unitsChanged)
    Q_PROPERTY(QString demoMode READ demoMode WRITE setDemoMode NOTIFY demoModeChanged)
    Q_PROPERTY(bool simulationRunning READ simulationRunning WRITE setSimulationRunning NOTIFY simulationRunningChanged)
    Q_PROPERTY(int speed READ speed WRITE setSpeed NOTIFY speedChanged)
    Q_PROPERTY(int fuel READ fuel WRITE setFuel NOTIFY fuelChanged)
    Q_PROPERTY(int battery READ battery WRITE setBattery NOTIFY batteryChanged)
    Q_PROPERTY(int adasRot READ adasRot WRITE setAdasRot NOTIFY adasRotChanged)
    Q_PROPERTY(bool lights READ lights WRITE setLights NOTIFY lightsChanged)
    Q_PROPERTY(bool adas READ adas WRITE setAdas NOTIFY adasChanged)
    Q_PROPERTY(bool doorDrvr READ doorDrvr WRITE setDoorDrvr NOTIFY doorDrvrChanged)
    Q_PROPERTY(bool doorPsgr READ doorPsgr WRITE setDoorPsgr NOTIFY doorPsgrChanged)
    Q_PROPERTY(bool gear READ gear WRITE setGear NOTIFY gearChanged)
    Q_PROPERTY(bool switchTurnL READ switchTurnL WRITE setSwitchTurnL NOTIFY switchTurnLChanged)
    Q_PROPERTY(bool switchTurnR READ switchTurnR WRITE setSwitchTurnR NOTIFY switchTurnRChanged)
    Q_PROPERTY(bool qsrIcons READ qsrIcons WRITE setQsrIcons NOTIFY qsrIconsChanged)
    Q_PROPERTY(QString theme READ theme WRITE setTheme NOTIFY themeChanged)

public:
    explicit VehicleData(QObject *parent = nullptr);

    QString driveMode() const override;
    void setDriveMode(const QString &driveMode) override;

    QString units() const override;
    void setUnits(const QString &units) override;

    QString demoMode() const override;
    void setDemoMode(const QString &demoMode) override;

    bool simulationRunning() const override;
    void setSimulationRunning(bool simulationRunning) override;

    int speed() const override;
    void setSpeed(int speed) override;

    int fuel() const override;
    void setFuel(int fuel) override;

    int battery() const override;
    void setBattery(int battery) override;

    int adasRot() const override;
    void setAdasRot(int adasRot) override;

    bool lights() const override;
    void setLights(bool lights) override;

    bool adas() const override;
    void setAdas(bool adas) override;

    bool doorDrvr() const override;
    void setDoorDrvr(bool doorDrvr) override;

    bool doorPsgr() const override;
    void setDoorPsgr(bool doorPsgr) override;

    bool gear() const override;
    void setGear(bool gear) override;

    bool switchTurnL() const override;
    void setSwitchTurnL(bool switchTurnL) override;

    bool switchTurnR() const override;
    void setSwitchTurnR(bool switchTurnR) override;

    bool qsrIcons() const override;
    void setQsrIcons(bool qsrIconsEnabled) override;

    QString theme() const override;
    void setTheme(const QString &theme) override;

private:
    QString m_driveMode;
    QString m_units;
    QString m_demoMode;
    bool m_simulationRunning;
    int m_speed;
    int m_fuel;
    bool m_gear;
    int m_battery;
    int m_adasRot;
    bool m_lights;
    bool m_adas;
    bool m_doorDrvr;
    bool m_doorPsgr;
    bool m_switchTurnL;
    bool m_switchTurnR;
    bool m_qsricons;
    QString m_theme;
};

#endif // VEHICLEDATA_H
