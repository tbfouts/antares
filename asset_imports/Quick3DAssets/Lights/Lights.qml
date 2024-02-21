import QtQuick
import QtQuick3D

Node {
    id: node
    property bool lightOn: false

    // Resources

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
            scale.z: 0.001
            source: "meshes/lights_mesh.mesh"
            materials: [
                frontLight_material,
                rearLight_material
            ]
        }
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
            lighting: PrincipledMaterial.NoLighting
            objectName: "RearLight"
            baseColor: "#ff2b00"
            roughness: 1
            emissiveFactor.x: 0.95503
            emissiveFactor.y: 0.0385343
            emissiveFactor.z: 0.020586
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
        }
    ]

    // Animations:
}
