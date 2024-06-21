// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.7
import GLO

Window {
    width: mainScreen.width
    height: mainScreen.height

    visibility: Qt.platform.os === 'android' ? Window.FullScreen : Window.AutomaticVisibility

    visible: true
    title: "GLO"

    Rectangle
    {
        id: bg
        anchors.fill: parent
        color: "black"

        Screen01 {
            id: mainScreen
            anchors.centerIn: parent

            transform: Scale {
                origin.x: mainScreen.width / 2
                origin.y: mainScreen.height / 2
                readonly property real xRatio: bg.width / mainScreen.width
                readonly property real yRatio: bg.height / mainScreen.height
                xScale: Math.min(xRatio, yRatio)
                yScale: Math.min(xRatio, yRatio)
            }
            Component.onCompleted:
            {
                if(Qt.platform.os === 'android')
                {
                    JsonData.simulationRunning = true
                }
            }
        }
    }

    Window {
        id: controlsWindow
        width: 1000
        height: 400
        visible: Qt.platform.os !== 'android'
        x: mainScreen.x + 1180
        y: mainScreen.y + 1320

        Screen02 {
            id: controlPanel
        }
    }

    Component.onDestruction: controlsWindow.close()
}
