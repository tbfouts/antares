import QtQuick
import QtQuick.Controls
import QtQuick.Studio.Components 1.0
import QtQuick.Shapes 1.0
import Data 1.0 as Data

Rectangle {
    id: mapNavigation
    width: 1920
    height: 1019
    color: "transparent"


    Image {
        id: vecRoadBlur
        x: 518
        y: 81
        source: "assets/vecRoadBlur.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: mapNav
        opacity: 0.254
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: "assets/map_436_62_436_62_1.png"
    }


    Rectangle {
        id: roadB3
        color: Data.Themes.themeColor2
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 413
        anchors.rightMargin: 1495
        anchors.topMargin: 445
        anchors.bottomMargin: 74
        rotation: -159.051
    }

    Rectangle {
        id: roadB4
        color: Data.Themes.themeColor2
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 565
        anchors.rightMargin: 1343
        anchors.topMargin: 173
        anchors.bottomMargin: 543
        rotation: -155.459
    }

    Rectangle {
        id: roadB5
        color: Data.Themes.themeColor2
        radius: 6
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 796
        anchors.rightMargin: 1112
        anchors.topMargin: 72
        anchors.bottomMargin: 566
        rotation: -65.969
    }

    Rectangle {
        id: roadB2
        color: Data.Themes.themeColor2
        radius: 6
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 415
        anchors.rightMargin: 1495
        anchors.topMargin: 862
        anchors.bottomMargin: -52
        rotation: 111.726
    }

    Rectangle {
        id: roadB1
        color: Data.Themes.themeColor2
        radius: 6
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 524
        anchors.rightMargin: 1384
        anchors.topMargin: 907
        anchors.bottomMargin: 8
        rotation: -156.809
    }

    Rectangle {
        id: road1
        color: Data.Themes.themeColor1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 620
        anchors.rightMargin: 1288
        anchors.topMargin: 535
        anchors.bottomMargin: 100
        rotation: 22.385
    }

    Rectangle {
        id: road2
        color: Data.Themes.themeColor1
        radius: 6
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 763
        anchors.rightMargin: 1145
        anchors.topMargin: 499
        anchors.bottomMargin: 353
        rotation: 114.004
    }

    Rectangle {
        id: road3
        color: Data.Themes.themeColor1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 902
        anchors.rightMargin: 1006
        anchors.topMargin: 321
        anchors.bottomMargin: 386
        rotation: 26.597
    }

    Rectangle {
        id: road4
        color: Data.Themes.themeColor1
        radius: 6
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 1025
        anchors.rightMargin: 883
        anchors.topMargin: 297
        anchors.bottomMargin: 593
        rotation: 114.004
    }

    Rectangle {
        id: road5
        color: Data.Themes.themeColor1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 1151
        anchors.rightMargin: 757
        anchors.topMargin: 92
        anchors.bottomMargin: 615
        rotation: 27.684
    }

    ArcItem {
        id: ellipStart
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 533
        anchors.rightMargin: 1347
        anchors.topMargin: 882
        anchors.bottomMargin: 97
        fillColor: Data.Themes.themeColor1
        strokeWidth: 0
        strokeStyle: 0
        strokeColor: "transparent"
        outlineArc: true
        end: 450.00001
        begin: 90
        arcWidth: 20
        antialiasing: true
    }


    ArcItem {
        id: ellipEnd
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 1201
        anchors.rightMargin: 679
        anchors.topMargin: 107
        anchors.bottomMargin: 872
        fillColor: Data.Themes.themeColor1
        strokeWidth: 0
        strokeStyle: 0
        strokeColor: "transparent"
        outlineArc: true
        end: 450.00001
        begin: 90
        arcWidth: 20
        antialiasing: true
    }

}

/*##^##
Designer {
    D{i:0;uuid:"f5b88747-d325-5203-bfa9-5e001fd894cc"}D{i:2;uuid:"27a608e3-1177-5e84-a779-5ef866c98cf1"}
D{i:3;uuid:"7deb1bfe-4a4c-505f-83c9-5b819d528076"}D{i:4;uuid:"81a028a3-fe41-58da-813d-6e8178a60153"}
D{i:5;uuid:"3d933f52-efb1-52b2-87fe-c75d5bc9b873"}D{i:6;uuid:"eb1e53d8-7603-57fe-95f1-66a93da88139"}
D{i:7;uuid:"301cc6f0-72dd-54e5-a600-887e45f45e57"}D{i:8;uuid:"27024770-28d3-5155-b1fa-f66ff8a375e4"}
D{i:9;uuid:"0cc38e76-dc85-5b27-b383-e3d49319b110"}D{i:10;uuid:"a973f54e-590e-598a-8719-10666cf6f277"}
D{i:11;uuid:"cb91bdca-8024-532f-9c70-fafb503a7520"}D{i:12;uuid:"7dd84d6a-ac21-5850-b0b2-22a628ee2307"}
D{i:13;uuid:"6d9b5a3f-e3de-55d0-9dbb-6d13531beb0d"}D{i:14;uuid:"bf6d2a0a-0a0d-53b2-b2c9-87998264335e"}
}
##^##*/

