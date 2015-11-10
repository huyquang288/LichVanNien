import QtQuick 2.4
import QtQuick.Controls 1.4
import "js/ConvertDay.js" as CD

Item {
    id: daySwi
    property string lunarDayText: ""
    property string swap: "solar"
    Rectangle {        
        color: "yellow"
        anchors.fill: parent

        Image {
            anchors.fill: parent
            source: "/images/background.png"
        }

        ComboBox {
            id: solarYear
            width: parent.width/5
            y: parent.height/2.5
            x: parent.width/10
            model: ["Year", 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019];
            visible: (swap=="solar") ?true :false
            onCurrentIndexChanged: {
                if (solarYear.currentIndex!=0 && solarMonth.currentIndex !=0) {
                    if (solarDay1.visible== true && solarDay1.currentIndex!=0) {
                        CD.getLunarDate(solarDay1.currentText, solarMonth.currentText, solarYear.currentText);
                    }
                    else if (solarDay2.visible== true && solarDay2.currentIndex!=0) {
                        CD.getLunarDate(solarDay2.currentText, solarMonth.currentText, solarYear.currentText);
                    }
                    else if (solarDay3.visible== true && solarDay3.currentIndex!=0) {
                        CD.getLunarDate(solarDay3.currentText, solarMonth.currentText, solarYear.currentText);
                    }
                    else if (solarDay4.visible== true && solarDay4.currentIndex!=0) {
                        CD.getLunarDate(solarDay4.currentText, solarMonth.currentText, solarYear.currentText);
                    }
                    lunarDayText= CD.lunarDay +"/" +CD.lunarMonth +"/" +CD.lunarYear +" Âm lịch"
                    lunarDay.visible= true
                }
            }
        }

        ComboBox {
            id: solarMonth
            width: parent.width/5
            y: solarYear.y
            x: solarYear.x*2+ solarYear.width
            model: ["Month", 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
            visible: (swap=="solar") ?true :false
            enabled: (solarYear.currentIndex!=0) ?true :false
            onCurrentIndexChanged: {
                if (solarYear.currentIndex!=0 && solarMonth.currentIndex !=0) {
                    if (solarDay1.visible== true && solarDay1.currentIndex!=0) {
                        CD.getLunarDate(solarDay1.currentText, solarMonth.currentText, solarYear.currentText);
                    }
                    else if (solarDay2.visible== true && solarDay2.currentIndex!=0) {
                        CD.getLunarDate(solarDay2.currentText, solarMonth.currentText, solarYear.currentText);
                    }
                    else if (solarDay3.visible== true && solarDay3.currentIndex!=0) {
                        CD.getLunarDate(solarDay3.currentText, solarMonth.currentText, solarYear.currentText);
                    }
                    else if (solarDay4.visible== true && solarDay4.currentIndex!=0) {
                        CD.getLunarDate(solarDay4.currentText, solarMonth.currentText, solarYear.currentText);
                    }
                    lunarDayText= CD.lunarDay +"/" +CD.lunarMonth +"/" +CD.lunarYear +" Âm lịch"
                    lunarDay.visible= true
                }
            }
        }

        ComboBox {
            id: solarDay1
            width: parent.width/5
            y: solarYear.y
            x: solarYear.x*3+ solarYear.width*2
            model: ["Day", 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31];
            visible: (swap=="solar" && solarMonth.currentIndex==0) ?true :((solarMonth.currentText==1 || solarMonth.currentText==3 || solarMonth.currentText==5 || solarMonth.currentText==7 || solarMonth.currentText==8 || solarMonth.currentText==10 || solarMonth.currentText==12) ?true :false);
            enabled: (swap=="solar" && solarMonth.currentIndex==0) ?false :((solarMonth.currentText==1 || solarMonth.currentText==3 || solarMonth.currentText==5 || solarMonth.currentText==7 || solarMonth.currentText==8 || solarMonth.currentText==10 || solarMonth.currentText==12) ?true :false);
            onCurrentIndexChanged: {
                if (solarYear.currentIndex!=0 && solarMonth.currentIndex !=0) {
                    CD.getLunarDate(solarDay1.currentText, solarMonth.currentText, solarYear.currentText);
                    lunarDayText= CD.lunarDay +"/" +CD.lunarMonth +"/" +CD.lunarYear +" Âm lịch"
                    lunarDay.visible= true
                }
            }
        }
        ComboBox {
            id: solarDay2
            width: parent.width/5
            y: solarYear.y
            x: solarYear.x*3+ solarYear.width*2
            model: ["Day", 1, 2, 3, 4, 5 , 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30];
            visible: (solarMonth.currentText==4 || solarMonth.currentText==6 || solarMonth.currentText==9 || solarMonth.currentText==11) ?true :false
            onCurrentIndexChanged: {
                if (solarYear.currentIndex!=0 && solarMonth.currentIndex !=0) {
                    CD.getLunarDate(solarDay2.currentText, solarMonth.currentText, solarYear.currentText);
                    lunarDayText= CD.lunarDay +"/" +CD.lunarMonth +"/" +CD.lunarYear +" Âm lịch"
                    lunarDay.visible= true
                }
            }
        }

        ComboBox {
            id: solarDay3
            width: parent.width/5
            y: solarYear.y
            x: solarYear.x*3+ solarYear.width*2
            model: ["Day", 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28];
            visible: (solarMonth.currentText== 2 && solarYear.currentText%4!=0) ?true :false
            onCurrentIndexChanged: {
                if (solarYear.currentIndex!=0 && solarMonth.currentIndex !=0) {
                    CD.getLunarDate(solarDay3.currentText, solarMonth.currentText, solarYear.currentText);
                    lunarDayText= CD.lunarDay +"/" +CD.lunarMonth +"/" +CD.lunarYear +" Âm lịch"
                    lunarDay.visible= true
                }
            }
        }

        ComboBox {
            id: solarDay4
            width: parent.width/5
            y: solarYear.y
            x: solarYear.x*3+ solarYear.width*2
            model: ["Day", 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29];
            visible: (solarMonth.currentText== 2 && solarYear.currentText%4==0) ?true :false
            onCurrentIndexChanged: {
                if (solarYear.currentIndex!=0 && solarMonth.currentIndex !=0) {
                    CD.getLunarDate(solarDay4.currentText, solarMonth.currentText, solarYear.currentText);
                    lunarDayText= CD.lunarDay +"/" +CD.lunarMonth +"/" +CD.lunarYear +" Âm lịch"
                    lunarDay.visible= true
                }
            }
        }

        Text {
            id: lunarDay
            anchors.top: solarYear.bottom
            anchors.topMargin: height*2
            x: (parent.width- width)/2
            color: "white"
            text: lunarDayText
            visible: false
        }





    }
}

