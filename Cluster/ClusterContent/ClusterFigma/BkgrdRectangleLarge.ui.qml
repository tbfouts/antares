import QtQuick
import QtQuick.Controls
import QtQuick.Timeline 1.0
import Cluster 1.0
import VehicleData 1.0

Rectangle {
    id: bkgrdRectangleLarge
    width: 1429
    height: 890
    color: "transparent"
    property alias rectangleLargeWidth: rectangleLarge.width

    Image {
        id: rectangleLarge
        width: 1377
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: 0
        anchors.bottomMargin: 0
        source: "assets/rectangleLarge.png"
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Timeline {
        id: timeline
        startFrame: 0
        endFrame: 130
        enabled: true
        currentFrame: VehicleData.speed

        KeyframeGroup {
            target: rectangleLarge
            property: "width"
            Keyframe {
                value: 1543
                frame: 0
            }

            Keyframe {
                value: 1290
                frame: 130
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;uuid:"8bae4964-1c8c-5f32-9d0b-805c03c02524"}D{i:1;uuid:"b9d4c620-c104-5e51-a68b-f0d82a900732"}
}
##^##*/

