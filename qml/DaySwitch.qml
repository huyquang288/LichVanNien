import QtQuick 2.4

Item {
    id: daySwi
    signal clicked ()
    Rectangle {
        color: "yellow"
        anchors.fill: parent
        MouseArea {
            //anchors.fill: parent
            onClicked: {
                daySwi.clicked ()

            }
        }
    }
}

