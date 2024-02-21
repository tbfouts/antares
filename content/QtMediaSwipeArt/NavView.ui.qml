import QtQuick
import QtQuick.Controls

Rectangle {
    id: navView
    width: 1920
    height: 1080
    color: "transparent"
    border.color: "#00ffffff"
    border.width: 1
    clip: true



    GpsMapView {
        id: gpsMapView
        clip: true
    }



    SideRTMediaPlayer {
        id: sideRTMediaPlayer
        x: 1356
        width: 564
        height: 1020
        anchors.top: parent.top
        anchors.topMargin: 60
    }


    RoutePerformance {
        id: routePerformance
        x: 0
        y: 60
    }










}

/*##^##
Designer {
    D{i:0;uuid:"96d6ae57-acf3-573d-b70d-9ab63caa8716"}D{i:2;uuid:"4f86a59d-37e3-5196-ba4b-d1e7fd0e9070"}
}
##^##*/

