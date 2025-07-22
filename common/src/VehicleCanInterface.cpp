// VehicleCANInterface.cpp

#include "VehicleCanInterface.h"
#include <QDebug>

VehicleCANInterface::VehicleCANInterface(VehicleDataInterface* vehicleData, QObject *parent)
    : QObject(parent)
    , m_vehicleData(vehicleData)
    , m_canDevice(nullptr)
{
    qWarning() << "plugins: " << QCanBus::instance()->plugins();

    QString errorString;
    const QList<QCanBusDeviceInfo> devices = QCanBus::instance()->availableDevices(
        QStringLiteral("virtualcan"), &errorString);
    if (!errorString.isEmpty())
        qDebug() << errorString;

    if (errorString.isEmpty())
        qDebug() << "devices: " << &devices;
}

VehicleCANInterface::~VehicleCANInterface()
{
    disconnectFromCAN();
}

bool VehicleCANInterface::connectToCAN(const QString& interface, const QString& deviceName)
{
    if (m_canDevice) {
        qWarning() << "Already connected to CAN bus";
        return false;
    }

    QString errorString;
    m_canDevice = QCanBus::instance()->createDevice(interface, deviceName, &errorString);

    if (!m_canDevice) {
        qWarning() << "Error creating CAN device:" << errorString;
        return false;
    }

    if (!m_canDevice->connectDevice()) {
        qWarning() << "Error connecting to CAN device:" << m_canDevice->errorString();
        delete m_canDevice;
        m_canDevice = nullptr;
        return false;
    }

    connect(m_canDevice, &QCanBusDevice::framesReceived, this, &VehicleCANInterface::processCANFrames);

    qDebug() << "Connected to CAN bus";
    return true;
}

void VehicleCANInterface::disconnectFromCAN()
{
    if (m_canDevice) {
        m_canDevice->disconnectDevice();
        delete m_canDevice;
        m_canDevice = nullptr;
        qDebug() << "Disconnected from CAN bus";
    }
}

void VehicleCANInterface::processCANFrames()
{
    if (!m_canDevice) return;

    while (m_canDevice->framesAvailable()) {
        const QCanBusFrame frame = m_canDevice->readFrame();
        processFrame(frame);
    }
}

void VehicleCANInterface::processFrame(const QCanBusFrame frame)
{
    // Process CAN frames and update VehicleDataInterface
    //qDebug() << "processing: " << frameToString(frame);
    switch (frame.frameId()) {
    case 0x100: // Speed
        if (!frame.payload().isEmpty()) {
            quint8 speed = static_cast<quint8>(frame.payload().at(0));
            m_vehicleData->setSpeed(speed);
        }
        break;
    case 0x101: // Fuel level
        if (!frame.payload().isEmpty()) {
            uint fuel = frame.payload().at(0);
            m_vehicleData->setFuel(fuel);
            //
        }
        break;
    case 0x102: // Battery level
        if (!frame.payload().isEmpty()) {
            uint battery = frame.payload().at(0);
            m_vehicleData->setBattery(battery);
        }
        break;
    case 0x103: // Lights and turn signals
        if (!frame.payload().isEmpty()) {
            uint payload = frame.payload().at(0);
            bool lights = payload & 0x01;
            bool leftTurn = payload & 0x02;
            bool rightTurn = payload & 0x04;

            m_vehicleData->setLights(lights);
            m_vehicleData->setSwitchTurnL(leftTurn);
            m_vehicleData->setSwitchTurnR(rightTurn);
        }
        break;
    case 0x104: // Drive Mode
        if (!frame.payload().isEmpty()) {
            quint8 driveMode = static_cast<quint8>(frame.payload().at(0));
            QString driveModeStr = driveMode ? "ADAS" : "SPORT";
            qDebug() << "driveMode: " << driveMode << driveModeStr;
            m_vehicleData->setDriveMode(driveModeStr);
        }
        break;
    case 0x105: // Units
        if (!frame.payload().isEmpty()) {
            quint8 units = static_cast<quint8>(frame.payload().at(0));
            QString unitType = units ? "Metric" : "Imperial";
            qDebug() << "units: " << units << unitType;
            m_vehicleData->setUnits(unitType);
        }
        break;
    case 0x106: // ADAS Rotation
        if (!frame.payload().isEmpty()) {
            qint8 adasRot = static_cast<qint8>(frame.payload().at(0));
            m_vehicleData->setAdasRot(adasRot);
        }
        break;
    case 0x107: // ADAS, Doors, Gear, QSR Icons
        if (!frame.payload().isEmpty()) {
            quint8 payload = static_cast<quint8>(frame.payload().at(0));
            m_vehicleData->setAdas(payload & 0x01);
            m_vehicleData->setDoorDrvr(payload & 0x02);
            m_vehicleData->setDoorPsgr(payload & 0x04);
            m_vehicleData->setGear(payload & 0x08);
            m_vehicleData->setQsrIcons(payload & 0x10);
        }
        break;
    case 0x108: // Simulation status
        if (!frame.payload().isEmpty()) {
            quint8 simRunning = static_cast<quint8>(frame.payload().at(0));
            m_vehicleData->setSimulationRunning(simRunning != 0);
        }
        break;
    case 0x109: // Demo Mode
        if (frame.payload().size() >= 2) {
            QString demoMode = QString::fromUtf8(frame.payload());
            m_vehicleData->setDemoMode(demoMode);
        }
        break;
    default:
        qWarning() << "Unhandled: " << frameToString(frame);
        break;
    }
}

QString VehicleCANInterface::frameToString(const QCanBusFrame& frame)
{
    QString frameString;
    QTextStream stream(&frameString);

    // Frame ID
    stream << "ID: 0x" << QString::number(frame.frameId(), 16).toUpper().rightJustified(8, '0');

    // Frame type
    stream << " Type: ";
    switch (frame.frameType()) {
    case QCanBusFrame::DataFrame:
        stream << "Data";
        break;
    case QCanBusFrame::ErrorFrame:
        stream << "Error";
        break;
    case QCanBusFrame::RemoteRequestFrame:
        stream << "Remote Request";
        break;
    default:
        stream << "Unknown";
    }

    // Frame format
    stream << " Format: " << (frame.hasExtendedFrameFormat() ? "Extended" : "Standard");

    // Payload
    stream << " Payload: ";
    const QByteArray payload = frame.payload();
    for (int i = 0; i < payload.size(); ++i) {
        stream << QString::number(static_cast<uint8_t>(payload.at(i)), 16).toUpper().rightJustified(2, '0');
    }

    // // Timestamp
    // stream << " Timestamp: " << frame.timeStamp().seconds() << "s " << frame.timeStamp().microSeconds() << "µs";

    return frameString;
}
