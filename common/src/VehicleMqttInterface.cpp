#include "VehicleMqttInterface.h"
#include <QFile>
#include <QFileInfo>
#include <QJsonDocument>
#include <QJsonObject>
#include <QDebug>

VehicleMqttInterface::VehicleMqttInterface(VehicleDataInterface* vehicleData, QObject *parent)
    : QObject(parent)
    , m_vehicleData(vehicleData)
    , m_mqttClient(new MqttClient(this))
{
    connect(m_mqttClient, &MqttClient::connectedChanged, this, &VehicleMqttInterface::onMqttConnected);
    connect(m_mqttClient, &MqttClient::messageReceived, this, &VehicleMqttInterface::onMqttMessageReceived);

    // Connect to VehicleData signals to publish changes
    connectVehicleDataSignals();
}

VehicleMqttInterface::~VehicleMqttInterface()
{
    disconnectFromMqtt();
}

bool VehicleMqttInterface::connectToMqtt(const QString& configPath)
{
    QFile configFile(configPath);
    if (!configFile.open(QIODevice::ReadOnly)) {
        qInfo() << "MQTT config not found:" << configPath;
        qInfo() << "MQTT connectivity disabled. App will function without sync.";
        return false;
    }

    QJsonDocument doc = QJsonDocument::fromJson(configFile.readAll());
    QJsonObject config = doc.object();

    QString endpoint = config["endpoint"].toString();
    int port = config["port"].toInt(8883);
    QString thingName = config["thingName"].toString();
    m_publishTopic = config["topics"].toObject()["publish"].toString();
    m_subscribeTopic = config["topics"].toObject()["subscribe"].toString();

    QString certPath = config["certificatePath"].toString();
    QString keyPath = config["privateKeyPath"].toString();
    QString caPath = config["rootCAPath"].toString();

    // Handle qrc:/ paths
    QString basePath;
    if (configPath.startsWith(":/") || configPath.startsWith("qrc:/")) {
        // Resource path - certificates should also be in resources
        basePath = ":/config/";
        // Extract just the filename from the cert paths
        certPath = QFileInfo(certPath).fileName();
        keyPath = QFileInfo(keyPath).fileName();
        caPath = QFileInfo(caPath).fileName();
    } else {
        // File system path - make paths relative to config file location
        QFileInfo configInfo(configPath);
        basePath = configInfo.absolutePath() + "/";
    }

    // Configure SSL
    if (!m_mqttClient->configureSsl(basePath + certPath, basePath + keyPath, basePath + caPath)) {
        qInfo() << "Failed to configure MQTT SSL - certificates may be missing";
        qInfo() << "MQTT connectivity disabled. App will function without sync.";
        return false;
    }

    // Set connection parameters
    m_mqttClient->setConnectionParameters(endpoint, port, thingName);

    qDebug() << "MQTT config loaded:" << endpoint << port << thingName;
    qDebug() << "Publish topic:" << m_publishTopic;
    qDebug() << "Subscribe topic:" << m_subscribeTopic;

    // Connect to broker
    m_mqttClient->connectToHost();

    return true;
}

void VehicleMqttInterface::disconnectFromMqtt()
{
    if (m_mqttClient->isConnected()) {
        m_mqttClient->disconnectFromHost();
        qDebug() << "Disconnected from MQTT broker";
    }
}

bool VehicleMqttInterface::isConnected() const
{
    return m_mqttClient->isConnected();
}

void VehicleMqttInterface::onMqttConnected()
{
    if (m_mqttClient->isConnected() && !m_subscribeTopic.isEmpty()) {
        m_mqttClient->subscribe(m_subscribeTopic);
        qDebug() << "Subscribed to MQTT topic:" << m_subscribeTopic;

        // Publish all current values on connection
        publishAllValues();
    }
}

void VehicleMqttInterface::onMqttMessageReceived(const QString &topic, const QByteArray &message)
{
    qDebug() << "VehicleMqttInterface received message:" << message;
    QJsonDocument doc = QJsonDocument::fromJson(message);
    if (!doc.isObject()) {
        qWarning() << "Received invalid JSON from MQTT topic:" << topic;
        return;
    }

    QJsonObject obj = doc.object();
    qDebug() << "Parsed JSON object:" << obj;
    updateVehicleDataFromJson(obj);
}

void VehicleMqttInterface::connectVehicleDataSignals()
{
    connect(m_vehicleData, &VehicleDataInterface::driveModeChanged, this, &VehicleMqttInterface::onDriveModeChanged);
    connect(m_vehicleData, &VehicleDataInterface::unitsChanged, this, &VehicleMqttInterface::onUnitsChanged);
    connect(m_vehicleData, &VehicleDataInterface::demoModeChanged, this, &VehicleMqttInterface::onDemoModeChanged);
    connect(m_vehicleData, &VehicleDataInterface::simulationRunningChanged, this, &VehicleMqttInterface::onSimulationRunningChanged);
    connect(m_vehicleData, &VehicleDataInterface::speedChanged, this, &VehicleMqttInterface::onSpeedChanged);
    connect(m_vehicleData, &VehicleDataInterface::fuelChanged, this, &VehicleMqttInterface::onFuelChanged);
    connect(m_vehicleData, &VehicleDataInterface::batteryChanged, this, &VehicleMqttInterface::onBatteryChanged);
    connect(m_vehicleData, &VehicleDataInterface::adasRotChanged, this, &VehicleMqttInterface::onAdasRotChanged);
    connect(m_vehicleData, &VehicleDataInterface::lightsChanged, this, &VehicleMqttInterface::onLightsChanged);
    connect(m_vehicleData, &VehicleDataInterface::adasChanged, this, &VehicleMqttInterface::onAdasChanged);
    connect(m_vehicleData, &VehicleDataInterface::doorDrvrChanged, this, &VehicleMqttInterface::onDoorDrvrChanged);
    connect(m_vehicleData, &VehicleDataInterface::doorPsgrChanged, this, &VehicleMqttInterface::onDoorPsgrChanged);
    connect(m_vehicleData, &VehicleDataInterface::gearChanged, this, &VehicleMqttInterface::onGearChanged);
    connect(m_vehicleData, &VehicleDataInterface::switchTurnLChanged, this, &VehicleMqttInterface::onSwitchTurnLChanged);
    connect(m_vehicleData, &VehicleDataInterface::switchTurnRChanged, this, &VehicleMqttInterface::onSwitchTurnRChanged);
    connect(m_vehicleData, &VehicleDataInterface::qsrIconsChanged, this, &VehicleMqttInterface::onQsrIconsChanged);
    connect(m_vehicleData, &VehicleDataInterface::themeChanged, this, &VehicleMqttInterface::onThemeChanged);
}

void VehicleMqttInterface::publishVehicleData(const QString &field, const QJsonValue &value)
{
    if (!m_mqttClient->isConnected() || m_publishTopic.isEmpty()) {
        return;
    }

    QJsonObject data;
    data[field] = value;

    QJsonDocument doc(data);
    m_mqttClient->publish(m_publishTopic, doc.toJson(QJsonDocument::Compact));
}

void VehicleMqttInterface::updateVehicleDataFromJson(const QJsonObject &data)
{
    qDebug() << "Updating VehicleData from JSON, keys:" << data.keys();

    // Temporarily disconnect signals to avoid echo
    disconnect(m_vehicleData, nullptr, this, nullptr);

    if (data.contains("driveMode")) {
        qDebug() << "Setting driveMode to:" << data["driveMode"].toString();
        m_vehicleData->setDriveMode(data["driveMode"].toString());
    }
    if (data.contains("units")) {
        m_vehicleData->setUnits(data["units"].toString());
    }
    if (data.contains("demoMode")) {
        m_vehicleData->setDemoMode(data["demoMode"].toString());
    }
    if (data.contains("simulationRunning")) {
        m_vehicleData->setSimulationRunning(data["simulationRunning"].toBool());
    }
    if (data.contains("speed")) {
        m_vehicleData->setSpeed(data["speed"].toInt());
    }
    if (data.contains("fuel")) {
        m_vehicleData->setFuel(data["fuel"].toInt());
    }
    if (data.contains("battery")) {
        m_vehicleData->setBattery(data["battery"].toInt());
    }
    if (data.contains("adasRot")) {
        m_vehicleData->setAdasRot(data["adasRot"].toInt());
    }
    if (data.contains("lights")) {
        m_vehicleData->setLights(data["lights"].toBool());
    }
    if (data.contains("adas")) {
        m_vehicleData->setAdas(data["adas"].toBool());
    }
    if (data.contains("doorDrvr")) {
        qDebug() << "Setting doorDrvr to:" << data["doorDrvr"].toBool();
        m_vehicleData->setDoorDrvr(data["doorDrvr"].toBool());
    }
    if (data.contains("doorPsgr")) {
        m_vehicleData->setDoorPsgr(data["doorPsgr"].toBool());
    }
    if (data.contains("gear")) {
        m_vehicleData->setGear(data["gear"].toBool());
    }
    if (data.contains("switchTurnL")) {
        m_vehicleData->setSwitchTurnL(data["switchTurnL"].toBool());
    }
    if (data.contains("switchTurnR")) {
        m_vehicleData->setSwitchTurnR(data["switchTurnR"].toBool());
    }
    if (data.contains("qsrIcons")) {
        m_vehicleData->setQsrIcons(data["qsrIcons"].toBool());
    }
    if (data.contains("theme")) {
        m_vehicleData->setTheme(data["theme"].toString());
    }

    // Reconnect signals
    connectVehicleDataSignals();
}

// Signal handlers that publish changes
void VehicleMqttInterface::onDriveModeChanged()
{
    publishVehicleData("driveMode", m_vehicleData->driveMode());
}

void VehicleMqttInterface::onUnitsChanged()
{
    publishVehicleData("units", m_vehicleData->units());
}

void VehicleMqttInterface::onDemoModeChanged()
{
    publishVehicleData("demoMode", m_vehicleData->demoMode());
}

void VehicleMqttInterface::onSimulationRunningChanged()
{
    publishVehicleData("simulationRunning", m_vehicleData->simulationRunning());
}

void VehicleMqttInterface::onSpeedChanged()
{
    publishVehicleData("speed", m_vehicleData->speed());
}

void VehicleMqttInterface::onFuelChanged()
{
    publishVehicleData("fuel", m_vehicleData->fuel());
}

void VehicleMqttInterface::onBatteryChanged()
{
    publishVehicleData("battery", m_vehicleData->battery());
}

void VehicleMqttInterface::onAdasRotChanged()
{
    publishVehicleData("adasRot", m_vehicleData->adasRot());
}

void VehicleMqttInterface::onLightsChanged()
{
    publishVehicleData("lights", m_vehicleData->lights());
}

void VehicleMqttInterface::onAdasChanged()
{
    publishVehicleData("adas", m_vehicleData->adas());
}

void VehicleMqttInterface::onDoorDrvrChanged()
{
    publishVehicleData("doorDrvr", m_vehicleData->doorDrvr());
}

void VehicleMqttInterface::onDoorPsgrChanged()
{
    publishVehicleData("doorPsgr", m_vehicleData->doorPsgr());
}

void VehicleMqttInterface::onGearChanged()
{
    publishVehicleData("gear", m_vehicleData->gear());
}

void VehicleMqttInterface::onSwitchTurnLChanged()
{
    publishVehicleData("switchTurnL", m_vehicleData->switchTurnL());
}

void VehicleMqttInterface::onSwitchTurnRChanged()
{
    publishVehicleData("switchTurnR", m_vehicleData->switchTurnR());
}

void VehicleMqttInterface::onQsrIconsChanged()
{
    publishVehicleData("qsrIcons", m_vehicleData->qsrIcons());
}

void VehicleMqttInterface::onThemeChanged()
{
    publishVehicleData("theme", m_vehicleData->theme());
}

void VehicleMqttInterface::publishAllValues()
{
    if (!m_mqttClient->isConnected()) {
        return;
    }

    qDebug() << "Publishing all VehicleData values to MQTT";

    // Publish all current vehicle data values
    publishVehicleData("driveMode", m_vehicleData->driveMode());
    publishVehicleData("units", m_vehicleData->units());
    publishVehicleData("demoMode", m_vehicleData->demoMode());
    publishVehicleData("simulationRunning", m_vehicleData->simulationRunning());
    publishVehicleData("speed", m_vehicleData->speed());
    publishVehicleData("fuel", m_vehicleData->fuel());
    publishVehicleData("battery", m_vehicleData->battery());
    publishVehicleData("adasRot", m_vehicleData->adasRot());
    publishVehicleData("lights", m_vehicleData->lights());
    publishVehicleData("adas", m_vehicleData->adas());
    publishVehicleData("doorDrvr", m_vehicleData->doorDrvr());
    publishVehicleData("doorPsgr", m_vehicleData->doorPsgr());
    publishVehicleData("gear", m_vehicleData->gear());
    publishVehicleData("switchTurnL", m_vehicleData->switchTurnL());
    publishVehicleData("switchTurnR", m_vehicleData->switchTurnR());
    publishVehicleData("qsrIcons", m_vehicleData->qsrIcons());
    publishVehicleData("theme", m_vehicleData->theme());
}
