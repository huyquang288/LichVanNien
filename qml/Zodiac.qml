import QtQuick 2.4

Item {
    id: zod
    signal clicked ()
    Rectangle {
        color: "orange"
        anchors.fill: parent
        MouseArea {
            //anchors.fill: parent
            onClicked: {
                zod.clicked ()

            }
        }
    }
}

