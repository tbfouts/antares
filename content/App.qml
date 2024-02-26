// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.5
import QtMediaSwipe

Window {
    width: mainScreen.width
    height: mainScreen.height
    visible: true
    title: "Built with Qt"
    visibility: Qt.platform.os === 'android' ? Window.FullScreen : Window.AutomaticVisibility

    Rectangle {
             id: bg
             color: "black"
             anchors.fill: parent

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
        }
    }

}

