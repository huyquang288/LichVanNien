import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Controls.Private 1.0
import QtQuick.Controls.Styles 1.1
import QtQuick.Controls 1.4

import "js/ConvertDay.js" as CD

Item {
    id: monthCalendar

    Image {
        anchors.fill: parent
        source: "/images/background.png"
    }

    SystemPalette {
        id: systemPalette
    }


    Flow {
        id: row
        anchors.fill: parent

        spacing: 10
        layoutDirection: Qt.RightToLeft

        Calendar {
            id: calendar
            width: (parent.width > parent.height ? parent.width * 0.7 - parent.spacing : parent.width)
            height: (parent.height > parent.width ? parent.height * 0.7 - parent.spacing : parent.height)
            frameVisible: true
            weekNumbersVisible: true

            style: CalendarStyle {

                gridVisible: false
                dayDelegate: Item {
                    readonly property color sameMonthDateTextColor: "#444"
                    readonly property color selectedDateColor: Qt.platform.os === "osx" ? "#3778d0" : systemPalette.highlight
                    readonly property color selectedDateTextColor: "white"
                    readonly property color differentMonthDateTextColor: "#bbb"
                    readonly property color invalidDatecolor: "#dddddd"

                    Rectangle {
                        anchors.fill: parent
                        border.color: "transparent"
                        color: (styleData.date !== undefined && styleData.selected) ?selectedDateColor :(dayColor(styleData.date) ?"#fc571b" :((styleData.date.getDay()===0 || styleData.date.getDay()===6)&&(styleData.visibleMonth && styleData.valid)) ?"#f7e8dc" :("transparent"))
                        anchors.margins: styleData.selected ? -1 : 0
                    }

                    Label {
                        id: dayDelegateText
                        text: styleData.date.getDate()
                        font.pixelSize: parent.height/3
                        anchors.centerIn: parent
                        color: {
                            var color = invalidDatecolor;
                            if (styleData.valid) {
                                // Date is within the valid range.
                                color = styleData.visibleMonth ? sameMonthDateTextColor : differentMonthDateTextColor;
                                if (styleData.selected) {
                                    color = selectedDateTextColor;
                                }
                            }
                            color;
                        }
                    }
                    Label {
                        id: smalltext
                        text: CD.getDayForMonthCalendar(styleData.date.getDate(), styleData.date.getMonth()+1, styleData.date.getYear())
                        font.pixelSize: dayDelegateText.font.pixelSize/2
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: height/4
                        anchors.right: parent.right
                        anchors.rightMargin: height/3
                        color: {
                            var color = invalidDatecolor;
                            if (styleData.valid) {
                                // Date is within the valid range.
                                color = styleData.visibleMonth ? sameMonthDateTextColor : differentMonthDateTextColor;
                                if (styleData.selected) {
                                    color = selectedDateTextColor;
                                }
                            }
                            color;
                        }
                    }
                }
            }
        }

        Rectangle {
            width: (parent.width > parent.height ? parent.width * 0.3 - parent.spacing : parent.width)
            height: (parent.height > parent.width ? parent.height * 0.3 - parent.spacing : parent.height)
            border.color: Qt.darker(color, 1.2)

            Rectangle {
                id: eventListHeader
                anchors.top: parent.top
                anchors.topMargin: eventDayLabel.height/15
                height: eventDateRow.height+3
                width: eventDayLabel.width +20 +monthAndYear.width
                x: (parent.width- width)/2

                Column {
                    id: eventDateColumn
                    width: parent.width
                    height: parent.height
                    spacing: 15
                    Row {
                        id: eventDateRow
                        width: parent.width
                        height: eventDayLabel.height*1.1
                        spacing: 25

                        Text {
                            id: eventDayLabel
                            text: calendar.selectedDate.getDate()
                            font.pointSize: monthCalendar.width/14
                            color: "#2d2121"
                        }

                        Column {
                            height: eventDayLabel.height

                            Text {
                                readonly property var options: { weekday: "long" }
                                text: Qt.locale().standaloneDayName(calendar.selectedDate.getDay(), Locale.LongFormat)
                                font.pointSize: monthCalendar.width/28
                                color: "#2d2121"
                            }
                            Text {
                                id: monthAndYear
                                text: Qt.locale().standaloneMonthName(calendar.selectedDate.getMonth())
                                      + calendar.selectedDate.toLocaleDateString(Qt.locale(), " yyyy")
                                font.pointSize: monthCalendar.width/30
                                color: "#2d2121"
                            }
                        }
                    }

                }

                Text {
                    id: globalEventDay
                    anchors.top: eventListHeader.bottom
                    anchors.topMargin: -10
                    x: (parent.width- width)/2
                    text: dayEvent (calendar.selectedDate);
                    font.pointSize: monthCalendar.width/28
                    wrapMode: Text.Wrap
                    color: "#ff7f00"
                }

                Text {
                    id: day2
                    anchors.top: (globalEventDay.text!='') ?globalEventDay.bottom :eventListHeader.bottom
                    anchors.topMargin: day2.height/5.5
                    font.pixelSize: monthCalendar.width/25
                    color: "#093e9b"
                    x: (parent.width- width)/2
                    text: CD.getLunarFullDate(calendar.selectedDate.getDate(), calendar.selectedDate.getMonth()+1, calendar.selectedDate.getFullYear())+" Âm lịch"
                }
                Text {
                    id: day3
                    anchors.top: day2.bottom
                    anchors.topMargin: day2.height/6
                    font.pixelSize: monthCalendar.width/25
                    color: "#093e9b"
                    x: (parent.width- width)/2
                    text: CD.getVNeseNameDay(calendar.selectedDate.getDate(), calendar.selectedDate.getMonth()+1, calendar.selectedDate.getFullYear())
                }
            }
        }

        MouseArea {
            id: hideCalendarClickEvent
            anchors.fill: parent
            visible: false
        }
    }

    function dayColor (date) {
        var d= (date.getFullYear() +"-");
        d+= (date.getMonth()+1)
        d+= "-" +date.getDate();
        d= d.toString();
        //console.log(d);
        switch (d) {
        case '2016-2-8': {
            return true
        }
        case '2016-2-9': {
            return true
        }
        case '2016-2-7': {
            return true
        }
        case '2016-2-6': {
            return true
        }
        case '2016-2-10': {
            return true
        }
        case '2016-1-1': {
            return true
        }
        case '2016-4-30': {
            return true
        }
        case '2016-4-10': {
            return true
        }
        case '2016-5-1': {
            return true
        }
        default: return false;
        }
    }

    function dayEvent (date) {
        var d= (date.getFullYear() +"-");
        d+= (date.getMonth()+1)
        d+= "-" +date.getDate();
        d= d.toString();
        console.log(d);
        switch (d) {
        case '2016-2-8': {
            return "Tết Âm Lịch"
        }
        case '2016-2-9': {
            return "Tết Âm Lịch"
        }
        case '2016-2-7': {
            return "Tết Âm Lịch"
        }
        case '2016-2-6': {
            return "Tết Âm Lịch"
        }
        case '2016-2-10': {
            return "Tết Âm Lịch"
        }
        case '2016-1-1': {
            return "Tết Dương Lịch"
        }
        case '2016-4-30': {
            return "Ngày Giải Phóng Miền Nam"
        }
        case '2016-4-10': {
            return "Giỗ Tổ Hùng Vương"
        }
        case '2016-5-1': {
            return "Ngày Quốc tế lao động"
        }
        default: return "";
        }
    }
}


