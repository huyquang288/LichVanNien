import QtQuick 2.4

Item {
    id: about
    signal clicked ()
    Rectangle {
        color: "silver"
        anchors.fill: parent
        MouseArea {
            anchors.fill: parent
            onClicked: {
                about.clicked();
            }
        }
    }

}




