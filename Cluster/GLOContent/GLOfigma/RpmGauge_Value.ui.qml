import QtQuick
import QtQuick.Controls
import QtQuick.Studio.DesignEffects

Rectangle {
    id: rpmGauge_Value
    width: 320
    height: 320
    color: "transparent"
    property alias rpmGaugeCoverColor: rpmGaugeCover.color
    property alias designInnerShadowColor: designInnerShadow.color
    property alias designDropShadowColor: designDropShadow.color
    property alias rpmGaugeCoverRadius: rpmGaugeCover.radius
    property alias txtRPMValueRRText: txtRPMValueRR.text
    property alias txtRPMValueFRText: txtRPMValueFR.text
    property alias txtx1000Text: txtx1000.text
    property alias txtRPMText: txtRPM.text

    Rectangle {
        id: rpmGaugeCover
        width: 320
        height: 320
        color: "#1e1e1e"
        radius: 80
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 0

        DesignEffect {
            effects: [
                DesignDropShadow {
                    id: designDropShadow
                    color: "#a2757575"
                    spread: 1
                    blur: 30
                    offsetY: 6
                    offsetX: -2
                },
                DesignInnerShadow {
                    id: designInnerShadow
                    color: "#80ffffff"
                    offsetY: -9
                    offsetX: -20
                    spread: -20
                    blur: 18
                }
            ]
        }
    }

    Text {
        id: txtRPMValueRR
        width: 284
        height: 149
        color: "#727272"
        text: qsTr("6")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 20
        anchors.topMargin: 87
        font.pixelSize: 160
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Oxanium"
    }

    Text {
        id: txtRPMValueFR
        width: 284
        height: 149
        color: "#fef4d0"
        text: qsTr("6")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 18
        anchors.topMargin: 85
        font.pixelSize: 160
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Oxanium"
    }

    Text {
        id: txtRPM
        width: 102
        height: 36
        color: "#a8a8a8"
        text: qsTr("RPM")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 110
        anchors.topMargin: 221
        font.pixelSize: 34
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Oxanium"
    }

    Text {
        id: txtx1000
        width: 102
        height: 19
        color: "#a8a8a8"
        text: qsTr("x1000")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 110
        anchors.topMargin: 257
        font.pixelSize: 16
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Oxanium"
    }
}

/*##^##
Designer {
    D{i:0;uuid:"30f47b90-8543-54a9-bf4e-7c246284da28"}D{i:1;uuid:"b8124077-1df1-599c-adad-cc736df269a3"}
D{i:5;uuid:"dcac267a-c1cb-5831-b010-ab37552240ed"}D{i:6;uuid:"82f582fc-4131-5a1c-88b8-55d9d4bd2f80"}
D{i:7;uuid:"27b2d9c2-dcf6-5378-af7a-738e3fc2f797"}D{i:8;uuid:"fd2cac88-ad0e-5b1d-b8d5-a3aa4675c4e1"}
}
##^##*/

