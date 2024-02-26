/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/

import QtQuick 6.5
import QtQuick.Controls 6.5
import QtMediaSwipe
import "QtMediaSwipeArt"
import Data 1.0 as Data
import QtQuick3D 6.5
import QtQuick3D.SpatialAudio
import QtMultimedia

Rectangle {
    id: swipeBkgrd
    width: Constants.width
    height: Constants.height
    visible: true
    color: Data.Themes.backgroundColor
    border.color: "#00000000"

    SwipeView {
        id: swipeView
        x: 0
        y: 0
        width: 1920
        height: 1080
        interactive: true
        currentIndex: 1
        focusPolicy: Qt.ClickFocus

        CarView3D {
            id: carView3D
        }

        MediaPlayerLayout {
            id: mediaPlayerLayout
        }

        NavView {
            id: navView
        }
    }

    TopBarSwipe {
        id: topBar
        visible: true
    }

    TabBar {
        id: tabBar
        y: 993
        width: 742
        height: 87
        position: TabBar.Header
        hoverEnabled: false
        anchors.horizontalCenter: parent.horizontalCenter
        currentIndex: swipeView.currentIndex

        BtnVehicleView {
            id: btnVehicleView
            y: 13
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.leftMargin: 28
            anchors.bottomMargin: 8
            checked: false

            Connections {
                target: btnVehicleView
                onPressed: swipeView.setCurrentIndex(0)
            }
        }
        BtnMediaView {
            id: btnMediaView
            y: 13
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.leftMargin: 263
            anchors.bottomMargin: 8
            checked: false

            Connections {
                target: btnMediaView
                onPressed: swipeView.setCurrentIndex(1)
            }
        }

        BtnNavView {
            id: btnNavView
            y: 13
            width: 220
            height: 62
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.leftMargin: 495
            anchors.bottomMargin: 8

            Connections {
                target: btnNavView
                onPressed: swipeView.setCurrentIndex(2)
            }
        }
    }

    Item {
        id: __materialLibrary__
    }
}
