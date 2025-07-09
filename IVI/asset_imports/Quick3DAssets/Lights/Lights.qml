import QtQuick
import QtQuick3D

Node {
    id: node
    property bool lightOn: false

    // Nodes:
    Node {
        id: car
        objectName: "Car"
        Model {
            id: lights
            visible: false
            objectName: "Lights"
            scale.x: 0.001
            scale.y: 0.001
            scale.z: 0.00101

            source: "meshes/lights_mesh.mesh"
            materials: [
                frontLight_material,
                rearLight_material
            ]
        }

    Node {
        id: __materialLibrary__

        PrincipledMaterial {
            id: frontLight_material
            objectName: "FrontLight"
            baseColor: "#ffffff"
            roughness: 0.5
            emissiveFactor.x: 1
            emissiveFactor.y: 1
            emissiveFactor.z: 1
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: rearLight_material
            emissiveFactor.x: 1
            objectName: "RearLight"
            baseColor: "#ff4d4d"
            roughness: 0.50159
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Default
        }
    }
    states: [
        State {
            name: "off"
            when: !lightOn
        },
        State {
            name: "on"
            when: lightOn

            PropertyChanges {
                target: lights
                visible: true
            }

            PropertyChanges {
                target: taillights
                visible: true
                materials: rearLight_material
            }
        }
    ]
}
}

/*##^##
Designer {
    D{i:0;cameraSpeed3d:25;cameraSpeed3dMultiplier:1}
}
##^##*/
