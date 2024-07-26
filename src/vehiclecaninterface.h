#ifndef VEHICLECANINTERFACE_H
#define VEHICLECANINTERFACE_H

#include <QObject>
#include <QtSerialBus/QCanBus>
#include <QtSerialBus/QCanBusDevice>
#include <QtSerialBus/QCanBusFrame>
#include "VehicleDataInterface.h"

class VehicleCANInterface : public QObject
{
    Q_OBJECT

public:
    explicit VehicleCANInterface(VehicleDataInterface* vehicleData, QObject *parent = nullptr);
    ~VehicleCANInterface();

    bool connectToCAN(const QString& interface = "virtualcan", const QString& deviceName = "can0");
    void disconnectFromCAN();

private slots:
    void processCANFrames();

private:
    void processFrame(const QCanBusFrame& frame);

    VehicleDataInterface* m_vehicleData;
    QCanBusDevice* m_canDevice;
    QString frameToString(const QCanBusFrame &frame);
};

#endif // VEHICLECANINTERFACE_H
