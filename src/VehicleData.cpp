#include "VehicleData.h"
#include <QDebug>

VehicleData::VehicleData(QObject *parent)
    : VehicleDataInterface(parent)
    , m_driveMode(DriveMode::Sport)
    , m_units(UnitType::Imperial)
    , m_demoMode("manual")
    , m_simulationRunning(false)
    , m_speed(0)
    , m_fuel(100)
    , m_gear(true)
    , m_battery(100)
    , m_adasRot(0)
    , m_lights(true)
    , m_adas(false)
    , m_doorDrvr(false)
    , m_doorPsgr(false)
    , m_switchTurnL(false)
    , m_switchTurnR(false)
    , m_qsricons(false)
{
}

VehicleDataInterface::DriveMode VehicleData::driveMode() const
{
    return m_driveMode;
}

void VehicleData::setDriveMode(VehicleDataInterface::DriveMode driveMode)
{
    if (m_driveMode != driveMode) {
        m_driveMode = driveMode;
        emit driveModeChanged();
    }
}

VehicleDataInterface::UnitType VehicleData::units() const
{
    return m_units;
}

void VehicleData::setUnits(VehicleDataInterface::UnitType units)
{
    if (m_units != units) {
        m_units = units;
        emit unitsChanged();
    }
}

QString VehicleData::demoMode() const
{
    return m_demoMode;
}

void VehicleData::setDemoMode(const QString &demoMode)
{
    if (m_demoMode != demoMode) {
        m_demoMode = demoMode;
        emit demoModeChanged();
    }
}

bool VehicleData::simulationRunning() const
{
    return m_simulationRunning;
}

void VehicleData::setSimulationRunning(bool simulationRunning)
{
    if (m_simulationRunning != simulationRunning) {
        m_simulationRunning = simulationRunning;
        emit simulationRunningChanged();
    }
}

int VehicleData::speed() const
{
    return m_speed;
}

void VehicleData::setSpeed(int speed)
{
    if (m_speed != speed) {
        m_speed = speed;
        emit speedChanged();
        emit gearChanged();
        emit qsrIconsChanged();
    }
}

int VehicleData::fuel() const
{
    return m_fuel;
}

void VehicleData::setFuel(int fuel)
{
    if (m_fuel != fuel) {
        m_fuel = fuel;
        emit fuelChanged();
    }
}

int VehicleData::battery() const
{
    return m_battery;
}

void VehicleData::setBattery(int battery)
{
    if (m_battery != battery) {
        m_battery = battery;
        emit batteryChanged();
    }
}

int VehicleData::adasRot() const
{
    return m_adasRot;
}

void VehicleData::setAdasRot(int adasRot)
{
    if (m_adasRot != adasRot) {
        m_adasRot = adasRot;
        emit adasRotChanged();
    }
}

bool VehicleData::lights() const
{
    return m_lights;
}

void VehicleData::setLights(bool lights)
{
    if (m_lights != lights) {
        m_lights = lights;
        emit lightsChanged();
    }
}

bool VehicleData::adas() const
{
    return m_adas;
}

void VehicleData::setAdas(bool adas)
{
    if (m_adas != adas) {
        m_adas = adas;
        emit adasChanged();
    }
}

bool VehicleData::doorDrvr() const
{
    return m_doorDrvr;
}

void VehicleData::setDoorDrvr(bool doorDrvr)
{
    if (m_doorDrvr != doorDrvr) {
        m_doorDrvr = doorDrvr;
        emit doorDrvrChanged();
    }
}

bool VehicleData::doorPsgr() const
{
    return m_doorPsgr;
}

void VehicleData::setDoorPsgr(bool doorPsgr)
{
    if (m_doorPsgr != doorPsgr) {
        m_doorPsgr = doorPsgr;
        emit doorPsgrChanged();
    }
}

bool VehicleData::gear() const
{
    return m_speed == 0;
}

void VehicleData::setGear(bool gear)
{
    if(m_gear != gear)
    {
        m_gear = gear;
        emit gearChanged();
    }
}

bool VehicleData::switchTurnL() const
{
    return m_switchTurnL;
}

void VehicleData::setSwitchTurnL(bool switchTurnL)
{
    if (m_switchTurnL != switchTurnL) {
        m_switchTurnL = switchTurnL;
        emit switchTurnLChanged();
    }
}

bool VehicleData::switchTurnR() const
{
    return m_switchTurnR;
}

void VehicleData::setSwitchTurnR(bool switchTurnR)
{
    if (m_switchTurnR != switchTurnR) {
        m_switchTurnR = switchTurnR;
        emit switchTurnRChanged();
    }
}

bool VehicleData::qsrIcons() const
{
    return gear();
}

void VehicleData::setQsrIcons(bool qsrIconsEnabled)
{
    if(m_qsricons != qsrIconsEnabled)
    {
        qDebug() << "setting qsricons: " << qsrIconsEnabled;
        m_qsricons = qsrIconsEnabled;
        emit qsrIconsChanged();
    }
}
