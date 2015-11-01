import QtQuick 2.4
import QtQuick.Controls 1.4
import QtQml 2.2

Item {
    id: dayCal
    signal clicked ()
    property date today: new Date ()

    Component.onCompleted: {

    }

    Rectangle {
        color: "grey"
        anchors.fill: parent


        Image {
            source: "/images/background.png"
            anchors.fill: parent
        }



        MouseArea {
            //anchors.fill: parent
            onClicked: {
                dayCal.clicked ()

            }
        }

        Text {
            color: "#11b22c"
            font.pixelSize: appWidth/16
            y: dayCal.height/10
            x: (dayCal.width- width)/2
            text: "Tháng " +(today.getMonth()+1)+ " Năm " + today.getFullYear();
        }

    }
}

