#ifndef VEHICLEMQTTINTERFACE_H
#define VEHICLEMQTTINTERFACE_H

#include <QObject>
#include "VehicleDataInterface.h"
#include "MqttClient.h"

/**
 * @brief MQTT interface for syncing VehicleData between devices
 *
 * This class follows the same pattern as VehicleCANInterface, wrapping a
 * VehicleDataInterface and syncing changes via MQTT.
 */
class VehicleMqttInterface : public QObject
{
    Q_OBJECT

public:
    explicit VehicleMqttInterface(VehicleDataInterface* vehicleData, QObject *parent = nullptr);
    ~VehicleMqttInterface();

    /**
     * @brief Load MQTT configuration and connect to broker
     * @param configPath Path to device config JSON file
     * @return true if successfully connected
     */
    bool connectToMqtt(const QString& configPath);

    /**
     * @brief Disconnect from MQTT broker
     */
    void disconnectFromMqtt();

    /**
     * @brief Check if connected to MQTT
     */
    bool isConnected() const;

    /**
     * @brief Publish all current VehicleData values
     */
    void publishAllValues();

private slots:
    void onMqttConnected();
    void onMqttMessageReceived(const QString &topic, const QByteArray &message);

    // Listen to VehicleData changes and publish
    void onDriveModeChanged();
    void onUnitsChanged();
    void onDemoModeChanged();
    void onSimulationRunningChanged();
    void onSpeedChanged();
    void onFuelChanged();
    void onBatteryChanged();
    void onAdasRotChanged();
    void onLightsChanged();
    void onAdasChanged();
    void onDoorDrvrChanged();
    void onDoorPsgrChanged();
    void onGearChanged();
    void onSwitchTurnLChanged();
    void onSwitchTurnRChanged();
    void onQsrIconsChanged();
    void onThemeChanged();

private:
    void connectVehicleDataSignals();
    void publishVehicleData(const QString &field, const QJsonValue &value);
    void updateVehicleDataFromJson(const QJsonObject &data);

    VehicleDataInterface* m_vehicleData;
    MqttClient* m_mqttClient;
    QString m_publishTopic;
    QString m_subscribeTopic;
};

#endif // VEHICLEMQTTINTERFACE_H
