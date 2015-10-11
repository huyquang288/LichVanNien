import QtQuick 2.4

Item {
    id: monCal
    signal clicked ()
    Rectangle {
        color: "orange"
        anchors.fill: parent
        MouseArea {
            //anchors.fill: parent
            onClicked: {
                monCal.clicked ()

            }
        }
    }
}

