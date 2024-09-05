import QtQuick
import QtQuick.Controls
import QtQuick.Studio.Components 1.0
import QtQuick.Shapes 1.0

Button {
    id: compAcceptCall
    width: 100
    height: 100
    state: "state_Default"
    background: bkgrdAcCall

    ArcItem {
        id: bkgrdAcCall
        x: 0
        y: 0
        width: 100
        height: 100
        strokeWidth: 0
        strokeStyle: 0
        strokeColor: "transparent"
        outlineArc: true
        fillColor: "#06921c"
        end: 450.00001
        begin: 90
        arcWidth: 45
        antialiasing: true
    }

    Image {
        id: vecAcCall1
        x: 33
        y: 12
        width: 33
        height: 76
        source: "assets/vecAcCall.png"
        fillMode: Image.PreserveAspectFit
    }
    states: [
        State {
            name: "state_Default"
            when: !compAcceptCall.pressed

            PropertyChanges {
                target: bkgrdAcCall
                arcWidth: 50
            }
        },
        State {
            name: "state_Pressed"
            when: compAcceptCall.pressed

            PropertyChanges {
                target: bkgrdAcCall
                x: 5
                y: 5
                width: 90
                height: 90
                arcWidth: 45
            }

            PropertyChanges {
                target: vecAcCall1
                x: 36
                y: 18
                width: 28
                height: 64
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;formeditorColor:"#00000c";uuid:"ef4602bd-d182-57f6-88cb-fca904d3dd1e"}
}
##^##*/

