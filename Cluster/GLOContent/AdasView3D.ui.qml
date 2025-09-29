import Generated.QtQuick3D.GenericCarModel
import Generated.QtQuick3D.Lights
import QtQuick 6.7
import QtQuick3D 6.7
import QtQuick3D.Helpers 6.7
import VehicleData 1.0
import GLO 1.0

View3D {
    id: view3D
    width: 580
    height: 720
    state: "adasOFF"
    camera: sceneCamera
    environment: extendedSceneEnvironment



    
    ExtendedSceneEnvironment {
        id: extendedSceneEnvironment
        probeOrientation.x: 60
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
        glowHDRMaximumValue: 79.64209
        glowHDRScale: 2.40928
        probeExposure: 40
        glowHDRMinimumValue: 0
        glowBloom: 0.38
        glowQualityHigh: true
        glowIntensity: 0.28793
        glowStrength: 0.93527
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
            eulerRotation.y: 179.99997
            ambientColor: "#666666"
            brightness: 1
            z: -790.60999
        }
        
        DirectionalLight {
            id: directionalLightLane
            x: 0
            y: 208.28
            visible: true
            color: "#e6e6e6"
            z: 528.37
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
            y: 1039.61
            eulerRotation.y: 0.00001
            eulerRotation.z: 0.00001
            eulerRotation.x: -58
            fieldOfView: 30
            z: 613.42877
        }
        
        Lights {
            id: lights
            x: 0
            y: 0
            visible: true
            lightOn: VehicleData.lights
            z: -3.24378
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
            x: -0.001
            y: -230.521
            visible: true
            source: "#Rectangle"
            eulerRotation.z: -90
            eulerRotation.y: 0.00002
            eulerRotation.x: -70
            z: -1197.22327
            materials: laneLines
            receivesReflections: true
            castsReflections: false
            receivesShadows: false
            castsShadows: false
            scale.y: 2
            scale.x: 16
        }
        

        
        
    }

    Item {
        id: __materialLibrary__
    }
    states: [
        State {
            name: "adasOFF"
            when: VehicleData.adasOFF

            PropertyChanges {
                target: lanePlane
                opacity: 0
            }

            PropertyChanges {
                target: extendedSceneEnvironment
                glowStrength: 0.08833
                glowEnabled: false
                lensFlareStretchToAspect: 0.02628
                lensFlareHaloWidth: 0.01221
                lensFlareBloomBias: 0.08962
                lensFlareBloomScale: 0.15506
                lensFlareEnabled: false
            }
        },
        State {
            name: "adasON"
            when: VehicleData.adasON

            PropertyChanges {
                target: sceneCamera
                x: -0
                y: 284.367
                eulerRotation.z: 0.00001
                eulerRotation.y: 0.00001
                eulerRotation.x: -15
                z: 871.33844
            }

            PropertyChanges {
                target: lanePlane
                x: -0
                y: -2.207
                opacity: 1
                z: -277.53656
                scale.y: 3.4
                eulerRotation.x: -90
                eulerRotation.z: 0
                eulerRotation.y: -89.99995
            }

            PropertyChanges {
                target: directionalLight
                brightness: 2
            }

            PropertyChanges {
                target: extendedSceneEnvironment
                probeOrientation.x: 0
                glowIntensity: 0.25067
                glowBloom: 0.16449
                glowStrength: 0.5532
                glowEnabled: false
            }
        }
    ]
    transitions: [
        Transition {
            id: transition
            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 0
                    }

                    PropertyAnimation {
                        target: sceneCamera
                        property: "eulerRotation.x"
                        duration: 650
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 0
                    }

                    PropertyAnimation {
                        target: sceneCamera
                        property: "eulerRotation.y"
                        duration: 650
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 0
                    }

                    PropertyAnimation {
                        target: sceneCamera
                        property: "eulerRotation.z"
                        duration: 650
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 0
                    }

                    PropertyAnimation {
                        target: sceneCamera
                        property: "x"
                        duration: 650
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 0
                    }

                    PropertyAnimation {
                        target: sceneCamera
                        property: "y"
                        duration: 650
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 0
                    }

                    PropertyAnimation {
                        target: sceneCamera
                        property: "z"
                        duration: 650
                    }
                }
            }

            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 0
                    }

                    PropertyAnimation {
                        target: lanePlane
                        property: "opacity"
                        duration: 1099
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 0
                    }

                    PropertyAnimation {
                        target: lanePlane
                        property: "eulerRotation.x"
                        duration: 641
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 0
                    }

                    PropertyAnimation {
                        target: lanePlane
                        property: "eulerRotation.y"
                        duration: 641
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 0
                    }

                    PropertyAnimation {
                        target: lanePlane
                        property: "eulerRotation.z"
                        duration: 641
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 0
                    }

                    PropertyAnimation {
                        target: lanePlane
                        property: "scale.y"
                        duration: 641
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
    D{i:0;cameraSpeed3d:25;cameraSpeed3dMultiplier:1}D{i:2;cameraSpeed3d:25;cameraSpeed3dMultiplier:1}
D{i:19;transitionDuration:2000}
}
##^##*/
