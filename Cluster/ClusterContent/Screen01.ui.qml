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
import Cluster 1.0
import "ClusterFigma"
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


    ClusterLayout {
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
        environment: xsceneEnvironment


        ExtendedSceneEnvironment {
            id: xsceneEnvironment
            probeOrientation.x: 10
            probeOrientation.y: 74
            probeExposure: 1
            probeHorizon: 0.5
            lightProbe: konzerthaus_4k
            depthOfFieldFocusRange: 120
            glowLevel: ExtendedSceneEnvironment.GlowLevel.Five
                    depthOfFieldBlurAmount: 15
                    depthOfFieldFocusDistance: 500
                    depthOfFieldEnabled: false
                    adjustmentContrast: 1
                    adjustmentBrightness: 1
                    colorAdjustmentsEnabled: false
                    ditheringEnabled: false
                    sharpnessAmount: 0
                    whitePoint: 1
                    aoDither: false
                    aoSampleRate: 4
                    aoSoftness: 0
                    lutEnabled: false
                    exposure: 1.25
                    lensFlareBlurAmount: 50
                    lensFlareDistortion: 5
                    lensFlareStretchToAspect: 0.5
                    lensFlareHaloWidth: 0.5
                    lensFlareGhostDispersal: 0.5
                    lensFlareBloomBias: 0.1
                    lensFlareBloomScale: 20
                    lensFlareEnabled: false
                    vignetteEnabled: false
                    glowBlendMode: ExtendedSceneEnvironment.GlowBlendMode.Screen
                    glowHDRMinimumValue: 2.48
                    glowHDRMaximumValue: 5.18
                    glowHDRScale: 1
                    glowBloom: 0
                    glowIntensity: 0.001
                    glowStrength: 0.42
                    glowQualityHigh: true
                    glowEnabled: true
                    fxaaEnabled: true
                    clearColor: "#191919"
                    depthPrePassEnabled: true
                    aoDistance: 0
                    aoEnabled: false
                    backgroundMode: SceneEnvironment.Transparent
                    tonemapMode: SceneEnvironment.TonemapModeLinear
                    temporalAAEnabled: false
                    antialiasingMode: SceneEnvironment.SSAA
                    antialiasingQuality: SceneEnvironment.Medium
        }


        Node {
            id: scene
            DirectionalLight {
                id: directionalLight
                x: -0
                y: 454.668
                visible: false
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
                opacity: 1
                visible: VehicleData.lights
                source: "#Rectangle"
                usedInBakedLighting: true
                scale.z: 1
                z: -440.59552
                receivesReflections: false
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
                opacity: 1
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
                source: "ClusterFigma/assets/vecLaneLines.png"
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
            opacity: 1
            roughnessChannel: Material.A
            specularAmount: 0
            attenuationColor: "#363636"
            metalness: 0.03031
            transmissionFactor: 0
            roughness: 0.98066
            baseColor: "#242424"
            objectName: "Headlamp Reflection"
        }

        Texture {
            id: konzerthaus_4k
            source: "images/konzerthaus_4k.hdr"
            objectName: "Konzerthaus 4k"
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
        adasON: VehicleData.driveMode == "ADAS"
        adasOFF: true
    }

}

/*##^##
Designer {
    D{i:0;matPrevEnvDoc:"SkyBox";matPrevEnvValueDoc:"preview_studio";matPrevModelDoc:"#Sphere"}
D{i:2;cameraSpeed3d:25;cameraSpeed3dMultiplier:1}D{i:4;cameraSpeed3d:25;cameraSpeed3dMultiplier:1}
}
##^##*/
