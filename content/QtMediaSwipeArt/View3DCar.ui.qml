import QtQuick 6.5
import QtQuick.Controls 6.5
import QtQuick3D 6.5
import QtQuick3D.Effects 6.5
import Quick3DAssets.GenericCarModel
import Quick3DAssets.Lights
import QtQuick3D.Helpers 6.5
import Data 1.0 as Data

// Rectangle {
//     id: car
//     width: 1920
//     height: 1080

View3D {
    id: view3DCar
    anchors.fill: parent
    property alias doorL: genericCarModel.doorsOpenLeft
    property alias doorR: genericCarModel.doorsOpenRight
        state: "base"
        environment: extendedSceneEnvironment
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
            id: extendedSceneEnvironment
            vignetteEnabled: false
            skyboxBlurAmount: 0.35753
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
            probeExposure: 2
            glowHDRMinimumValue: 0
            glowBloom: 0.09
            glowQualityHigh: true
            glowIntensity: 1.3778
            glowStrength: 1.02983
            lensFlareEnabled: false
            glowEnabled: true
            ditheringEnabled: false
            exposure: 1.3
            lightProbe: basicLights3_4K
            temporalAAStrength: 2
            specularAAEnabled: false
            temporalAAEnabled: false
            fxaaEnabled: true
            antialiasingQuality: SceneEnvironment.High
            antialiasingMode: SceneEnvironment.MSAA
            backgroundMode: SceneEnvironment.Color
        }


        Node {
            id: scene



            GenericCarModel {
                id: genericCarModel
                opacity: 1
                visible: true
                doorsOpenLeft: false
                doorsOpenRight: false
                //doorsOpen: false
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
                materials: eqFloorMat
                eulerRotation.z: 90
                eulerRotation.y: 0
                eulerRotation.x: -90
                castsShadows: false
                castsReflections: false
            }


            Model {
                id: shadowPlane
                y: 3
                opacity: 0.978
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
                scale.y: 3.5
                scale.x: 7
            }




            Lights {
                id: lights
                visible: true
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
                brightness: 0.16
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
                y: 3.118
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
                    eulerRotation.y: 7
                    eulerRotation.x: 3
                    fieldOfView: 50
                    z: 472
                }
            }

            // Model {
            //     visible: false
            //     eulerRotation.y: 90
            //     pickable: true

            //     Node {
            //       position: Qt.vector3d(0, 60, 120)
            //       scale.y: 0.6
            //       scale.x: 0.5

            //         Switch {
            //             id: doorSwitch3D
            //             opacity: 1
            //             visible: false
            //             anchors.centerIn: parent
            //             //checked: false

            //                 Connections {
            //                     target: doorSwitch3D
            //                     onToggled: {
            //                         if (view3DCar.genericCarModelDoorsOpen === true)
            //                             view3DCar.genericCarModelDoorsOpen = false
            //                         else if (view3DCar.genericCarModelDoorsOpen === false)
            //                             view3DCar.genericCarModelDoorsOpen = true
            //                     }
            //                 }
            //         }
            //     }
            // }
 //   }


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
            baseColor: "#b9b9b9"

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

    states: [
        State {
            name: "base"
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
                eulerRotation.z: -1
                eulerRotation.x: 6
                eulerRotation.y: 7
            }


        },
        State {
            name: "front"

            PropertyChanges {
                target: camNull
                opacity: 0
                eulerRotation.z: 0.00001
                eulerRotation.y: 23
                eulerRotation.x: -24
                materials: shadowMaterial
            }

            PropertyChanges {
                target: perspectiveCamera
                eulerRotation.y: 5
                eulerRotation.x: 3
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
    D{i:0}D{i:3;cameraSpeed3d:25;cameraSpeed3dMultiplier:1}D{i:36;transitionDuration:2000}
}
##^##*/
