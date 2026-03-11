#ifndef MQTTCLIENT_H
#define MQTTCLIENT_H

#include <QObject>
#include <QMqttClient>
#include <QSslConfiguration>

/**
 * @brief Generic MQTT client with SSL/TLS support
 *
 * This class handles MQTT connections with client certificate authentication.
 */
class MqttClient : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool connected READ isConnected NOTIFY connectedChanged)
    Q_PROPERTY(QString status READ status NOTIFY statusChanged)

public:
    explicit MqttClient(QObject *parent = nullptr);
    ~MqttClient();

    /**
     * @brief Configure SSL certificates
     * @param certPath Path to client certificate
     * @param keyPath Path to private key
     * @param caPath Path to CA certificate
     * @return true if certificates loaded successfully
     */
    bool configureSsl(const QString &certPath, const QString &keyPath, const QString &caPath);

    /**
     * @brief Set connection parameters
     * @param hostname MQTT broker hostname
     * @param port MQTT broker port (default 8883 for SSL)
     * @param clientId Client ID for MQTT connection
     */
    void setConnectionParameters(const QString &hostname, quint16 port, const QString &clientId);

    /**
     * @brief Connect to MQTT broker
     */
    void connectToHost();

    /**
     * @brief Disconnect from MQTT broker
     */
    void disconnectFromHost();

    /**
     * @brief Check if connected
     */
    bool isConnected() const;

    /**
     * @brief Get connection status
     */
    QString status() const;

    /**
     * @brief Publish a message to a topic
     * @param topic MQTT topic to publish to
     * @param message Message payload
     * @param qos Quality of Service level (default 1)
     */
    void publish(const QString &topic, const QByteArray &message, quint8 qos = 1);

    /**
     * @brief Subscribe to a topic
     * @param topic MQTT topic to subscribe to
     * @param qos Quality of Service level (default 1)
     */
    void subscribe(const QString &topic, quint8 qos = 1);

signals:
    void connectedChanged();
    void statusChanged(const QString &status);
    void messageReceived(const QString &topic, const QByteArray &message);
    void errorOccurred(const QString &error);

private slots:
    void onConnected();
    void onDisconnected();
    void onErrorChanged(QMqttClient::ClientError error);
    void onMessageReceived(const QByteArray &message, const QMqttTopicName &topic);

private:
    void setStatus(const QString &status);

    QMqttClient *m_client;
    QString m_status;
    bool m_sslConfigured;
    QSslConfiguration m_sslConfig;
};

#endif // MQTTCLIENT_H
