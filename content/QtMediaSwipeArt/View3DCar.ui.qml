import QtQuick 6.5
import QtQuick.Controls 6.5
import QtQuick3D 6.5
import QtQuick3D.Effects 6.5
import Quick3DAssets.GenericCarModel
import Quick3DAssets.Lights
import QtQuick3D.Helpers 6.5
import Data 1.0 as Data

View3D {
    id: view3DCar
    anchors.fill: parent
    environment: extendedSceneEnvironment
    camera: perspectiveCamera


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
        id: extendedSceneEnvironment
        probeHorizon: 0.1
        tonemapMode: SceneEnvironment.TonemapModeLinear
        glowUseBicubicUpscale: true
        glowLevel: ExtendedSceneEnvironment.GlowLevel.One
                   | ExtendedSceneEnvironment.GlowLevel.Two
                   | ExtendedSceneEnvironment.GlowLevel.Three
                   | ExtendedSceneEnvironment.GlowLevel.Four
                   | ExtendedSceneEnvironment.GlowLevel.Six
        glowBlendMode: ExtendedSceneEnvironment.GlowBlendMode.Additive
        depthOfFieldEnabled: false
        aoEnabled: true
        glowHDRMaximumValue: 13.4
        glowHDRScale: 1.31
        probeExposure: 6
        glowHDRMinimumValue: 0
        glowBloom: 0.09
        glowQualityHigh: true
        glowIntensity: 1.34
        glowStrength: 1.15
        lensFlareEnabled: false
        glowEnabled: true
        ditheringEnabled: false
        exposure: 1.3
        lightProbe: basicLights3_4K
        temporalAAStrength: 2
        specularAAEnabled: false
        temporalAAEnabled: false
        fxaaEnabled: false
        antialiasingQuality: SceneEnvironment.Medium
        antialiasingMode: SceneEnvironment.NoAA
        backgroundMode: SceneEnvironment.Color
    }



    Node {
        id: scene


        GenericCarModel {
            id: genericCarModel
            opacity: 1
            wheelCaliper_materialBaseColor: Data.Themes.themeColor1
            wheelRimColor_materialBaseColor: Data.Themes.themeColor2
            carPaint_materialBaseColor: Data.Themes.themeColor1
            doorsOpen: true
            scale.z: 100
            scale.y: 100
            scale.x: 100
        }



        Model {
            id: groundPlane
            x: -0.908
            y: -7.374
            opacity: 1
            visible: true
            source: "#Rectangle"
            usedInBakedLighting: false
            receivesShadows: true
            z: 0.00008
            castsShadows: false
            castsReflections: false
            receivesReflections: true
            scale.z: 9
            scale.y: 5
            scale.x: 6
            eulerRotation.z: 90
            eulerRotation.y: 180.00005
            eulerRotation.x: -90
            materials: eqFloorMat
        }

        Model {
            id: shadowPlane
            y: 1
            visible: true
            source: "#Rectangle"
            receivesReflections: true
            eulerRotation.z: 90
            eulerRotation.x: -90
            eulerRotation.y: 180
            materials: shadowMaterial
            castsReflections: false
            receivesShadows: true
            castsShadows: false
            scale.y: 3.2
            scale.x: 6.5
        }


        Lights {
            id: lights
            lightOn: true
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
            ambientColor: "#ffffff"
            brightness: 0.2
            eulerRotation.z: 114.08686
            eulerRotation.y: -128.0842
            eulerRotation.x: -50.80216
            z: -618.60547
        }


        ReflectionProbe {
            id: reflectionProbe
            x: 0
            y: -993.322
            clearColor: "#00000000"
            z: 0
            quality: ReflectionProbe.High
            parallaxCorrection: true
            debugView: false
            boxSize.z: 2000
            boxSize.y: 2000
            boxSize.x: 2000
        }

        Model {
            id: camNull
            source: "#Sphere"
            castsReflections: false
            receivesShadows: false
            castsShadows: false
            eulerRotation.z: 0
            eulerRotation.x: -20
            eulerRotation.y: 37

            PerspectiveCamera {
                id: perspectiveCamera
                eulerRotation.z: 0
                eulerRotation.y: 10
                eulerRotation.x: 3
                fieldOfView: 45
                z: 472
            }
        }
    }

    Item {
        id: __materialLibrary__

        PrincipledMaterial {
            id: shadowMaterial
            metalness: 0.42756
            baseColorMap: floorOpacity
            lighting: PrincipledMaterial.NoLighting
            opacityMap: floorOpacity
            baseColor: "#ef000000"
            objectName: "New Material"

            Texture {
                id: floorOpacity
                source: "../images/floorOpacity.png"
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
            baseColor: "#b9b9b9"

            Texture {
                id: customeqFloor
                generateMipmaps: true
                mappingMode: Texture.UV
                sourceItem: eqBars
                flipU: false
                flipV: false
                scaleV: 1
                scaleU: 1
            }
        }

        Texture {
            id: basicLights3_4K
            source: "../images/BasicLights3_4K.hdr"
        }
    }


    states: [
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
                eulerRotation.z: -1
                eulerRotation.x: 6
                eulerRotation.y: 7
                fieldOfView: 47
            }

            PropertyChanges {
                target: genericCarModel
                doorsOpen: false
            }


        },
        State {
            name: "front"

            PropertyChanges {
                target: camNull
                opacity: 0
                eulerRotation.z: 0.00001
                eulerRotation.y: 0
                eulerRotation.x: -10
                materials: shadowMaterial
            }

            PropertyChanges {
                target: perspectiveCamera
                eulerRotation.y: 5
                eulerRotation.x: 3
                fieldOfView: 40
            }

            PropertyChanges {
                target: genericCarModel
                doorsOpen: false
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
                eulerRotation.z: 0
                eulerRotation.x: 6
                eulerRotation.y: 3
            }

            PropertyChanges {
                target: genericCarModel
                doorsOpen: true
            }
        }
    ]
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
    D{i:0}D{i:33;transitionDuration:2000}
}
##^##*/
