import QtQuick 2.0


Rectangle {
    id: aboutPage
    color: "pink"

    MouseArea {
        anchors.fill: parent
        onClicked: {
            backToMainMenu();
        }
    }
}

