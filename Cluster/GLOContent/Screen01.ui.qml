/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/

import QtQuick 6.7
import QtQuick.Controls 6.7
import QtQuick3D 6.7
import QtQuick3D.Effects 6.7
import GLO 1.0
import "GLOfigma"
import Generated.QtQuick3D.GenericCarModel
import Generated.QtQuick3D.Lights
import QtQuick3D.Helpers 6.7
import QtQuick3D.AssetUtils
import QtQuick.Timeline 1.0

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height
    color: "#000000"
    state: "Running"


    GLOlayout {
        id: gLOlayout
        state: "BOOST"
        bkgrdRectangleSmallVisible: true
        speedometer_ValueSpeedGaugeCoverColor: "#1e1e1e"
        rpmGauge_ValueRpmGaugeCoverColor: "#1e1e1e"
        speedometer_ValueDropShadowColor: Themes.themeColor1
        rpmGauge_ValueDropShadowColor: Themes.themeColor1
        speedometer_ValueInnerShadowColor: Themes.themeColor2
        rpmGauge_ValueInnerShadowColor: Themes.themeColor2
        speedGauge_ShadowColor: Themes.themeColor2
        rpmGauge_ShadowColor: Themes.themeColor2
        adasCompVisible: false
    }

    View3D {
        id: view3D
        y: 0
        width: 580
        height: 720
        anchors.horizontalCenter: parent.horizontalCenter
        camera: sceneCamera
        environment: extendedSceneEnvironment


        ExtendedSceneEnvironment {
            id: extendedSceneEnvironment
            tonemapMode: SceneEnvironment.TonemapModeLinear
            probeHorizon: 0.1
            lightProbe: the_sky_is_on_fire_4k
            glowUseBicubicUpscale: true
            glowLevel: ExtendedSceneEnvironment.GlowLevel.One
                       | ExtendedSceneEnvironment.GlowLevel.Two
                       | ExtendedSceneEnvironment.GlowLevel.Three
                       | ExtendedSceneEnvironment.GlowLevel.Four
                       | ExtendedSceneEnvironment.GlowLevel.Six
            glowBlendMode: ExtendedSceneEnvironment.GlowBlendMode.Additive
            depthOfFieldEnabled: false
            aoEnabled: true
            glowHDRMaximumValue: 79.64209
            glowHDRScale: 2.40928
            probeExposure: 1
            glowHDRMinimumValue: 0
            glowBloom: 0.36081
            glowQualityHigh: true
            glowIntensity: 0.3377
            glowStrength: 0.17627
            lensFlareEnabled: false
            glowEnabled: true
            ditheringEnabled: true
            temporalAAStrength: 2
            specularAAEnabled: false
            temporalAAEnabled: false
            fxaaEnabled: true
            antialiasingQuality: SceneEnvironment.High
            antialiasingMode: SceneEnvironment.MSAA
            backgroundMode: SceneEnvironment.Transparent
        }


        Node {
            id: scene
            DirectionalLight {
                id: directionalLight
                x: -0
                y: 454.668
                visible: true
                color: "#e6e6e6"
                scope: genericCarModel
                eulerRotation.x: -60
                eulerRotation.y: 180
                ambientColor: "#000000"
                brightness: 12
                z: -790.60999
            }

            PerspectiveCamera {
                id: sceneCamera
                x: -0
                y: 529.607
                eulerRotation.y: 0.00001
                eulerRotation.z: 0.00001
                eulerRotation.x: -38
                fieldOfView: 38
                z: 656.89447
            }

            Lights {
                id: lights
                x: -0
                y: -0
                visible: true
                lightOn: JsonData.lights
                z: -6.48958
                eulerRotation.y: 180
                scale.z: 104
                scale.y: 100
                scale.x: 100
            }

            GenericCarModel {
                id: genericCarModel
                visible: true
                doorsOpenRight: JsonData.doorPsgr
                doorsOpenLeft: JsonData.doorDrvr
                carPaint_materialBaseColor: Themes.themeColor1
                eulerRotation.y: 180
                scale.z: 100
                scale.y: 100
                scale.x: 100
            }

            Model {
                id: headlampPlaneRight
                x: 70.14
                y: -3.605
                opacity: 0.978
                visible: JsonData.lights
                source: "#Rectangle"
                usedInBakedLighting: true
                scale.z: 1
                z: -440.59552
                receivesReflections: true
                eulerRotation.z: 90
                eulerRotation.x: -90
                eulerRotation.y: 180
                materials: headlampReflection
                castsReflections: false
                receivesShadows: false
                castsShadows: false
                scale.y: 0.8736
                scale.x: 3.3792
            }

            Model {
                id: headlampPlaneLeft
                x: -66.347
                y: -3.605
                opacity: 0.978
                visible: JsonData.lights
                source: "#Rectangle"
                z: -443.95938
                usedInBakedLighting: true
                scale.z: 1
                scale.y: 0.8736
                scale.x: 3.3792
                receivesShadows: false
                receivesReflections: true
                materials: headlampReflection
                eulerRotation.z: 90
                eulerRotation.y: 180
                eulerRotation.x: -90
                castsShadows: false
                castsReflections: false
            }

            Model {
                id: shadowPlane
                x: -0
                y: 3
                opacity: 0.978
                visible: true
                source: "#Rectangle"
                z: -11.90749
                receivesReflections: true
                eulerRotation.z: 90
                eulerRotation.x: -90
                eulerRotation.y: 180
                materials: floorOpacity1
                castsReflections: false
                receivesShadows: true
                castsShadows: false
                scale.y: 2.8
                scale.x: 5.6
            }


            Model {
                id: lanePlane
                x: -0
                y: -184.127
                opacity: JsonData.speed
                visible: true
                source: "#Rectangle"
                z: -11.17475
                materials: laneLines
                receivesReflections: true
                eulerRotation.z: -90.00005
                eulerRotation.x: -75.00004
                eulerRotation.y: 0.00003
                castsReflections: false
                receivesShadows: false
                castsShadows: false
                scale.y: 4.75
                scale.x: 18
            }

            SpotLight {
                id: spotlightRight
                x: 70.014
                y: 23.399
                visible: JsonData.lights
                color: "#ffffbb"
                eulerRotation.z: 0
                eulerRotation.y: -0
                eulerRotation.x: -15
                scale.z: 1
                scale.y: 0.9
                scale.x: 1
                brightness: 600
                scope: headlampPlaneRight
                innerConeAngle: 14
                coneAngle: 30
                quadraticFade: 10
                z: -232.73135
            }

            SpotLight {
                id: spotlightLeft
                x: -67.088
                y: 23.4
                visible: JsonData.lights
                color: "#ffffbb"
                z: -232.73135
                scope: headlampPlaneLeft
                scale.z: 1
                scale.y: 0.9
                scale.x: 1
                quadraticFade: 10
                innerConeAngle: 17
                eulerRotation.z: 0
                eulerRotation.y: 0
                eulerRotation.x: -15
                coneAngle: 29
                brightness: 600
            }

        }
    }


    Item {
        id: __materialLibrary__

        Texture {
            id: the_sky_is_on_fire_4k
            source: "images/the_sky_is_on_fire_4k.hdr"
        }

        PrincipledMaterial {
            id: laneLines
            lighting: PrincipledMaterial.FragmentLighting
            blendMode: PrincipledMaterial.SourceOver
            occlusionChannel: Material.R
            occlusionMap: vecLaneLines
            metalness: 0
            baseColor: "#00000000"
            objectName: "laneLines"

            Texture {
                id: vecLaneLines
                source: "GLOfigma/assets/vecLaneLines.png"
                positionV: -110
                tilingModeHorizontal: Texture.Repeat
                tilingModeVertical: Texture.Repeat
                scaleU: 1.3
                rotationUV: 90
            }
        }

        PrincipledMaterial {
            id: floorOpacity1
            opacity: 1
            alphaMode: PrincipledMaterial.Opaque
            opacityChannel: Material.A
            baseColorMap: floorOpacity
            lighting: PrincipledMaterial.NoLighting
            opacityMap: floorOpacity
            baseColor: "#ef000000"
            objectName: "floorOpacity"

            Texture {
                id: floorOpacity
                source: "images/floorOpacity.png"
                positionU: 0.01
                positionV: 0
            }
        }

        PrincipledMaterial {
            id: headlampReflection
            attenuationColor: "#363636"
            metalness: 0.09332
            transmissionFactor: 0.47422
            lighting: PrincipledMaterial.FragmentLighting
            roughness: 1
            baseColor: "#000000"
            objectName: "Headlamp Reflection"
        }

        Texture {
            id: basicLights2_4K
            source: "../images/BasicLights2_4K.hdr"
        }

        Texture {
            id: basicLights1_4K
            source: "../images/BasicLights1_4K.hdr"
        }

        Texture {
            id: basicLights3_4K
            source: "../images/BasicLights3_4K.hdr"
        }
    }

    Timeline {
        id: timeline
        animations: [
            TimelineAnimation {
                id: timelineAnimation
                running: true
                loops: -1
                duration: 3000
                to: 130
                from: 0
            }
        ]
        startFrame: 0
        endFrame: 1000
        enabled: true

        KeyframeGroup {
            target: vecLaneLines
            property: "positionV"
            Keyframe {
                value: 0
                frame: 0
            }

            Keyframe {
                value: -10
                frame: 130
            }
        }
    }

    AdasComp {
        id: adasComp
        y: 64
        width: 480
        anchors.horizontalCenter: parent.horizontalCenter
        adasON: JsonData.adas
        adasOFF: true
    }
    states: [
        State {
            name: "Running"
        }
    ]

}

/*##^##
Designer {
    D{i:0}D{i:4;cameraSpeed3d:25;cameraSpeed3dMultiplier:1}
}
##^##*/
