// Copyright (C) 2024 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "autogen/environment.h"
#include "VehicleData.h"
#include "VehicleCanInterface.h"
#include "VehicleMqttInterface.h"

int main(int argc, char *argv[])
{
    set_qt_environment();
    QGuiApplication app(argc, argv);

    VehicleData* vehData = new VehicleData();
    VehicleCANInterface* vehCanInterface = new VehicleCANInterface(vehData);
    VehicleMqttInterface* vehMqttInterface = new VehicleMqttInterface(vehData);

    // Register interfaces under their own URI namespaces (VehicleData is already
    // registered via the static QML plugin from common/qml/VehicleData, so we expose
    // the C++ instance as a context property to avoid duplicate namespace registration)
    qmlRegisterSingletonInstance<VehicleCANInterface>("VehicleCANInterface", 1, 0, "VehicleCANInterface", vehCanInterface);
    qmlRegisterSingletonInstance<VehicleMqttInterface>("VehicleMqttInterface", 1, 0, "VehicleMqttInterface", vehMqttInterface);
    vehCanInterface->connectToCAN();

    // Attempt MQTT connection - app will work fine even if this fails
    if (vehMqttInterface->connectToMqtt(":/config/device1-config.json")) {
        qInfo() << "Cluster: MQTT connected successfully";
    } else {
        qInfo() << "Cluster: Running without MQTT sync";
    }

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("VehicleData", vehData);
    const QUrl url(mainQmlFile);
    QObject::connect(
                &engine, &QQmlApplicationEngine::objectCreated, &app,
                [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    engine.addImportPath(QCoreApplication::applicationDirPath() + "/qml");
    engine.addImportPath(":/");
    engine.load(url);

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
