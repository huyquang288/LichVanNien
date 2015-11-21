import QtQuick 2.4
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "js/ConvertDay.js" as CD1

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
        Image {
            anchors.fill: parent
            source: "/images/background.png"
        }
        Calendar {
            id: calendar
            anchors.top: parent.top
            anchors.topMargin: (parent.height- height)/5
            width: parent.width
            height: width
            weekNumbersVisible: true

            style: CalendarStyle {
                gridVisible: false
                dayDelegate: Rectangle {
                    gradient: Gradient {
                        GradientStop {
                            position: 0.00
                            color: styleData.selected ? "#111" : (styleData.visibleMonth && styleData.valid ? "#444" : "#666");
                        }
                        GradientStop {
                            position: 1.00
                            color: styleData.selected ? "#444" : (styleData.visibleMonth && styleData.valid ? "#111" : "#666");
                        }
                        GradientStop {
                            position: 1.00
                            color: styleData.selected ? "#777" : (styleData.visibleMonth && styleData.valid ? "#111" : "#666");
                        }
                    }

                    Label {
                        text: styleData.date.getDate()
                        anchors.centerIn: parent
                        color: styleData.valid ? "white" : "grey"
                    }

                    Rectangle {
                        width: parent.width
                        height: 1
                        color: "#555"
                        anchors.bottom: parent.bottom
                    }

                    Rectangle {
                        width: 1
                        height: parent.height
                        color: "#555"
                        anchors.right: parent.right
                    }
                }
            }
        }

        Text {
            id: day1
            anchors.top: calendar.bottom
            anchors.topMargin: height/4
            font.pixelSize: parent.width/18
            color: "#070777"
            x: (parent.width- width)/2
            text: calendar.selectedDate.getDate() +"/" +(calendar.selectedDate.getMonth()+1) +"/" +calendar.selectedDate.getFullYear()
        }
        Text {
            id: day2
            anchors.top: day1.bottom
            anchors.topMargin: day1.height/4
            font.pixelSize: parent.width/25
            color: "#093e9b"
            x: (parent.width- width)/2
            text: CD1.getLunarFullDate(calendar.selectedDate.getDate(), calendar.selectedDate.getMonth()+1, calendar.selectedDate.getFullYear())+" Âm lịch"
        }
        Text {
            id: day3
            anchors.top: day2.bottom
            anchors.topMargin: day1.height/4
            font.pixelSize: parent.width/25
            color: "#093e9b"
            x: (parent.width- width)/2
            text: CD1.getVNeseNameDay(calendar.selectedDate.getDate(), calendar.selectedDate.getMonth()+1, calendar.selectedDate.getFullYear())
        }
    }
}

