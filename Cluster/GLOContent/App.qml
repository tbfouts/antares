// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.7
//import GLO

Window {
    width: mainScreen.width
    height: mainScreen.height

    visible: true
    title: "GLO"

    Screen01 {
        id: mainScreen
    }

    Window {
        width: 1000
        height: 400
        visible: true
        x: mainScreen.x + 1180
        y: mainScreen.y + 1320

        Screen02 {
            id: controlPanel
        }
    }

}

