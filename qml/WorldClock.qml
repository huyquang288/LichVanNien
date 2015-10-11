import QtQuick 2.4

Item {
    id: worClo
    signal clicked ()
    Rectangle {
        color: "green"
        anchors.fill: parent
        MouseArea {
            //anchors.fill: parent
            onClicked: {
                worClo.clicked ()

            }
        }
    }
}

