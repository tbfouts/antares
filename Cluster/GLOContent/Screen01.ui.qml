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
import "IPIncCall"


Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height
    color: "#000000"

    GLOlayout {
        id: gLOlayout
        anchors.fill: parent
        recBkgrdRecBkgrdVisible: true
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

    IncomingCallIP {
        id: incomingCallIP
        x: 1344
        y: 67
    }



    AdasView3D {
        y: 0
        width: 1933
        height: 720
        visible: true
        anchors.horizontalCenter: parent.horizontalCenter
    }




    AdasComp {
        id: adasComp
        y: 64
        width: 480
        visible: false
        anchors.horizontalCenter: parent.horizontalCenter
        adasON: VehicleData.driveMode == "ADAS"
        adasOFF: true
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
                scaleU: 1.2
                rotationUV: 90
            }
        }


        PrincipledMaterial {
            id: adasControl
            baseColorMap: adasComp
            occlusionChannel: Material.R
            objectName: "laneLines"
            metalness: 0
            lighting: PrincipledMaterial.FragmentLighting
            blendMode: PrincipledMaterial.SourceOver
            baseColor: "#0a272727"
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
            baseColor: "#000000"
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


}

/*##^##
Designer {
    D{i:0;matPrevEnvDoc:"SkyBox";matPrevEnvValueDoc:"preview_studio";matPrevModelDoc:"#Sphere"}
D{i:3;cameraSpeed3d:25;cameraSpeed3dMultiplier:1}
}
##^##*/
