import QtQuick
import QtQuick3D
import QtQuick.Studio.Components 1.0

Node {
    id: node
    property alias carPaint_materialBaseColor: body_material.baseColor
    property bool doorsOpenLeft: false
    property bool doorsOpenRight: false
    property alias wheelRimColor_materialBaseColor: wheelRimColor_material.baseColor
    property alias wheelCaliper_materialBaseColor: wheelCaliper_material.baseColor
    property alias wheelFrLeftEulerRotationx: wheelFrLeft.eulerRotation.x
    property alias wheelFrRightEulerRotationx: wheelFrRight.eulerRotation.x
    property alias wheelRearLeftEulerRotationx: wheelRearLeft.eulerRotation.x
    property alias wheelRearRightEulerRotationx: wheelRearRight.eulerRotation.x
    property alias wheelFrLeftEulerRotationy: wheelFrLeft.eulerRotation.y
    property alias wheelFrRightEulerRotationy: wheelFrRight.eulerRotation.y
    property alias extSheetOpacity: extSheet.opacity
    property alias optionalVizOpacity: optionalViz.opacity
    property alias glassTextured_materialMetalness: glassTextured_material.metalness
    property alias glassTextured_materialRoughness: glassTextured_material.roughness
    property alias glassTextured_materialOpacity: glassTextured_material.opacity
    property alias headlightsVisible: headlights.visible
    property alias taillightsVisible: taillights.visible
    state: "closed"
    scale.z: 1
    scale.y: 1
    scale.x: 1

    // Nodes:
    Node {
        id: car
        scale.z: 1
        scale.y: 1
        scale.x: 1
        objectName: "Car"

        Node {
            id: extSheet
            visible: true

            Model {
                id: body
                objectName: "Body"
                y: 0.6449694037437439
                visible: true
                scale.x: 0.001
                scale.y: 0.001
                scale.z: 0.001
                source: "meshes/body_mesh.mesh"
                materials: [body_material,carPaintBlackBump_material,metalDark_material,plasticBlack_material,chrome_material,glassLights_material,glassRedLights_material,glassMatRedLights_material,glassLightsIllum_material,metalBlackMatte_material,metalGreyMatte_material,rubber_material,glassTextured_material,intCarpet_material,glassFrontGrill_material]
            }

            Model {
                id: hood
                objectName: "Hood"
                y: 0.7891814708709717
                visible: true
                z: 0.6023856401443481
                scale.x: 0.001
                scale.y: 0.001
                scale.z: 0.001
                source: "meshes/hood_mesh.mesh"
                receivesReflections: true
                castsReflections: true
                receivesShadows: true
                castsShadows: true
                materials: [body_material,plasticBlack_material,chrome_material,glassLightsIllum_material,rubber_material]
            }

            Model {
                id: doorRight
                objectName: "DoorRight"
                x: -0.8845332264900208
                y: 0.6892746090888977
                visible: true
                z: 0.8587785363197327
                scale.x: 0.001
                scale.y: 0.001
                scale.z: 0.001
                source: "meshes/doorRight_mesh.mesh"
                materials: [body_material,metalDark_material,plasticBlack_material,chrome_material,glassLights_material,plasticBlack_001_material,plasticBlack_001_material,chromeLightsBMP_material,glassLightsIllum_material,metalBlackMatte_material,metalMirror_material,aluminium_material,glassTextured_material,intAlcanataraGrey_material,intLeatherBlack_material,intStitchesRed_material,intLeatherBlack_material,intButtons_material,intGrillBump_material]
            }

            Model {
                id: doorLeft
                objectName: "DoorLeft"
                x: 0.8845329880714417
                y: 0.6892746090888977
                visible: true
                z: 0.8587785363197327
                scale.x: 0.001
                scale.y: 0.001
                scale.z: 0.001
                source: "meshes/doorLeft_mesh.mesh"
                materials: [body_material,metalDark_material,plasticBlack_material,chrome_material,glassLights_material,plasticBlack_001_material,plasticBlack_001_material,chromeLightsBMP_material,glassLightsIllum_material,metalBlackMatte_material,metalMirror_material,aluminium_material,glassTextured_material,intAlcanataraGrey_material,intLeatherBlack_material,intStitchesRed_material,intLeatherBlack_material,intButtons_material,intGrillBump_material]
            }

        }

        Node {
            id: optionalViz
            visible: true

            Model {
                id: brakeCaliperFrLeft
                objectName: "BrakeCaliperFrLeft"
                x: 0.849
                y: 0.352
                z: 1.28482
                scale.x: 0.001
                scale.y: 0.001
                scale.z: 0.001
                source: "meshes/brakeCaliperFrLeft_mesh.mesh"
                materials: [
                    wheelPlasticBlackBolt_material,
                    wheelCaliper_material
                ]
            }

            Model {
                id: brakeCaliperFrRight
                objectName: "BrakeCaliperFrRight"
                x: -0.8492887616157532
                y: 0.352143794298172
                z: 1.2830318212509155
                scale.x: 0.001
                scale.y: 0.001
                scale.z: 0.001
                source: "meshes/brakeCaliperFrRight_mesh.mesh"
                materials: [
                    wheelPlasticBlackBolt_material,
                    wheelCaliper_material
                ]
            }

            Model {
                id: brakeCaliperRearRight
                objectName: "BrakeCaliperRearRight"
                x: -0.8785426020622253
                y: 0.35214540362358093
                z: -1.3741967678070068
                scale.x: 0.001
                scale.y: 0.001
                scale.z: 0.001
                source: "meshes/brakeCaliperRearRight_mesh.mesh"
                materials: [
                    wheelPlasticBlackBolt_material,
                    wheelCaliper_material
                ]
            }

            Model {
                id: brakeDiskFrLeft
                objectName: "BrakeDiskFrLeft"
                x: 0.8323532342910767
                y: 0.3521454930305481
                z: 1.2830322980880737
                scale.x: 0.001
                scale.y: 0.001
                scale.z: 0.001
                source: "meshes/brakeDiskFrLeft_mesh.mesh"
                materials: [
                    wheelBrakeDisk_material,
                    wheelPlasticBlackBolt_material
                ]
            }

            Model {
                id: brakeDiskFrRight
                objectName: "BrakeDiskFrRight"
                x: -0.8323530554771423
                y: 0.3521454930305481
                z: 1.2830322980880737
                scale.x: 0.001
                scale.y: 0.001
                scale.z: 0.001
                source: "meshes/brakeDiskFrRight_mesh.mesh"
                materials: [
                    wheelTireBump_material,
                    wheelBrakeDisk_material
                ]
            }

            Model {
                id: brakeDiskRearLeft
                objectName: "BrakeDiskRearLeft"
                x: 0.8620924949645996
                y: 0.3521454632282257
                z: -1.3741974830627441
                scale.x: 0.001
                scale.y: 0.001
                scale.z: 0.001
                source: "meshes/mesh_016_mesh.mesh"
                materials: [
                    wheelBrakeDisk_material
                ]
            }

            Model {
                id: brakeDiskRearRight
                objectName: "BrakeDiskRearRight"
                x: -0.8614482283592224
                y: 0.3521454632282257
                z: -1.374197244644165
                scale.x: 0.001
                scale.y: 0.001
                scale.z: 0.001
                source: "meshes/brakeDiskRearRight_mesh.mesh"
                materials: [
                    wheelBrakeDisk_material,
                    wheelPlasticBlackBolt_material
                ]
            }

            Model {
                id: chargingCap
                objectName: "ChargingCap"
                y: 1.004989743232727
                z: -1.5241049528121948
                scale.x: 0.001
                scale.y: 0.001
                scale.z: 0.001
                source: "meshes/chargingCap_mesh.mesh"
                eulerRotation.x: -67
                materials: [body_material,plasticBlack_material]
            }

            Model {
                id: headlights
                objectName: "Headlights"
                y: 0.5664713978767395
                z: 1.7861577272415161
                scale.x: 0.001
                scale.y: 0.001
                scale.z: 0.001
                source: "meshes/headlights_mesh.mesh"
                materials: [
                    metalDark_material,
                    plasticBlack_material,
                    chrome_material,
                    glassLights_material,
                    chromeLightsBMP_material,
                    glassLightsLens_material
                ]
            }

            Model {
                id: hoodEngineCover
                objectName: "HoodEngineCover"
                y: 0.5375130772590637
                visible: true
                z: 1.4772337675094604
                scale.x: 0.001
                scale.y: 0.001
                scale.z: 0.001
                source: "meshes/hoodEngineCover_mesh.mesh"
                materials: [
                    plasticBlack_material,
                    intCarpet_material
                ]
            }

            Model {
                id: suspension
                objectName: "Suspension"
                y: 0.41297996044158936
                z: 0.16267994046211243
                scale.x: 0.001
                scale.y: 0.001
                scale.z: 0.001
                source: "meshes/suspension_mesh.mesh"
                materials: [
                    metalDark_material,
                    plasticBlack_material,
                    chrome_material,
                    metalBlackMatte_material,
                    metalGreyMatte_material,
                    aluminium_material
                ]
            }

            Model {
                id: taillights
                objectName: "Taillights"
                y: 0.7833704948425293
                opacity: 1
                visible: true
                z: -1.7988189458847046
                scale.x: 0.001
                scale.y: 0.001
                scale.z: 0.001
                source: "meshes/taillights_mesh.mesh"
                materials: [
                    //   plasticBlack_material,
                    chrome_material,
                    glassRedLights_material,
                    // glassMatRedLights_material,
                    // tailLightsIllum_material
                ]
            }

            Model {
                id: trunkEngineCover
                objectName: "TrunkEngineCover"
                y: 0.7631296515464783
                z: -0.810766875743866
                scale.x: 0.001
                scale.y: 0.001
                scale.z: 0.001
                source: "meshes/trunkEngineCover_mesh.mesh"
                materials: [
                    plasticBlack_material,
                    intCarpet_material
                ]
            }

            Model {
                id: trunkLid
                objectName: "TrunkLid"
                y: 1.1552858352661133
                z: -0.5674706697463989
                scale.x: 0.001
                scale.y: 0.001
                scale.z: 0.001
                source: "meshes/trunkLid_mesh.mesh"
                materials: [body_material,carPaintBlackBump_material,metalDark_material,plasticBlack_material,metalBlackMatte_material,rubber_material]
            }

            Model {
                id: wheelFrLeft
                objectName: "WheelFrLeft"
                x: 0.8289999961853027
                y: 0.3521454632282257
                z: 1.2830322980880737
                scale.x: 0.001
                scale.y: 0.001
                scale.z: 0.001
                source: "meshes/wheelFrLeft_mesh.mesh"
                materials: [rubber_001_material,wheelRimBlack_material,wheelRimAlum_material,wheelRimColor_material]
            }

            Model {
                id: wheelFrRight
                objectName: "WheelFrRight"
                x: -0.8290001153945923
                y: 0.3521454632282257
                z: 1.2830322980880737
                scale.x: 0.001
                scale.y: 0.001
                scale.z: 0.001
                source: "meshes/wheelFrRight_mesh.mesh"
                materials: [
                    wheelTireBump_material,
                    wheelRimBlack_material,
                    wheelRimAlum_material,
                    wheelRimColor_material
                ]
            }

            Model {
                id: wheelRearLeft
                objectName: "WheelRearLeft"
                x: 0.8659999966621399
                y: 0.3521454632282257
                z: -1.3748868703842163
                scale.x: 0.001
                scale.y: 0.001
                scale.z: 0.001
                source: "meshes/wheelRearLeft_mesh.mesh"
                materials: [rubber_001_material,wheelRimBlack_material,wheelRimAlum_material,wheelRimColor_material]
            }

            Model {
                id: wheelRearRight
                objectName: "WheelRearRight"
                x: -0.8660001158714294
                y: 0.3521454632282257
                z: -1.3748868703842163
                scale.x: 0.001
                scale.y: 0.001
                scale.z: 0.001
                source: "meshes/wheelRearRight_mesh.mesh"
                materials: [
                    wheelTireBump_material,
                    wheelRimBlack_material,
                    wheelRimAlum_material,
                    wheelRimColor_material
                ]
            }

            Model {
                id: steeringWheel
                objectName: "SteeringWheel"
                x: 0.35999995470046997
                y: 0.7381047606468201
                z: 0.3709505796432495
                scale.x: 0.001
                scale.y: 0.001
                scale.z: 0.001
                source: "meshes/steeringWheel_mesh.mesh"
                materials: [
                    plasticBlack_material,
                    chrome_material,
                    intLeatherSteeringWheel_material,
                    intLeatherBlack_material,
                    intAluminiumBrushed_material,
                    intButtons_material
                ]
            }

            Model {
                id: wingFlaps
                objectName: "WingFlaps"
                y: 0.41297996044158936
                visible: true
                z: 0.16267994046211243
                scale.x: 0.001
                scale.y: 0.001
                scale.z: 0.001
                source: "meshes/mesh_014_mesh.mesh"
                materials: [
                    metalBlackMatte_material
                ]
            }




        }

        Model {
            id: engineFront
            objectName: "EngineFront"
            x: -0.0008927002199925482
            y: 0.30949828028678894
            z: 1.454201579093933
            scale.x: 0.001
            scale.y: 0.001
            scale.z: 0.001
            source: "meshes/engineFront_mesh.mesh"
            materials: [
                metalBlackMatte_material,
                aluminium_material,
                plasticOrange_material
            ]
        }

        Model {
            id: interior
            objectName: "Interior"
            y: 0.7498878240585327
            z: 0.1537650227546692
            scale.x: 0.001
            scale.y: 0.001
            scale.z: 0.001
            source: "meshes/interior_mesh.mesh"
            materials: [
                plasticBlack_material,
                chrome_material,
                metalMirror_material,
                rubber_material,
                intCarpet_material,
                intAlcanataraGrey_material,
                intLeatherBlack_material,
                intSeatBelt_material,
                intButtons_material,
                intGrillBump_material
            ]
        }

        Model {
            id: dash
            objectName: "Dash"
            y: 0.6341137886047363
            visible: true
            z: 0.24422581493854523
            scale.x: 0.001
            scale.y: 0.001
            scale.z: 0.001
            source: "meshes/dash_mesh.mesh"
            materials: [metalDark_material,plasticBlack_material,chrome_material,glassLights_material,glassRedLights_material,glassLightsIllum_material,metalBlackMatte_material,aluminium_material,rubber_material,intAlcanataraGrey_material,intLeatherBlack_material,intAluminiumBrushed_material,intStitchesRed_material,intLeatherBlack_material,intButtons_material,intTexDevices_material,intGrillBump_material]
        }

        Model {
            id: seats
            objectName: "Seats"
            y: 0.6852515935897827
            visible: false
            z: -0.17120154201984406
            scale.x: 0.001
            scale.y: 0.001
            scale.z: 0.001
            source: "meshes/seats_mesh.mesh"
            materials: [
                metalDark_material,
                plasticBlack_material,
                metalBlackMatte_material,
                aluminium_material,
                plasticRed_material,
                intLeatherPerforatedBlack_material,
                intLeatherBlack_material,
                intStitchesRed_material
            ]
        }

        Model {
            id: engineRear
            objectName: "EngineRear"
            x: -8.61505850480171e-06
            y: 0.5748811364173889
            z: -1.365947961807251
            scale.x: 0.001
            scale.y: 0.001
            scale.z: 0.001
            source: "meshes/engineRear_mesh.mesh"
            materials: [
                plasticBlack_material,
                chrome_material,
                glassLightsIllum_material,
                metalBlackMatte_material,
                aluminium_material,
                plasticOrange_material,
                plasticRed_material,
                rubber_material,
                glassBlue_material
            ]
        }




    }

    Node {
        id: __materialLibrary__

        PrincipledMaterial {
            id: wheelBrakeDisk_material
            baseColor: "#141414"
            objectName: "WheelBrakeDisk"
            metalness: 1
            roughness: 0.6000000238418579
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        DefaultMaterial {
            id: wheelTireBump_material
            specularTint: "#060606"
            bumpAmount: 1
            bumpMap: wheelBMP
            specularAmount: 0
            diffuseColor: "#0f0f0f"
            objectName: "WheelTireBump"

        }

        PrincipledMaterial {
            id: chargerPanelTex_material
            objectName: "ChargerPanelTex"
            metalness: 1
            roughness: 0.1903972625732422
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: metalCharger_material
            objectName: "MetalCharger"
            baseColor: "#ffb10000"
            metalness: 1
            roughness: 0.1284974217414856
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: plasticBlack_001_material
            objectName: "PlasticBlack.001"
            baseColor: "#ff151515"
            metalness: 1
            roughness: 0.8484283685684204
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: chrome_001_material
            objectName: "Chrome.001"
            baseColor: "#ff5a5a5a"
            metalness: 1
            roughness: 0.800000011920929
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: glassLightsIllum_001_material
            objectName: "GlassLightsIllum.001"
            baseColor: "#ffc4c4c4"
            metalness: 1
            roughness: 0.8318207263946533
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: rubber_001_material
            objectName: "Rubber.001"
            baseColor: "#ff141414"
            metalness: 0.82494
            roughness: 0.88082
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Default
        }

        PrincipledMaterial {
            id: plasticOrange_001_material
            objectName: "PlasticOrange.001"
            baseColor: "#ffc83f02"
            metalness: 1
            roughness: 0.43212437629699707
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: plasticWhiteGlossy_material
            objectName: "PlasticWhiteGlossy"
            baseColor: "#282828"
            metalness: 0.83274
            roughness: 0.06609
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: metalDark_001_material
            objectName: "MetalDark.001"
            baseColor: "#ff060606"
            metalness: 1
            roughness: 0.6750990152359009
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: aluminium_material
            objectName: "Aluminium"
            baseColor: "#ff808080"
            metalness: 0.83114
            roughness: 0.11154
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: intAlcanataraGrey_material
            clearcoatAmount: 0.05368
            baseColor: "#3d3d3d"
            objectName: "intAlcanataraGrey"
            metalness: 0.78676
            roughness: 0.13394
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: glassBlue_001_material
            roughness: 0.06608
            objectName: "GlassBlue.001"
            baseColor: "#cc0054ff"
            metalness: 1
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        // PrincipledMaterial {
        //     id: carPaint_material
        //     clearcoatFresnelPower: 0
        //     vertexColorsEnabled: false
        //     lighting: PrincipledMaterial.FragmentLighting
        //     objectName: "CarPaint"
        //     baseColor: "#ffb10000"
        //     metalness: 1
        //     roughness: 0.3875647783279419
        //     cullMode: PrincipledMaterial.NoCulling
        //     alphaMode: PrincipledMaterial.Default
        //     clearcoatAmount: 1
        // }

        PrincipledMaterial {
            id: carPaintBlackBump_material
            objectName: "CarPaintBlackBump"
            baseColor: "#ff010101"
            metalness: 1
            roughness: 0.4559585452079773
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Blend
        }

        PrincipledMaterial {
            id: intAluminiumBrushed_material
            baseColor: "#4b4b4b"
            objectName: "intAluminiumBrushed"
            metalness: 1
            roughness: 0.6000000238418579
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: metalDark_material
            objectName: "MetalDark"
            baseColor: "#ff040404"
            metalness: 1
            roughness: 0.2087777853012085
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: plasticBlack_material
            objectName: "PlasticBlack"
            baseColor: "#ff151515"
            metalness: 1
            roughness: 0.8484283685684204
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: intStitchesRed_material
            objectName: "intStitchesRed"
            baseColor: "#ff7a0000"
            metalness: 1
            roughness: 0.858578622341156
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Blend
        }

        PrincipledMaterial {
            id: chrome_material
            objectName: "Chrome"
            baseColor: "#ff5a5a5a"
            metalness: 1
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: glassLights_material
            objectName: "GlassLights"
            baseColor: "#26141313"
            metalness: 1
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Blend
        }

        PrincipledMaterial {
            id: intLeatherSeatsPattern_material
            blendMode: PrincipledMaterial.Screen
            objectName: "intLeatherSeatsPattern"
            baseColor: "#a1121212"
            metalness: 1
            roughness: 0.8197498917579651
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: glassRedLights_material
            objectName: "GlassRedLights"
            baseColor: "#80250000"
            metalness: 1
            roughness: 0.12435232847929001
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Blend
        }

        PrincipledMaterial {
            id: glassMatRedLights_material
            blendMode: PrincipledMaterial.Screen
            metalness: 0.73226
            objectName: "GlassMatRedLights"
            baseColor: "#00800000"
            roughness: 0.0555
            emissiveFactor.x: 0.5
            emissiveFactor.y: 0
            emissiveFactor.z: 0
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: intButtons_material
            baseColor: "#111111"
            objectName: "intButtons"
            metalness: 0.84266
            roughness: 0.1347
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: intTexDevices_material
            clearcoatAmount: 0.88473
            baseColor: "#2c2c2c"
            objectName: "intTexDevices"
            metalness: 0.66741
            roughness: 0.10849
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: intGrillBump_material
            objectName: "intGrillBump"
            baseColor: "#ff202020"
            metalness: 1
            roughness: 0.800000011920929
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: intLeatherBlack_material
            cullMode: Material.NoCulling
            objectName: "intLeatherBlack"
            baseColor: "#ff121212"
            metalness: 1
            roughness: 0.8197498917579651
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: glassLightsIllum_material
            baseColor: "#666666"
            objectName: "GlassLightsIllum"
            metalness: 0.56595
            roughness: 0.858578622341156
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: chromeLightsBMP_material
            objectName: "ChromeLightsBMP"
            baseColor: "#ff5a5a5a"
            metalness: 1
            roughness: 0.800000011920929
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: metalBlackMatte_material
            objectName: "MetalBlackMatte"
            baseColor: "#ff040404"
            metalness: 1
            roughness: 0.8258898854255676
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: metalGreyMatte_material
            objectName: "MetalGreyMatte"
            baseColor: "#181818"
            metalness: 1
            roughness: 0.8258898854255676
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: metalMirror_material
            objectName: "MetalMirror"
            baseColor: "#ff5a5a5a"
            metalness: 1
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: plasticOrange_material
            objectName: "PlasticOrange"
            baseColor: "#ffb93900"
            metalness: 1
            roughness: 0.8484283685684204
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: plasticRed_material
            objectName: "PlasticRed"
            baseColor: "#ff630000"
            metalness: 1
            roughness: 0.8484283685684204
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: glassBlue_material
            objectName: "GlassBlue"
            baseColor: "#cc0054ff"
            metalness: 1
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: glassLightsLens_material
            objectName: "GlassLightsLens"
            baseColor: "#b3141313"
            metalness: 1
            roughness: 0.19673502445220947
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: intSeatBelt_material
            baseColor: "#282828"
            objectName: "IntSeatBelt"
            metalness: 1
            roughness: 0.858578622341156
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: rubber_material
            metalness: 0.09762
            specularAmount: 0.5
            clearcoatAmount: 0
            baseColor: "#272727"
            roughness: 0.10523
            objectName: "Rubber"
            cullMode: PrincipledMaterial.NoCulling
        }

        PrincipledMaterial {
            id: glassTextured_material
            objectName: "GlassTextured"
            baseColor: "#ff0f0f0f"
            metalness: 0.69836
            cullMode: PrincipledMaterial.NoCulling
        }

        PrincipledMaterial {
            id: intCarpet_material
            baseColor: "#1e1e1e"
            objectName: "IntCarpet"
            metalness: 0
            roughness: 0.858578622341156
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: glassFrontGrill_material
            clearcoatAmount: 0.05132
            roughness: 0.03743
            objectName: "GlassFrontGrill"
            baseColor: "#d9060606"
            metalness: 0.92327
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Blend
        }

        PrincipledMaterial {
            id: intLeatherPerforatedBlack_material
            objectName: "intLeatherPerforatedBlack"
            baseColor: "#ff121212"
            metalness: 0
            roughness: 0.8197498917579651
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: wheelPlasticBlackBolt_material
            objectName: "WheelPlasticBlackBolt"
            baseColor: "#ff080808"
            metalness: 1
            roughness: 0.858578622341156
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: intLeatherSteeringWheel_material
            objectName: "intLeatherSteeringWheel"
            baseColor: "#ff121212"
            metalness: 0.041
            roughness: 0.8197498917579651
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: wheelCaliper_material
            objectName: "WheelCaliper"
            baseColor: "#ff800000"
            metalness: 1
            roughness: 0.5995112657546997
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: tailLightsIllum_material
            objectName: "TailLightsIllum"
            baseColor: "#ff3333"
            roughness: 0.5
            emissiveFactor.x: 1
            emissiveFactor.y: 1
            emissiveFactor.z: 1
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: wheelRimBlack_material
            baseColor: "#ffffff"
            objectName: "WheelRimBlack"
            metalness: 1
            roughness: 0.03458
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: wheelRimAlum_material
            roughness: 0.17105
            objectName: "WheelRimAlum"
            baseColor: "#181818"
            metalness: 1
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: wheelRimColor_material
            objectName: "WheelRimColor"
            baseColor: "#ffb10000"
            metalness: 1
            roughness: 0.35801348090171814
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: body_material
            clearcoatRoughnessAmount: 0.09662
            clearcoatAmount: 0.89982
            metalness: 0.29858
            objectName: "body"
            baseColor: "#b10000"
            roughness: 0.40178
        }

    }

    states: [
        State {
            name: "closed"
            when: !doorsOpenLeft && !doorsOpenRight
        },

        State {
            name: "open"
            when: doorsOpenLeft && doorsOpenRight


            PropertyChanges {
                target: doorLeft
                eulerRotation.z: 34.22798
                eulerRotation.y: -16.51705
                eulerRotation.x: 25.9818
            }

            PropertyChanges {
                target: doorRight
                eulerRotation.z: -33.71838
                eulerRotation.y: 16.65269
                eulerRotation.x: 25.12239
            }
        },

        State {
            name: "openLeft"
            when: doorsOpenLeft

            PropertyChanges {
                target: doorLeft
                eulerRotation.z: 34.22798
                eulerRotation.y: -16.51705
                eulerRotation.x: 25.9818
            }

            PropertyChanges {
                target: car
                scale.z: 1
                scale.y: 1
                scale.x: 1
            }
        },
        State {
            name: "openRight"
            when: doorsOpenRight

            PropertyChanges {
                target: doorRight
                eulerRotation.z: -33.71838
                eulerRotation.y: 16.65269
                eulerRotation.x: 25.12239
            }

            PropertyChanges {
                target: car
                scale.z: 1
                scale.y: 1
                scale.x: 1
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
                        target: car
                        property: "scale.x"
                        duration: 150
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: car
                        property: "scale.y"
                        duration: 150
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: car
                        property: "scale.z"
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
                        target: doorRight
                        property: "eulerRotation.x"
                        easing.bezierCurve: [0.455,0.03,0.515,0.955,1,1]
                        duration: 1852
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: doorRight
                        property: "eulerRotation.y"
                        easing.bezierCurve: [0.455,0.03,0.515,0.955,1,1]
                        duration: 1852
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: doorRight
                        property: "eulerRotation.z"
                        easing.bezierCurve: [0.455,0.03,0.515,0.955,1,1]
                        duration: 1852
                    }
                }
            }

            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: doorLeft
                        property: "eulerRotation.x"
                        easing.bezierCurve: [0.455,0.03,0.515,0.955,1,1]
                        duration: 1851
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: doorLeft
                        property: "eulerRotation.y"
                        easing.bezierCurve: [0.455,0.03,0.515,0.955,1,1]
                        duration: 1851
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: doorLeft
                        property: "eulerRotation.z"
                        easing.bezierCurve: [0.455,0.03,0.515,0.955,1,1]
                        duration: 1851
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
    D{i:0;cameraSpeed3d:25;cameraSpeed3dMultiplier:1}D{i:95;transitionDuration:2000}
}
##^##*/
