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


        ExtendedSceneEnvironment {
            id: xsceneEnvironment
            depthOfFieldFocusRange: 120
            glowLevel: ExtendedSceneEnvironment.GlowLevel.Five
            probeOrientation.y: 130
                    depthOfFieldBlurAmount: 15
                    depthOfFieldFocusDistance: 500
                    depthOfFieldEnabled: false
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
                    tonemapMode: SceneEnvironment.TonemapModeLinear
                    temporalAAEnabled: false
                    antialiasingMode: SceneEnvironment.SSAA
                    antialiasingQuality: SceneEnvironment.Medium
        }

        Node {
            id: scene

            GenericCarModel {
                id: genericCarModel
                opacity: 1
                visible: true
               // wheelFrLeftEulerRotationy: camNull.eulerRotation.y - 40
                wheelRearRightEulerRotationx: camNull.eulerRotation.y
                wheelRearLeftEulerRotationx: camNull.eulerRotation.y
                wheelFrRightEulerRotationx: camNull.eulerRotation.y
                wheelFrLeftEulerRotationx: camNull.eulerRotation.y
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
                    x: 17.393
                    y: -91.253
                    clipFar: 3000
                    eulerRotation.z: 0
                    eulerRotation.y: 7
                    eulerRotation.x: 12
                    fieldOfView: 30
                    z: 628.26337
                }
            }

            Model {
                id: cylinder
                x: -807.69
                y: 0
                opacity: 1
                visible: false
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
        ySpeed: 0
        xSpeed: 0.1
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
            name: "xray"

            PropertyChanges {
                target: genericCarModel
                optionalVizOpacity: 0.01
                extSheetOpacity: 0.02
            }
        }]
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
D{i:2;cameraSpeed3d:25;cameraSpeed3dMultiplier:1}D{i:39;transitionDuration:2000}
}
##^##*/
