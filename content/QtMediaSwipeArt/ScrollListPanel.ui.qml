import QtQuick
import QtQuick.Controls

Item {
    id: scrollListPanel
    width: 734
    height: 700

    Rectangle {
        id: scrollListBkgrd
        width: 734
        height: 506
        color: "#00ffffff"
        radius: 8
        border.color: "#8c787878"
        border.width: 1
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: -3
    }


    ListView {
        id: listView
        x: 0
        y: 0
        width: 740
        height: 500
        spacing: 4
        interactive: true
        clip: true
        model: 1
        delegate: ListViewTracks {
            id: listViewTracks
            x: 0
            y: 0
            width: 740
            height: 680
        }
        ScrollBar.vertical: ScrollBar{
            id: listView2
            anchors.right: parent.left
            anchors.rightMargin: -15
            visible: true
        }
    }



    }


/*##^##
Designer {
    D{i:0;uuid:"d58c706d-95db-5548-b0c3-13f7500185c2"}D{i:1;uuid:"59deb866-9430-50db-8719-02ca6747a641"}
}
##^##*/

