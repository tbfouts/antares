import QtQuick
import QtQuick.Controls
import QtQuick.Studio.DesignEffects 1.0

Rectangle {
    id: incomingCall
    width: 1044
    height: 754
    color: "transparent"
    property alias txtCallSourceText: txtCallSource.text
    property alias txtAcceptText: txtAccept.text
    property alias txtCallerIDText: txtCallerID.text
    property alias txtDeclineText: txtDecline.text

    Rectangle {
        id: bkgrdIVIPopup
        color: "#e8202732"
        radius: 84
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 190
        anchors.rightMargin: 142
        anchors.topMargin: 100
        anchors.bottomMargin: 99
        DesignEffect {
            id: bkgrdIVIPopup_DesignEffect
            visible: true
            effects: [
                DesignDropShadow {
                    id: bkgrdIVIPopup_DesignDropShadow_0
                    visible: true
                    color: "#99ffffff"
                    spread: 31
                    offsetY: 2
                    offsetX: 0
                    blur: 83.4
                }
            ]
        }
    }

    Image {
        id: picQSolLg
        opacity: 0.828
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 130
        anchors.rightMargin: 82
        anchors.topMargin: 40
        anchors.bottomMargin: 39
        source: "assets/picQSolLg.png"
    }

    Text {
        id: txtCallerID
        color: "#ffffff"
        text: qsTr("Quinn Solara")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 244
        anchors.rightMargin: 195
        anchors.topMargin: 334
        anchors.bottomMargin: 333
        font.pixelSize: 65
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Oxanium"
    }

    Text {
        id: txtCallSource
        color: "#bbbbbb"
        text: qsTr("MOBILE")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 436
        anchors.rightMargin: 404
        anchors.topMargin: 407
        anchors.bottomMargin: 310
        font.pixelSize: 30
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Oxanium"
    }

    Text {
        id: txtDecline
        color: "#ffffff"
        text: qsTr("DECLINE")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 354
        anchors.rightMargin: 580
        anchors.topMargin: 578
        anchors.bottomMargin: 150
        font.pixelSize: 26
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Oxanium"
    }

    Text {
        id: txtAccept
        color: "#ffffff"
        text: qsTr("ACCEPT")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 644
        anchors.rightMargin: 302
        anchors.topMargin: 578
        anchors.bottomMargin: 150
        font.pixelSize: 26
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Oxanium"
    }

    CompAcceptCall {
        id: compAcceptCall
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 639
        anchors.rightMargin: 305
        anchors.topMargin: 464
        anchors.bottomMargin: 190
        state: "state_Default"
    }

    CompDeclineCall {
        id: compDeclineCall
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 354
        anchors.rightMargin: 590
        anchors.topMargin: 464
        anchors.bottomMargin: 190
        state: "state_Default"
    }

    Image {
        id: picQSolSm
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 451
        anchors.rightMargin: 402
        anchors.topMargin: 150
        anchors.bottomMargin: 413
        source: "assets/picQSolSm.png"
    }
}

/*##^##
Designer {
    D{i:0;formeditorColor:"#00000c";uuid:"bc7b0c70-7356-5722-bcbc-a9e32975173d"}D{i:1;uuid:"a164412a-ffef-5b3a-a1b4-0f4e53046362"}
D{i:2;uuid:"a164412a-ffef-5b3a-a1b4-0f4e53046362_DesignEffect"}D{i:3;uuid:"a164412a-ffef-5b3a-a1b4-0f4e53046362_DesignDropShadow_0"}
D{i:4;uuid:"e9fd9dcc-aaa2-5084-9699-a816f04df439"}D{i:5;uuid:"ed0bfe73-4154-51de-a4ba-df60bcf60b59"}
D{i:6;uuid:"5c397327-a83b-5d96-95da-6b23ac9aafad"}D{i:7;uuid:"9e724508-9afe-5920-93f6-8b20479c50b0"}
D{i:8;uuid:"36be5267-7276-5f13-985d-68d63eaca3bf"}D{i:9;uuid:"625cc2ae-faf4-53a7-92c9-283160d61557"}
D{i:10;uuid:"94206b40-19bd-5b88-aafb-1ce5d4dfd433"}D{i:11;uuid:"110f5d8c-5d30-531b-b778-2aca5c38a693"}
}
##^##*/

