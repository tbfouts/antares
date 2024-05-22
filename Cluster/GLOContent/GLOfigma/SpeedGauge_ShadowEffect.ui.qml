import QtQuick
import QtQuick.Controls
import QtQuick.Studio.DesignEffects
import QtQuick.Timeline 1.0
import GLO 1.0

Rectangle {
    id: speedGauge_ShadowEffect
    width: 600
    height: 600
    color: "transparent"
    property alias designDropShadowColor: designDropShadow.color
    property alias speedGaugeEffectRadius: speedGaugeEffect.radius

   // property alias kphSpeed: timelineSPEED.currentFrame

    Rectangle {
        id: speedGaugeEffect
        color: "#03d9d9d9"
        radius: 80
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 76
        anchors.rightMargin: 204
        anchors.topMargin: 140
        anchors.bottomMargin: 140

        DesignEffect {
            effects: [
                DesignDropShadow {
                    id: designDropShadow
                    color: "#b5b5b5"
                    offsetY: -20
                    offsetX: 45
                    spread: -60
                    blur: 120
                }
            ]
        }
    }

    Timeline {
        id: timelineSPEED
        startFrame: 0
        endFrame: 130
        enabled: true
        currentFrame: JsonData.speed

        KeyframeGroup {
            target: designDropShadow
            property: "spread"
            Keyframe {
                value: -20
                frame: 0
            }

            Keyframe {
                value: 50
                frame: 130
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;uuid:"774c6b0a-d2ee-5260-a1a0-fb2cc3c7c9d0"}D{i:3}
}
##^##*/

