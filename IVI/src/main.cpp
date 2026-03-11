// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <memory>

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

    auto vehData = std::make_unique<VehicleData>();
    //VehicleCANInterface* vehCanInterface = new VehicleCANInterface(vehData);
    auto vehMqttInterface = std::make_unique<VehicleMqttInterface>(vehData.get());

    //qmlRegisterSingletonInstance<VehicleCANInterface>("VehicleCANInterface", 1, 0, "VehicleCANInterface", vehCanInterface);
    auto* vehDataPtr = vehData.release();
    auto* vehMqttPtr = vehMqttInterface.release();
    qmlRegisterSingletonInstance<VehicleData>("VehicleData", 1, 0, "VehicleData", vehDataPtr);
    qmlRegisterSingletonInstance<VehicleMqttInterface>("VehicleMqttInterface", 1, 0, "VehicleMqttInterface", vehMqttPtr);
    //vehCanInterface->connectToCAN();

    // Attempt MQTT connection - app will work fine even if this fails
    if (vehMqttPtr->connectToMqtt(":/config/device2-config.json")) {
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
