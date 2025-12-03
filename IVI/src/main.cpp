// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "app_environment.h"
#include "import_qml_components_plugins.h"
#include "import_qml_plugins.h"
#include "VehicleData.h"
//#include "VehicleCanInterface.h"
#include "VehicleMqttInterface.h"

int main(int argc, char *argv[])
{
    set_qt_environment();

    QGuiApplication app(argc, argv);

    VehicleData* vehData = new VehicleData();
    //VehicleCANInterface* vehCanInterface = new VehicleCANInterface(vehData);
    VehicleMqttInterface* vehMqttInterface = new VehicleMqttInterface(vehData);

    //qmlRegisterSingletonInstance<VehicleCANInterface>("VehicleCANInterface", 1, 0, "VehicleCANInterface", vehCanInterface);
    qmlRegisterSingletonInstance<VehicleData>("VehicleData", 1, 0, "VehicleData", vehData);
    qmlRegisterSingletonInstance<VehicleMqttInterface>("VehicleMqttInterface", 1, 0, "VehicleMqttInterface", vehMqttInterface);
    //vehCanInterface->connectToCAN();

    // Attempt MQTT connection - app will work fine even if this fails
    if (vehMqttInterface->connectToMqtt(":/config/device2-config.json")) {
        qInfo() << "IVI: MQTT connected successfully";
    } else {
        qInfo() << "IVI: Running without MQTT sync";
    }

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/qt/qml/Main/main.qml"_qs);
    QObject::connect(
                &engine, &QQmlApplicationEngine::objectCreated, &app,
                [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    },
    Qt::QueuedConnection);

    engine.addImportPath(QCoreApplication::applicationDirPath() + "/qml");
    engine.addImportPath(":/");

    engine.load(url);

    if (engine.rootObjects().isEmpty()) {
        return -1;
    }

    return app.exec();
}
