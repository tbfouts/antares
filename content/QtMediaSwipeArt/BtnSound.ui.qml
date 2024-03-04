import QtQuick
import QtQuick.Controls

Button {
    id: btnSound
    width: 40
    height: 41
    checked: true
    checkable: true
    state: "state_Mute"
    background: soundBkgrd

    Image {
        id: soundBkgrd
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: -2
        anchors.rightMargin: 3
        anchors.topMargin: -2
        anchors.bottomMargin: -10
        source: "assets/soundBkgrd_state_On.png"
    }

    Image {
        id: soundON
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 27
        anchors.rightMargin: -10
        anchors.topMargin: 8
        anchors.bottomMargin: 0
        source: "assets/soundON_state_On.png"
    }

    Image {
        id: soundOFF
        visible: false
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 27
        anchors.rightMargin: -10
        anchors.topMargin: 13
        anchors.bottomMargin: 5
        source: "assets/soundOFF_state_Mute.png"
    }
    states: [
        State {
            name: "state_Mute"
            when: btnSound.checked

            PropertyChanges {
                target: soundBkgrd
                source: "assets/soundBkgrd_state_Mute.png"
            }

            PropertyChanges {
                target: soundON
                visible: false
            }

            PropertyChanges {
                target: soundOFF
                visible: true
            }
        },
        State {
            name: "state_On"
            when: !btnSound.checked

            PropertyChanges {
                target: soundBkgrd
                source: "assets/soundBkgrd_state_On.png"
            }

            PropertyChanges {
                target: soundON
                visible: true
            }

            PropertyChanges {
                target: soundOFF
                visible: false
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;uuid:"261f10d7-ce33-5ff0-8fc0-274b5e86fd67"}D{i:1;uuid:"5c18203e-7a8b-5ddc-a12b-e3ce5d51a12c"}
D{i:2;uuid:"9f0f1674-971e-5fa4-88bb-5b2f97347f61"}
}
##^##*/

