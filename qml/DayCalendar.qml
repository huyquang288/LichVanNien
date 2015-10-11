import QtQuick 2.4

Item {
    id: dayCal
    signal clicked ()
    Rectangle {
        color: "grey"
        anchors.fill: parent
        MouseArea {
            //anchors.fill: parent
            onClicked: {
                dayCal.clicked ()

            }
        }
    }
}

