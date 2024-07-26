import QtQuick
import QtQuick.Controls
import QtQuick.Studio.Components 1.0
import QtQuick.Shapes 1.0
import GLO 1.0
import VehicleData 1.0

Rectangle {
    id: directionsMini_Comp
    width: 647
    height: 206
    color: "transparent"
    property alias txt_ETATimeText: txt_ETATime.text
    property alias txt_ETAdistanceText: txt_ETAdistance.text
    property alias txt_NEText: txt_NE.text

    SvgPathItem {
        id: directions_Border
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: 2
        anchors.bottomMargin: -2
        strokeWidth: 1
        strokeStyle: 1
        strokeColor: "#3f3f3f"
        path: "M 75.44170379638672 0 L 647 0 L 647 206 L 0 206 L 75.44170379638672 0 Z"
        joinStyle: 0
        fillColor: "#1e1e1e"
        antialiasing: true
    }

    ArcItem {
        id: arrowVecOutline
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 94
        anchors.rightMargin: 511
        anchors.topMargin: 16
        anchors.bottomMargin: 148
        strokeWidth: 2
        strokeStyle: 1
        strokeColor: "#858585"
        outlineArc: true
        fillColor: "transparent"
        end: 450.00001
        begin: 90
        arcWidth: 21.16432
        antialiasing: true
    }

    Image {
        id: arrowVec
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 100
        anchors.rightMargin: 523
        anchors.topMargin: 29
        anchors.bottomMargin: 161
        source: "assets/arrowVec.png"
    }

    Text {
        id: txt_ETATime
        color: "#c5c5c5"
        text: qsTr("14 Mins")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 226
        anchors.rightMargin: 296
        anchors.topMargin: 20
        anchors.bottomMargin: 153
        font.pixelSize: 32
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Light
        font.family: "Oxanium"
    }

    Text {
        id: txt_ETAdistance
        color: "#afafaf"
        text: VehicleData.UnitType.Metric === VehicleData.units ? "13.3 km" : "26.6 mi"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 367
        anchors.rightMargin: 181
        anchors.topMargin: 26
        anchors.bottomMargin: 155
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Oxanium"
    }

    Text {
        id: txt_NE
        color: "#b3b3b3"
        text: qsTr("NE")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 141
        anchors.rightMargin: 476
        anchors.topMargin: 26
        anchors.bottomMargin: 155
        font.pixelSize: 22
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Oxanium"
    }

    SvgPathItem {
        id: destVec
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 198
        anchors.rightMargin: 428
        anchors.topMargin: 21
        anchors.bottomMargin: 151
        strokeWidth: 1
        strokeStyle: 1
        strokeColor: "transparent"
        path: "M 10.50002058037843 0 C 4.70274458456742 0 0 4.770088483982029 0 10.650394100927667 C 0 16.530699717873304 10.500008232151371 34 10.500008232151371 34 C 10.500008232151371 34 20.999999999999996 16.534201699836075 20.999999999999996 10.650394100927667 C 20.999999999999996 4.76658650201926 16.30074842016195 0 10.50002058037843 0 Z M 10.50002058037843 18.22229317363246 C 6.398076925338502 18.22229317363246 3.062644834413215 14.839099427439852 3.062644834413215 10.678406802164755 C 3.062644834413215 6.517714176889659 6.398076925338502 3.134527528243441 10.50002058037843 3.134527528243441 C 14.60196423541836 3.134527528243441 17.9373536220584 6.517714176889659 17.9373536220584 10.678406802164755 C 17.9373536220584 14.839099427439852 14.60196423541836 18.22229317363246 10.50002058037843 18.22229317363246 Z"
        joinStyle: 0
        fillColor: "#646464"
        antialiasing: true
    }
}

/*##^##
Designer {
    D{i:0;uuid:"0aeb89ab-9008-5d29-9462-f1fa213d9c04"}D{i:1;uuid:"a231058d-e905-5c7c-9bd4-3798ab5a83f3"}
D{i:2;uuid:"aaa8c3ed-eff8-5987-b702-24fbd33bd576"}D{i:3;uuid:"db4232b5-e1fd-5983-ac3c-4980014cd47c"}
D{i:4;uuid:"2fcb7cce-15b9-58ba-a53e-3f37bd4a2831"}D{i:5;uuid:"e5e0a9af-58eb-58cf-bd00-bb2a51699bbe"}
D{i:6;uuid:"14ba35cc-7d50-5042-beb7-876fdcfbe138"}D{i:7;uuid:"d92673f1-c8a2-5760-bbe0-b868924f3919"}
}
##^##*/

