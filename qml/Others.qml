import QtQuick 2.4

Item {
    id: oth
    signal clicked ()
    Rectangle {
        color: "skyblue"
        anchors.fill: parent
        MouseArea {
            //anchors.fill: parent
            onClicked: {
                oth.clicked ()

            }
        }

        Image {
            anchors.fill: parent
            source: "/images/background.png"
        }
    }
}

