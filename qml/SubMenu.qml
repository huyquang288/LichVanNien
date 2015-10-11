import QtQuick 2.4

Item {
    id: dayCal
    signal clicked ()
    Rectangle {
        id: subMen
        width: appWidth/2.7
        height: appHight- todayButton.height*1.5
        color: "purple"
        Text {
            id: teamName
            text: qsTr("NoName Group")
            font.pixelSize: parent.width/10
            anchors.top: parent.top
            anchors.topMargin: height/2
            x: (parent.width- width)/2
            color: "white"
        }
        Image {
            id: teamImage
            anchors.top: teamName.bottom
            width: parent.width
            height: width*2/3
            source: "/images/teamImage.jpg"
        }
        Column {
            anchors.top: teamImage.bottom
            width: parent.width

            ImageButton {
                id: contactButton
                width: parent.width
                height: width/3
                source: "/images/contact.png"
                onClicked: {

                }
            }
            ImageButton {
                id: aboutButton
                width: contactButton.width
                height: contactButton.height
                source: "/images/about.png"
                onClicked: {
                    hideMainMenu();
                    currentPage= "About";

                }
            }
        }
    }
}

