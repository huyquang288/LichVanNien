import QtQuick 2.4
import "content" as Content

Item {
    id: oth
    Rectangle {
        color: "skyblue"
        anchors.fill: parent
        MouseArea {
            //anchors.fill: parent
            onClicked: {

            }
        }

        Image {
            anchors.fill: parent
            source: "/images/background.png"
        }

        Rectangle {
            id: worldClocks
            width: parent.width*0.9
            height: parent.height*0.9
            anchors.top: parent.top
            anchors.topMargin: (parent.height- height)/2
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.05
            visible: true
            Image {
                source: "/images/rectangle.png"
                anchors.fill: parent
            }
            Text {
                id: name1
                text: "World Clocks"
                font.pixelSize: parent.width/12
                anchors.top: parent.top
                anchors.topMargin: height/3*2
                x: (parent.width- width)/2
            }


            Rectangle {
                id: clo1
                width: parent.width/3
                height: width
                anchors.top: name1.bottom
                anchors.topMargin: (parent.height- cc.height*2- name1.height)/2.05
                anchors.left: parent.left
                anchors.leftMargin: width/3
                Content.Clock {
                    id: cc
                    scale: (width>parent.width) ?(parent.width/width) :(width/parent.width)
                    anchors.centerIn: parent
                    city: "New York"; shift: -4
                }
            }
            Rectangle {
                id: clo2
                width: parent.width/3
                height: width
                anchors.top: clo1.top
                anchors.left: clo1.right
                anchors.leftMargin: width/3
                Content.Clock {
                    scale: (width>parent.width) ?(parent.width/width) :(width/parent.width)
                    anchors.centerIn: parent
                    city: "London"; shift: 0
                }
            }
            Rectangle {
                id: clo3
                width: parent.width/3
                height: width
                anchors.top: clo1.bottom
                anchors.topMargin: name1.height
                anchors.left: parent.left
                anchors.leftMargin: width/3
                Content.Clock {
                    scale: (width>parent.width) ?(parent.width/width) :(width/parent.width)
                    anchors.centerIn: parent
                    city: "Mumbai"; shift: 5.5
                }
            }
            Rectangle {
                id: clo4
                width: parent.width/3
                height: width
                anchors.top: clo3.top
                anchors.left: clo3.right
                anchors.leftMargin: width/3
                Content.Clock {
                    scale: (width>parent.width) ?(parent.width/width) :(width/parent.width)
                    anchors.centerIn: parent
                    city: "Tokyo"; shift: 9
                }
            }
        }

    }
}

