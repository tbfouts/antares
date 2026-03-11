#include "MqttClient.h"
#include <QSslCertificate>
#include <QSslKey>
#include <QSslSocket>
#include <QFile>
#include <QDebug>

MqttClient::MqttClient(QObject *parent)
    : QObject(parent)
    , m_client(new QMqttClient(this))
    , m_status("Disconnected")
    , m_sslConfigured(false)
{
    connect(m_client, &QMqttClient::connected, this, &MqttClient::onConnected);
    connect(m_client, &QMqttClient::disconnected, this, &MqttClient::onDisconnected);
    connect(m_client, &QMqttClient::errorChanged, this, &MqttClient::onErrorChanged);
    connect(m_client, &QMqttClient::messageReceived, this, &MqttClient::onMessageReceived);
    connect(m_client, &QMqttClient::stateChanged, this, [this](QMqttClient::ClientState state) {
        qDebug() << "MQTT State changed:" << state;
    });

    m_client->setProtocolVersion(QMqttClient::MQTT_3_1_1);
    m_client->setCleanSession(true);
}

MqttClient::~MqttClient()
{
    if (m_client->state() == QMqttClient::Connected) {
        m_client->disconnectFromHost();
    }
}

bool MqttClient::configureSsl(const QString &certPath, const QString &keyPath, const QString &caPath)
{
    QFile certFile(certPath);
    if (!certFile.open(QIODevice::ReadOnly)) {
        setStatus("Error: Cannot open certificate file");
        emit errorOccurred("Cannot open certificate file: " + certPath);
        return false;
    }
    QSslCertificate certificate(&certFile, QSsl::Pem);
    certFile.close();

    if (certificate.isNull()) {
        setStatus("Error: Invalid certificate");
        emit errorOccurred("Invalid certificate: " + certPath);
        return false;
    }

    QFile keyFile(keyPath);
    if (!keyFile.open(QIODevice::ReadOnly)) {
        setStatus("Error: Cannot open private key file");
        emit errorOccurred("Cannot open private key file: " + keyPath);
        return false;
    }
    QSslKey privateKey(&keyFile, QSsl::Rsa, QSsl::Pem, QSsl::PrivateKey);
    keyFile.close();

    if (privateKey.isNull()) {
        setStatus("Error: Invalid private key");
        emit errorOccurred("Invalid private key: " + keyPath);
        return false;
    }

    QFile caFile(caPath);
    if (!caFile.open(QIODevice::ReadOnly)) {
        setStatus("Error: Cannot open CA file");
        emit errorOccurred("Cannot open CA file: " + caPath);
        return false;
    }
    QSslCertificate caCertificate(&caFile, QSsl::Pem);
    caFile.close();

    if (caCertificate.isNull()) {
        setStatus("Error: Invalid CA certificate");
        emit errorOccurred("Invalid CA certificate: " + caPath);
        return false;
    }

    m_sslConfig = QSslConfiguration::defaultConfiguration();
    m_sslConfig.setLocalCertificate(certificate);
    m_sslConfig.setPrivateKey(privateKey);
    m_sslConfig.setCaCertificates({caCertificate});
    m_sslConfig.setProtocol(QSsl::TlsV1_2OrLater);
    m_sslConfig.setPeerVerifyMode(QSslSocket::VerifyPeer);

    m_sslConfigured = true;
    setStatus("SSL configured");
    return true;
}

void MqttClient::setConnectionParameters(const QString &hostname, quint16 port, const QString &clientId)
{
    m_client->setHostname(hostname);
    m_client->setPort(port);
    m_client->setClientId(clientId);
}

void MqttClient::connectToHost()
{
    if (!m_sslConfigured) {
        setStatus("Error: SSL not configured");
        emit errorOccurred("SSL not configured. Call configureSsl() first.");
        return;
    }

    if (m_client->hostname().isEmpty()) {
        setStatus("Error: No hostname set");
        emit errorOccurred("No hostname set. Call setConnectionParameters() first.");
        return;
    }

    setStatus("Connecting...");
    qDebug() << "Connecting to MQTT broker:" << m_client->hostname() << ":" << m_client->port();
    qDebug() << "Client ID:" << m_client->clientId();
    qDebug() << "Protocol version:" << m_client->protocolVersion();
    m_client->connectToHostEncrypted(m_sslConfig);
}

void MqttClient::disconnectFromHost()
{
    m_client->disconnectFromHost();
}

bool MqttClient::isConnected() const
{
    return m_client->state() == QMqttClient::Connected;
}

QString MqttClient::status() const
{
    return m_status;
}

void MqttClient::publish(const QString &topic, const QByteArray &message, quint8 qos)
{
    if (!isConnected()) {
        emit errorOccurred("Not connected to MQTT broker");
        return;
    }

    qDebug() << "Publishing to" << topic << ":" << message;
    m_client->publish(topic, message, qos);
}

void MqttClient::subscribe(const QString &topic, quint8 qos)
{
    if (!isConnected()) {
        emit errorOccurred("Not connected to MQTT broker");
        return;
    }

    qDebug() << "Subscribing to" << topic;
    auto subscription = m_client->subscribe(topic, qos);
    if (!subscription) {
        emit errorOccurred("Failed to subscribe to topic: " + topic);
    }
}

void MqttClient::onConnected()
{
    setStatus("Connected");
    qDebug() << "*** MQTT Connected to broker ***";
    emit connectedChanged();
}

void MqttClient::onDisconnected()
{
    setStatus("Disconnected");
    qDebug() << "Disconnected from MQTT broker";
    emit connectedChanged();
}

void MqttClient::onErrorChanged(QMqttClient::ClientError error)
{
    QString errorString;
    switch (error) {
    case QMqttClient::NoError:
        errorString = "No error";
        break;
    case QMqttClient::InvalidProtocolVersion:
        errorString = "Invalid protocol version";
        break;
    case QMqttClient::IdRejected:
        errorString = "ID rejected";
        break;
    case QMqttClient::ServerUnavailable:
        errorString = "Server unavailable";
        break;
    case QMqttClient::BadUsernameOrPassword:
        errorString = "Bad username or password";
        break;
    case QMqttClient::NotAuthorized:
        errorString = "Not authorized";
        break;
    case QMqttClient::TransportInvalid:
        errorString = "Transport invalid";
        break;
    case QMqttClient::ProtocolViolation:
        errorString = "Protocol violation";
        break;
    case QMqttClient::UnknownError:
    default:
        errorString = "Unknown error";
        break;
    }
    qDebug() << "MQTT Error:" << errorString;
    setStatus("Error: " + errorString);
    emit errorOccurred(errorString);
}

void MqttClient::onMessageReceived(const QByteArray &message, const QMqttTopicName &topic)
{
    QString topicStr = topic.name();
    qDebug() << "Message received on" << topicStr << ":" << message;
    emit messageReceived(topicStr, message);
}

void MqttClient::setStatus(const QString &status)
{
    if (m_status != status) {
        m_status = status;
        emit statusChanged(m_status);
    }
}
