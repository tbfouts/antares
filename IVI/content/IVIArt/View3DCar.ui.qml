import QtQuick 6.5
import QtQuick.Controls 6.5
import QtQuick3D 6.5
import QtQuick3D.Effects 6.5
import Quick3DAssets.GenericCarModel
import Quick3DAssets.Lights
import QtQuick3D.Helpers 6.5
import Data 1.0 as Data
import QtQuick.Timeline 1.0

View3D {
    id: view3DCar
    anchors.fill: parent
    property alias doorL: genericCarModel.doorsOpenLeft
    property alias doorR: genericCarModel.doorsOpenRight
        state: "base"
        environment: xsceneEnvironment
        camera: perspectiveCamera
        property alias lightsVisible: lights.visible


        SceneEnvironment {
            id: sceneEnvironment
            clearColor: "#000000"
            antialiasingQuality: SceneEnvironment.VeryHigh
            antialiasingMode: SceneEnvironment.SSAA
            probeExposure: 20
            aoEnabled: false
            backgroundMode: SceneEnvironment.Color
            lightProbe: basicLights3_4K
        }

        ExtendedSceneEnvironment {
            id: xsceneEnvironment
            depthOfFieldFocusRange: 120
            glowLevel: ExtendedSceneEnvironment.GlowLevel.Five
            probeOrientation.y: 130
                    depthOfFieldBlurAmount: 15
                    depthOfFieldFocusDistance: 500
                    depthOfFieldEnabled: true
                    adjustmentContrast: 1
                    adjustmentBrightness: 1
                    colorAdjustmentsEnabled: false
                    ditheringEnabled: false
                    sharpnessAmount: 0
                    whitePoint: 1
                    probeExposure: 2
                    probeHorizon: 0.5
                    lightProbe: konzerthaus_4k
                    aoDither: false
                    aoSampleRate: 4
                    aoSoftness: 0
                    lutEnabled: false
                    exposure: 1.38999
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
                    glowHDRMinimumValue: 3
                    glowHDRMaximumValue: 5
                    glowHDRScale: 1
                    glowBloom: 0
                    glowIntensity: 0.001
                    glowStrength: 1.9
                    glowQualityHigh: true
                    glowEnabled: true
                    fxaaEnabled: true
                    clearColor: "#191919"
                    depthPrePassEnabled: true
                    aoDistance: 0
                    aoEnabled: false
                    backgroundMode: SceneEnvironment.Transparent
                    specularAAEnabled: true
                    tonemapMode: SceneEnvironment.TonemapModeLinear
                    temporalAAEnabled: false
                    antialiasingMode: SceneEnvironment.SSAA
                    antialiasingQuality: SceneEnvironment.Medium

        }


        // ExtendedSceneEnvironment {
        //     id: extendedSceneEnvironment
        //     clearColor: Data.Themes.backgroundColor
        //     vignetteEnabled: false
        //     skyboxBlurAmount: 0.35753
        //     probeHorizon: 0.1
        //     tonemapMode: SceneEnvironment.TonemapModeLinear
        //     glowUseBicubicUpscale: true
        //     glowLevel: ExtendedSceneEnvironment.GlowLevel.One
        //                | ExtendedSceneEnvironment.GlowLevel.Two
        //                | ExtendedSceneEnvironment.GlowLevel.Three
        //                | ExtendedSceneEnvironment.GlowLevel.Four
        //                | ExtendedSceneEnvironment.GlowLevel.Six
        //     glowBlendMode: ExtendedSceneEnvironment.GlowBlendMode.Additive
        //     depthOfFieldEnabled: false
        //     aoEnabled: true
        //     glowHDRMaximumValue: 13.4
        //     glowHDRScale: 1.31
        //     probeExposure: 2
        //     glowHDRMinimumValue: 0
        //     glowBloom: 0.09
        //     glowQualityHigh: true
        //     glowIntensity: 1.1
        //     glowStrength: 1
        //     lensFlareEnabled: false
        //     glowEnabled: true
        //     ditheringEnabled: false
        //     exposure: 1.3
        //     lightProbe: basicLights3_4K
        //     temporalAAStrength: 2
        //     specularAAEnabled: false
        //     temporalAAEnabled: false
        //     fxaaEnabled: true
        //     antialiasingQuality: SceneEnvironment.VeryHigh
        //     antialiasingMode: SceneEnvironment.MSAA
        //     backgroundMode: SceneEnvironment.Transparent
        // }

        Node {
            id: scene

            GenericCarModel {
                id: genericCarModel
                opacity: 1
                visible: true
                doorsOpenLeft: false
                doorsOpenRight: false
                wheelCaliper_materialBaseColor: Data.Themes.themeColor1
                wheelRimColor_materialBaseColor: Data.Themes.themeColor2
                carPaint_materialBaseColor: Data.Themes.themeColor1
                scale.z: 100
                scale.y: 100
                scale.x: 100
            }

            Model {
                id: groundPlaneA
                x: 0
                y: 0
                opacity: 1
                visible: true
                source: "#Rectangle"
                z: -0.00007
                usedInBakedLighting: false
                scale.z: 7
                scale.y: 4
                scale.x: 5
                receivesShadows: true
                receivesReflections: true
                eulerRotation.z: 90
                eulerRotation.y: 0
                eulerRotation.x: -90
                castsShadows: false
                castsReflections: false
            }

            Model {
                id: shadowPlane
                y: 3
                opacity: 0.676
                visible: true
                source: "#Rectangle"
                scale.z: 1
                receivesReflections: true
                eulerRotation.z: 90
                eulerRotation.x: -90
                eulerRotation.y: 180
                materials: shadowMaterial
                castsReflections: false
                receivesShadows: true
                castsShadows: false
                scale.y: 3.1
                scale.x: 6.6528
            }

            Lights {
                id: lights
                visible: true
                lightOn: Data.Values.lamps
                scale.z: 100
                scale.y: 100
                scale.x: 100
            }

            DirectionalLight {
                id: directionalLight
                x: -0
                y: 454.668
                visible: true
                color: "#a1a1a1"
                scope: cylinder
                ambientColor: "#ffffff"
                brightness: 0.16
                eulerRotation.z: 114.08686
                eulerRotation.y: -128.0842
                eulerRotation.x: -50.80216
                z: -618.60547
            }

            // ReflectionProbe {
            //     id: reflectionProbe
            //     x: 0
            //     y: -993.322
            //     clearColor: "#00000000"
            //     z: 0
            //     quality: ReflectionProbe.High
            //     parallaxCorrection: true
            //     debugView: false
            //     boxSize.z: 2000
            //     boxSize.y: 2000
            //     boxSize.x: 2000
            // }

            Model {
                id: camNull
                y: 3.118
                source: "#Sphere"
                castsReflections: false
                receivesShadows: false
                castsShadows: false
                eulerRotation.z: 1
                eulerRotation.x: -18.32633
                eulerRotation.y: 36

                PerspectiveCamera {
                    id: perspectiveCamera
                    x: 6.321
                    y: -85.846
                    clipFar: 3000
                    eulerRotation.z: 0
                    eulerRotation.y: 7
                    eulerRotation.x: 12
                    fieldOfView: 30
                    z: 603.9931
                }
            }

            Model {
                id: cylinder
                x: -807.69
                y: 0
                opacity: 1
                source: "#Cylinder"
                eulerRotation.z: -0.00001
                eulerRotation.y: -34.99999
                eulerRotation.x: 0
                pivot.y: -50
                scale.z: 2.1
                scale.y: 4
                scale.x: 1
                materials: eq3DBar_1
                z: -632.18176
            }

}

    Item {
        id: __materialLibrary__

        PrincipledMaterial {
            id: shadowMaterial
            opacity: 1
            alphaMode: PrincipledMaterial.Opaque
            opacityChannel: Material.A
            baseColorMap: floorOpacity
            lighting: PrincipledMaterial.NoLighting
            opacityMap: floorOpacity
            baseColor: "#ef000000"
            objectName: "New Material"

            Texture {
                id: floorOpacity
                source: "../images/floorOpacity.png"
                positionU: 0.01
                positionV: 0
            }
        }

        PrincipledMaterial {
            id: eqFloorMat
            opacity: 0.554
            blendMode: PrincipledMaterial.Screen
            occlusionMap: customeqFloor
            lighting: PrincipledMaterial.FragmentLighting
            metalness: 0.23094
            baseColorMap: customeqFloor
            opacityMap: customeqFloor
            attenuationColor: "#ffffff"
            objectName: "New Material"
            baseColor: "#e5e5e5"

            Texture {
                id: customeqFloor
                positionV: -2
                scaleV: 2
                scaleU: 1
                flipU: true
                flipV: false
                tilingModeHorizontal: Texture.MirroredRepeat
                tilingModeVertical: Texture.MirroredRepeat
                autoOrientation: false
                generateMipmaps: false
                sourceItem: eqBars
            }
        }

        Texture {
            id: basicLights3_4K
            source: "../images/BasicLights3_4K.hdr"
        }

        PrincipledMaterial {
            id: doorsOpen
            opacity: 0.578
            baseColorMap: doowSwitchTxtre
            lighting: PrincipledMaterial.NoLighting
            roughness: 1
            baseColor: "#343434"
            blendMode: PrincipledMaterial.Screen
            objectName: "doorsOpen"

            Texture {
                id: doowSwitchTxtre
                sourceItem: doorSwitch
            }
        }

        DefaultMaterial {
            id: switchMat
            diffuseColor: "#ffffff"
            objectName: "switchMat"

        }

        Texture {
            id: konzerthaus_4k
            source: "../images/konzerthaus_4k.hdr"
            objectName: "Konzerthaus 4k"
        }

        PrincipledMaterial {
            id: eq3DBar_1
            clearcoatAmount: 0.59356
            roughness: 0.47091
            baseColor: Data.Themes.themeColor3
            objectName: "eq3DBar_1"
        }
    }

    OrbitCameraController {
        id: orbitCameraController
        x: 378
        y: 242
        width: 1534
        height: 830
        visible: true
        panEnabled: false
        yInvert: true
        camera: perspectiveCamera
        origin: camNull
    }

    Timeline {
        id: timelineBARS
        animations: [
            TimelineAnimation {
                id: animBars
                duration: Data.Themes.trackSpeed
                running: true
                loops: -1
                to: 1000
                from: 0
            }
        ]
        startFrame: 0
        endFrame: 1000
        enabled: true

        KeyframeGroup {
            target: cylinder
            property: "scale.y"
            Keyframe {
                value: 2
                frame: 0
            }

            Keyframe {
                value: 3
                frame: 1000
            }

            Keyframe {
                value: 4
                frame: 583
            }

            Keyframe {
                value: 2.5
                frame: 229
            }

            Keyframe {
                value: 1.8
                frame: 737
            }
        }

        KeyframeGroup {
            target: cylinder
            property: "scale"
        }
    }

    states: [
        State {
            name: "base"

            PropertyChanges {
                target: timelineBARS
                enabled: true
            }

            PropertyChanges {
                target: animBars
                running: true
            }

            PropertyChanges {
                target: cylinder
                x: -1521.955
                y: -0
                z: -1132.31543
            }
        },

        State {
            name: "side"

            PropertyChanges {
                target: camNull
                eulerRotation.z: 0.88047
                eulerRotation.x: -9.96158
                eulerRotation.y: 86.92
            }

            PropertyChanges {
                target: perspectiveCamera
                x: -62.801
                y: -8.819
                z: 546.85822
                eulerRotation.z: -1
                eulerRotation.x: 6
                eulerRotation.y: 7
            }

            PropertyChanges {
                target: timelineBARS
                enabled: true
            }

            PropertyChanges {
                target: animBars
                running: true
            }


        },
        State {
            name: "front"

            PropertyChanges {
                target: camNull
                opacity: 0
                materials: shadowMaterial
            }

            PropertyChanges {
                target: timelineBARS
                enabled: true
            }

            PropertyChanges {
                target: animBars
                running: true
            }
        },
        State {
            name: "rear"

            PropertyChanges {
                target: camNull
                eulerRotation.z: 0.00001
                eulerRotation.y: 153
                eulerRotation.x: -15
            }

            PropertyChanges {
                target: view3DCar
                camera: perspectiveCamera
            }

            PropertyChanges {
                target: perspectiveCamera
                x: 1.363
                y: -32.687
                z: 609.60693
                eulerRotation.z: 0
                eulerRotation.x: 6
                eulerRotation.y: 3
            }

            PropertyChanges {
                target: cylinder
                y: 48.852
                materials: shadowMaterial
            }

            PropertyChanges {
                target: timelineBARS
                enabled: true
            }

            PropertyChanges {
                target: animBars
                running: true
            }
        }    ]
    transitions: [
        Transition {
            id: transition
            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: genericCarModel
                        property: "carPaint_materialBaseColor"
                        duration: 150
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: genericCarModel
                        property: "wheelCaliper_materialBaseColor"
                        duration: 150
                    }
                }
            }

            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: perspectiveCamera
                        property: "eulerRotation.x"
                        duration: 761
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: perspectiveCamera
                        property: "eulerRotation.y"
                        duration: 761
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: perspectiveCamera
                        property: "eulerRotation.z"
                        duration: 761
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: perspectiveCamera
                        property: "fieldOfView"
                        duration: 761
                    }
                }
            }

            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }
                }
            }

            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: camNull
                        property: "eulerRotation.x"
                        duration: 761
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: camNull
                        property: "eulerRotation.y"
                        duration: 761
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: camNull
                        property: "eulerRotation.z"
                        duration: 761
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: camNull
                        property: "opacity"
                        duration: 761
                    }
                }
            }
            to: "*"
            from: "*"
        }
    ]
}


/*##^##
Designer {
    D{i:0;matPrevEnvDoc:"SkyBox";matPrevEnvValueDoc:"preview_studio";matPrevModelDoc:"#Sphere"}
D{i:3;cameraSpeed3d:25;cameraSpeed3dMultiplier:1}D{i:56;transitionDuration:2000}
}
##^##*/
