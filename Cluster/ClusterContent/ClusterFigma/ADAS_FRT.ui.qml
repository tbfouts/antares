import QtQuick
import QtQuick.Controls
import QtQuick.Shapes 1.15

Rectangle {
    id: aDAS_FRT
    width: 117
    height: 41
    color: "transparent"
    property alias adasFRLeveAOpacity: adasFRLeveA.opacity
    property alias adasFRLeveBOpacity: adasFRLeveB.opacity
    property alias adasFRLeveCOpacity: adasFRLeveC.opacity
    property alias adasFRLeveA_ShapePath_0FillColor: adasFRLeveA_ShapePath_0.fillColor
    property alias adasFRLeveB_ShapePath_0FillColor: adasFRLeveB_ShapePath_0.fillColor
    property alias adasFRLeveC_ShapePath_0FillColor: adasFRLeveC_ShapePath_0.fillColor

    Shape {
        id: adasFRLeveC
        width: 106
        height: 14
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 5
        anchors.topMargin: 26
        layer.samples: 16
        layer.enabled: true
        ShapePath {
            id: adasFRLeveC_ShapePath_0
            strokeWidth: 1
            strokeColor: "transparent"
            PathSvg {
                id: adasFRLeveC_PathSvg_0
                path: "M 4 7.428650379180908 C 4 7.428650379180908 26.230140686035156 -0.020657701788877603 53.5 0.0000430639847763814 C 80.76985931396484 0.020743829758430365 101.71880340576172 7.428650379180908 101.71880340576172 7.428650379180908 L 106 14 C 106 14 82.5 6.006470203399658 53.5 5.999973297119141 C 24.5 5.993476390838623 0 14 0 14 L 4 7.428650379180908 Z"
            }
            fillRule: ShapePath.WindingFill
            fillColor: "#cfc93b"
        }
        antialiasing: true
    }

    Shape {
        id: adasFRLeveB
        width: 90
        height: 13
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 13
        anchors.topMargin: 13
        layer.samples: 16
        layer.enabled: true
        ShapePath {
            id: adasFRLeveB_ShapePath_0
            strokeWidth: 1
            strokeColor: "transparent"
            PathSvg {
                id: adasFRLeveB_PathSvg_0
                path: "M 3.970113754272461 6.315800666809082 C 3.970113754272461 6.315800666809082 24.015235900878906 -0.009684533054496569 45.029781341552734 0.000011134718988614623 C 66.04432678222656 0.009706802492473798 86.74551391601562 6.315800666809082 86.74551391601562 6.315800666809082 L 90 12.815677642822266 C 90 12.815677642822266 69 6 45.029781341552734 6 C 21.05956268310547 6 0 12.815677642822266 0 12.815677642822266 L 3.970113754272461 6.315800666809082 Z"
            }
            fillRule: ShapePath.WindingFill
            fillColor: "#cfc93b"
        }
        antialiasing: true
    }

    Shape {
        id: adasFRLeveA
        width: 76
        height: 12
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 20
        anchors.topMargin: 1
        layer.samples: 16
        layer.enabled: true
        ShapePath {
            id: adasFRLeveA_ShapePath_0
            strokeWidth: 1
            strokeColor: "transparent"
            PathSvg {
                id: adasFRLeveA_PathSvg_0
                path: "M 3.9706594944000244 4.882535934448242 C 3.9706594944000244 4.882535934448242 17.01551628112793 -0.015101601660717279 38.53636932373047 0.00003501371247693896 C 60.057220458984375 0.015171629085671157 72.757080078125 4.882535934448242 72.757080078125 4.882535934448242 L 76 11.000005722045898 C 76 11.000005722045898 61.058189392089844 5.888869285583496 38.53636932373047 5.882535934448242 C 16.01454734802246 5.876202583312988 0 12.000005722045898 0 12.000005722045898 L 3.9706594944000244 4.882535934448242 Z"
            }
            fillRule: ShapePath.WindingFill
            fillColor: "#cfc93b"
        }
        antialiasing: true
    }
}

/*##^##
Designer {
    D{i:0;uuid:"c42fded0-93af-5754-b61a-ec790764bee6"}D{i:1;uuid:"3437b632-4aea-5623-a304-917873871095"}
D{i:2;uuid:"3437b632-4aea-5623-a304-917873871095_ShapePath_0"}D{i:3;uuid:"3437b632-4aea-5623-a304-917873871095-PathSvg_0"}
D{i:4;uuid:"722dac2b-78cf-50f1-85a5-466832c7419b"}D{i:5;uuid:"722dac2b-78cf-50f1-85a5-466832c7419b_ShapePath_0"}
D{i:6;uuid:"722dac2b-78cf-50f1-85a5-466832c7419b-PathSvg_0"}D{i:7;uuid:"4a44478e-12a2-5eac-bf19-9707dc8ffe89"}
D{i:8;uuid:"4a44478e-12a2-5eac-bf19-9707dc8ffe89_ShapePath_0"}D{i:9;uuid:"4a44478e-12a2-5eac-bf19-9707dc8ffe89-PathSvg_0"}
}
##^##*/

