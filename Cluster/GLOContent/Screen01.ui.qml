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
import VehicleData 1.0

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height
    color: "#000000"


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
            lightProbe: basicLights3_4K
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
            probeExposure: 40
            glowHDRMinimumValue: 0
            glowBloom: 0.36081
            glowQualityHigh: true
            glowIntensity: 0.28793
            glowStrength: 0.93527
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
                eulerRotation.z: 0.00003
                scope: genericCarModel
                eulerRotation.x: -60.00002
                eulerRotation.y: 179.99995
                ambientColor: "#666666"
                brightness: 1
                z: -790.60999
            }

            DirectionalLight {
                id: directionalLightLane
                x: 0
                y: 454.668
                visible: true
                color: "#e6e6e6"
                z: 0
                scope: lanePlane
                eulerRotation.z: 179.99994
                eulerRotation.y: 0.00005
                eulerRotation.x: -64.99998
                brightness: 5
                ambientColor: "#666666"
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
                lightOn: VehicleData.lights
                z: -6.48958
                eulerRotation.y: 180
                scale.z: 104
                scale.y: 100
                scale.x: 100
            }

            GenericCarModel {
                id: genericCarModel
                visible: true
                doorsOpenRight: VehicleData.doorPsgr
                doorsOpenLeft: VehicleData.doorDrvr
                carPaint_materialBaseColor: Themes.themeColor1
                eulerRotation.y: 180
                scale.z: 100
                scale.y: 100
                scale.x: 100
            }

            Model {
                id: headlampPlaneRight
                x: 68.492
                y: -3.605
                opacity: 0.978
                visible: VehicleData.lights
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
                scale.y: 0.9
                scale.x: 3.3792
            }

            Model {
                id: headlampPlaneLeft
                x: -66.347
                y: -3.605
                opacity: 0.978
                visible: VehicleData.lights
                source: "#Rectangle"
                z: -440.60001
                usedInBakedLighting: true
                scale.z: 1
                scale.y: 0.9
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
                y: -156.957
                opacity: VehicleData.speed
                visible: true
                source: "#Rectangle"
                eulerRotation.z: -90
                eulerRotation.y: 0.00002
                eulerRotation.x: -70
                z: -192.13997
                materials: laneLines
                receivesReflections: true
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
                visible: VehicleData.lights
                color: "#ffffbb"
                eulerRotation.z: 0
                eulerRotation.y: -0
                eulerRotation.x: -15
                scale.z: 1
                scale.y: 0.9
                scale.x: 1
                brightness: 80
                scope: headlampPlaneRight
                innerConeAngle: 14
                coneAngle: 26
                quadraticFade: 10
                z: -232.73135
            }

            SpotLight {
                id: spotlightLeft
                x: -67.088
                y: 23.4
                visible: VehicleData.lights
                color: "#ffffbb"
                z: -232.73135
                scope: headlampPlaneLeft
                scale.z: 1
                scale.y: 0.9
                scale.x: 1
                quadraticFade: 10
                innerConeAngle: 14
                eulerRotation.z: 0
                eulerRotation.y: 0
                eulerRotation.x: -15
                coneAngle: 26
                brightness: 80
            }


        }
    }


    Item {
        id: __materialLibrary__

        PrincipledMaterial {
            id: laneLines
            lighting: PrincipledMaterial.FragmentLighting
            blendMode: PrincipledMaterial.SourceOver
            occlusionChannel: Material.R
            occlusionMap: vecLaneLines
            metalness: 0
            baseColor: "#0a272727"
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
            baseColor: "#373737"
            objectName: "Headlamp Reflection"
        }

        Texture {
            id: basicLights3_4K
            source: "images/BasicLights3_4K.hdr"
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
        adasON: VehicleData.DriveMode.Adas === VehicleData.driveMode
        adasOFF: true
    }

}

/*##^##
Designer {
    D{i:0}D{i:4;cameraSpeed3d:25;cameraSpeed3dMultiplier:1}
}
##^##*/
