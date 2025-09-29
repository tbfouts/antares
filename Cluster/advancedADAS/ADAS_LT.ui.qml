import QtQuick
import QtQuick.Controls
import QtQuick.Shapes 1.15

Rectangle {
    id: aDAS_LT
    width: 145
    height: 80
    color: "transparent"
    property alias adasLtLeveC_ShapePath_0FillColor: adasLtLeveC_ShapePath_0.fillColor
    property alias adasLtLeveB_ShapePath_0FillColor: adasLtLeveB_ShapePath_0.fillColor
    property alias adasLtLeveA_ShapePath_0FillColor: adasLtLeveA_ShapePath_0.fillColor
    property alias adasLtLeveCOpacity: adasLtLeveC.opacity
    property alias adasLtLeveBOpacity: adasLtLeveB.opacity
    property alias adasLtLeveAOpacity: adasLtLeveA.opacity
    rotation: 60.711

    Shape {
        id: adasLtLeveA
        width: 44
        height: 58
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 39
        anchors.topMargin: -7
        rotation: 60.711
        layer.samples: 16
        layer.enabled: true
        ShapePath {
            id: adasLtLeveA_ShapePath_0
            strokeWidth: 1
            strokeColor: "transparent"
            PathSvg {
                id: adasLtLeveA_PathSvg_0
                path: "M 34 8.21382855065167e-8 L 0 58 L 9.500000953674316 58 L 44 0 L 34 8.21382855065167e-8 Z"
            }
            fillRule: ShapePath.WindingFill
            fillColor: "#cfc93b"
        }
        antialiasing: true
    }

    Shape {
        id: adasLtLeveB
        width: 63
        height: 90
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 31
        anchors.topMargin: -5
        rotation: 60.711
        layer.samples: 16
        layer.enabled: true
        ShapePath {
            id: adasLtLeveB_ShapePath_0
            strokeWidth: 1
            strokeColor: "transparent"
            PathSvg {
                id: adasLtLeveB_PathSvg_0
                path: "M 52.617252349853516 0 L 0 90.00000762939453 L 10.16526985168457 90.00006103515625 L 62.50003433227539 2.5481494958512485e-7 L 52.617252349853516 0 Z"
            }
            fillRule: ShapePath.WindingFill
            fillColor: "#cfc93b"
        }
        antialiasing: true
    }

    Shape {
        id: adasLtLeveC
        width: 80
        height: 118
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 23
        anchors.topMargin: -1
        rotation: 60.711
        layer.samples: 16
        layer.enabled: true
        ShapePath {
            id: adasLtLeveC_ShapePath_0
            strokeWidth: 1
            strokeColor: "transparent"
            PathSvg {
                id: adasLtLeveC_PathSvg_0
                path: "M 69.5 1.6257399693131447e-7 L 0 118.4753189086914 L 9.96023941040039 118.4753189086914 L 79.5 0 L 69.5 1.6257399693131447e-7 Z"
            }
            fillRule: ShapePath.WindingFill
            fillColor: "#cfc93b"
        }
        antialiasing: true
    }
}

/*##^##
Designer {
    D{i:0;uuid:"9978f636-f18a-51a7-86b9-c9ba62d426b8"}D{i:1;uuid:"6d3a9179-945f-54db-98fe-9f96486eb357"}
D{i:2;uuid:"6d3a9179-945f-54db-98fe-9f96486eb357_ShapePath_0"}D{i:3;uuid:"6d3a9179-945f-54db-98fe-9f96486eb357-PathSvg_0"}
D{i:4;uuid:"1183c034-c4a5-5ed9-9f2e-13a108e6906c"}D{i:5;uuid:"1183c034-c4a5-5ed9-9f2e-13a108e6906c_ShapePath_0"}
D{i:6;uuid:"1183c034-c4a5-5ed9-9f2e-13a108e6906c-PathSvg_0"}D{i:7;uuid:"bbcf08e6-1aef-517b-9e5d-b58f9cf56e3b"}
D{i:8;uuid:"bbcf08e6-1aef-517b-9e5d-b58f9cf56e3b_ShapePath_0"}D{i:9;uuid:"bbcf08e6-1aef-517b-9e5d-b58f9cf56e3b-PathSvg_0"}
}
##^##*/

