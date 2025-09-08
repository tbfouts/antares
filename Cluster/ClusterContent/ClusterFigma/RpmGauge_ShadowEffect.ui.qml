import QtQuick
import QtQuick.Controls
import QtQuick.Studio.DesignEffects
import QtQuick.Timeline 1.0
import Cluster 1.0
import VehicleData

Rectangle {
    id: rpmGauge_ShadowEffect
    width: 600
    height: 560
    color: "transparent"
    property alias designDropShadowColor: designDropShadow.color
    property alias rpmGaugeEffectRadius: rpmGaugeEffect.radius

    Rectangle {
        id: rpmGaugeEffect
        color: "#03d9d9d9"
        radius: 80
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 223
        anchors.rightMargin: 57
        anchors.topMargin: 120
        anchors.bottomMargin: 120

        DesignEffect {
            effects: [
                DesignDropShadow {
                    id: designDropShadow
                    color: "#b5b5b5"
                    offsetY: -20
                    offsetX: -45
                    spread: -60
                    blur: 120
                }
            ]
        }
    }

    Timeline {
        id: timelineRPM
        startFrame: 0
        endFrame: 130
        enabled: true
        currentFrame: VehicleData.speed

        KeyframeGroup {
            target: designDropShadow
            property: "spread"
            Keyframe {
                value: -20
                easing.bezierCurve: [0.66,-0.301,0.348,1.28,1,1]
                frame: 0
            }

            Keyframe {
                value: 50
                easing.bezierCurve: [0.66,-0.301,0.348,1.28,1,1]
                frame: 130
            }

            Keyframe {
                value: -4
                easing.bezierCurve: [0.66,-0.301,0.348,1.28,1,1]
                frame: 25
            }

            Keyframe {
                value: 14
                easing.bezierCurve: [0.66,-0.301,0.348,1.28,1,1]
                frame: 55
            }

            Keyframe {
                value: 32
                easing.bezierCurve: [0.66,-0.301,0.348,1.28,1,1]
                frame: 85
            }

            Keyframe {
                value: 47
                easing.bezierCurve: [0.66,-0.301,0.348,1.28,1,1]
                frame: 110
            }
        }
    }

}

/*##^##
Designer {
    D{i:0;uuid:"c5c2716a-b8f9-51c2-b695-89a3114fe7b5"}D{i:1;uuid:"442a56fd-86a1-5f0b-bce8-ecece746718d"}
D{i:3}
}
##^##*/

