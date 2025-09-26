import QtQuick
import QtQuick.Controls
import QtQuick.Shapes 1.15

Rectangle {
    id: aDAS_RT
    width: 145
    height: 80
    color: "transparent"
    rotation: 60.711

    Shape {
        id: adasRtLeveA
        width: 44
        height: 58
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 50
        anchors.topMargin: -6
        rotation: -60.711
        layer.samples: 16
        layer.enabled: true
        ShapePath {
            id: adasRtLeveA_ShapePath_0
            strokeWidth: 1
            strokeColor: "transparent"
            PathSvg {
                id: adasRtLeveA_PathSvg_0
                path: "M 10 8.21382855065167e-8 L 44 58 L 34.5 58 L 0 0 L 10 8.21382855065167e-8 Z"
            }
            fillRule: ShapePath.WindingFill
            fillColor: "#cfc93b"
        }
        antialiasing: true
    }

    Shape {
        id: adasRtLeveB
        width: 63
        height: 90
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 38
        anchors.topMargin: -5
        rotation: -60.711
        layer.samples: 16
        layer.enabled: true
        ShapePath {
            id: adasRtLeveB_ShapePath_0
            strokeWidth: 1
            strokeColor: "transparent"
            PathSvg {
                id: adasRtLeveB_PathSvg_0
                path: "M 9.882781982421875 0 L 62.50003433227539 90.00000762939453 L 52.33476638793945 90.00006103515625 L 0 2.5481494958512485e-7 L 9.882781982421875 0 Z"
            }
            fillRule: ShapePath.WindingFill
            fillColor: "#cfc93b"
        }
        antialiasing: true
    }

    Shape {
        id: adasRtLeveC
        width: 80
        height: 118
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 23
        anchors.topMargin: -1
        rotation: -60.711
        layer.samples: 16
        layer.enabled: true
        ShapePath {
            id: adasRtLeveC_ShapePath_0
            strokeWidth: 1
            strokeColor: "transparent"
            PathSvg {
                id: adasRtLeveC_PathSvg_0
                path: "M 10 1.6257399693131447e-7 L 79.5 118.4753189086914 L 69.53975677490234 118.4753189086914 L 0 0 L 10 1.6257399693131447e-7 Z"
            }
            fillRule: ShapePath.WindingFill
            fillColor: "#cfc93b"
        }
        antialiasing: true
    }
}

/*##^##
Designer {
    D{i:0;uuid:"18ee387a-0db4-5052-98a6-71101653876e"}D{i:1;uuid:"a7f60563-3023-513f-a507-278122275a67"}
D{i:2;uuid:"a7f60563-3023-513f-a507-278122275a67_ShapePath_0"}D{i:3;uuid:"a7f60563-3023-513f-a507-278122275a67-PathSvg_0"}
D{i:4;uuid:"ef4602bd-d182-57f6-88cb-fca904d3dd1e"}D{i:5;uuid:"ef4602bd-d182-57f6-88cb-fca904d3dd1e_ShapePath_0"}
D{i:6;uuid:"ef4602bd-d182-57f6-88cb-fca904d3dd1e-PathSvg_0"}D{i:7;uuid:"59bf7de1-8ab6-5bac-9c81-286621dba29c"}
D{i:8;uuid:"59bf7de1-8ab6-5bac-9c81-286621dba29c_ShapePath_0"}D{i:9;uuid:"59bf7de1-8ab6-5bac-9c81-286621dba29c-PathSvg_0"}
}
##^##*/

