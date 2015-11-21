import QtQuick 2.4
import QtQuick.Controls 1.4
import "js/ConvertDay.js" as CD

Item {
    id: daySwi
    property string belowText: ""
    property string aboveText: ""
    property string mode: "sun"
    Rectangle {        
        color: "yellow"
        anchors.fill: parent

        Image {
            anchors.fill: parent
            source: "/images/background.png"
        }

        Image {
            id: fromImage
            source: "/images/sun.png"
            width: parent.width/4
            height: width
            anchors.top: parent.top
            anchors.topMargin: width
            anchors.left: parent.left
            anchors.leftMargin: width/2
        }



        Image {
            source: "/images/to.png"
            x: (parent.width-width)/2
            y: fromImage.y + (fromImage.height- height)/2
            width: fromImage.width
            height: width/4
        }

        ImageButton {
            //id: name
            source: "/images/swap.png"
            width: fromImage.width/1.5
            height: width/2
            x: (parent.width-width)/2
            y: fromImage.y +fromImage.height -height/2
            onClicked: {
                if (mode=='sun') {
                    fromImage.source="/images/moon.png"
                    distinationImage.source="/images/sun.png"
                    mode= 'moon';
                }
                else {
                    fromImage.source="/images/sun.png"
                    distinationImage.source="/images/moon.png"
                    mode='sun';
                }
                lunarDayT.visible= false
                solarDayT.visible= lunarDayT.visible
            }
            onPressed: {
                opacity=0.5
            }
            onReleased: {
                opacity= 1;
            }
        }

        Image {
            id: distinationImage
            source: "/images/moon.png"
            width: fromImage.width
            height: width
            anchors.top: fromImage.top
            anchors.right: parent.right
            anchors.rightMargin: width/2
        }

        Image {
            x: solarYear.x- solarYear.width/3
            y: solarYear.y- solarYear.height/2
            height: solarYear.height*2
            width: parent.width*0.8 +solarYear.width/3*2
            source: "/images/rectangle.png"
            opacity: 0.85
        }


        // list of sun combo box
        ComboBox {
            id: solarYear
            width: parent.width/5
            anchors.top: fromImage.bottom
            anchors.topMargin: fromImage.height/1.5
            x: parent.width/10
            model: ["Năm", 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019];
            visible: (mode=='sun') ?true :false
            onCurrentIndexChanged: {
                if (solarYear.currentIndex!=0 && solarMonth.currentIndex !=0) {
                    if (solarDay1.visible== true && solarDay1.currentIndex!=0) {
                        CD.getLunarDate(solarDay1.currentText, solarMonth.currentText, solarYear.currentText);
                        aboveText= solarDay1.currentText +"/" +solarMonth.currentText +"/" +solarYear.currentText
                    }
                    else if (solarDay2.visible== true && solarDay2.currentIndex!=0) {
                        CD.getLunarDate(solarDay2.currentText, solarMonth.currentText, solarYear.currentText);
                        aboveText= solarDay2.currentText +"/" +solarMonth.currentText +"/" +solarYear.currentText
                    }
                    else if (solarDay3.visible== true && solarDay3.currentIndex!=0) {
                        CD.getLunarDate(solarDay3.currentText, solarMonth.currentText, solarYear.currentText);
                        aboveText= solarDay3.currentText +"/" +solarMonth.currentText +"/" +solarYear.currentText
                    }
                    else if (solarDay4.visible== true && solarDay4.currentIndex!=0) {
                        CD.getLunarDate(solarDay4.currentText, solarMonth.currentText, solarYear.currentText);
                        aboveText= solarDay4.currentText +"/" +solarMonth.currentText +"/" +solarYear.currentText
                    }
                    belowText= CD.lunarDay +"/" +CD.lunarMonth +"/" +CD.lunarYear +" Âm lịch"
                    lunarDayT.visible= (CD.lunarDay>0 && CD.lunarMonth>0 && CD.lunarYear >0) ?true :false
                    solarDayT.visible= lunarDayT.visible
                }
            }
        }

        ComboBox {
            id: solarMonth
            width: parent.width/5
            y: solarYear.y
            x: solarYear.x*2+ solarYear.width
            model: ["Tháng", 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
            visible: (mode=='sun') ?true :false
            enabled: (solarYear.currentIndex!=0) ?true :false
            onCurrentIndexChanged: {
                if (solarYear.currentIndex!=0 && solarMonth.currentIndex !=0) {
                    if (solarDay1.visible== true && solarDay1.currentIndex!=0) {
                        CD.getLunarDate(solarDay1.currentText, solarMonth.currentText, solarYear.currentText);
                        aboveText= solarDay1.currentText +"/" +solarMonth.currentText +"/" +solarYear.currentText
                    }
                    else if (solarDay2.visible== true && solarDay2.currentIndex!=0) {
                        CD.getLunarDate(solarDay2.currentText, solarMonth.currentText, solarYear.currentText);
                        aboveText= solarDay2.currentText +"/" +solarMonth.currentText +"/" +solarYear.currentText
                    }
                    else if (solarDay3.visible== true && solarDay3.currentIndex!=0) {
                        CD.getLunarDate(solarDay3.currentText, solarMonth.currentText, solarYear.currentText);
                        aboveText= solarDay3.currentText +"/" +solarMonth.currentText +"/" +solarYear.currentText
                    }
                    else if (solarDay4.visible== true && solarDay4.currentIndex!=0) {
                        CD.getLunarDate(solarDay4.currentText, solarMonth.currentText, solarYear.currentText);
                        aboveText= solarDay4.currentText +"/" +solarMonth.currentText +"/" +solarYear.currentText
                    }
                    belowText= CD.lunarDay +"/" +CD.lunarMonth +"/" +CD.lunarYear +" Âm lịch"
                    lunarDayT.visible= (CD.lunarDay>0 && CD.lunarMonth>0 && CD.lunarYear >0) ?true :false
                    solarDayT.visible= lunarDayT.visible
                }
            }
        }

        ComboBox {
            id: solarDay1
            width: parent.width/5
            y: solarYear.y
            x: solarYear.x*3+ solarYear.width*2
            model: ["Ngày", 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31];
            visible: (mode=='sun' && solarMonth.currentIndex==0) ?true :((mode=='sun' && (solarMonth.currentText==1 || solarMonth.currentText==3 || solarMonth.currentText==5 || solarMonth.currentText==7 || solarMonth.currentText==8 || solarMonth.currentText==10 || solarMonth.currentText==12)) ?true :false);
            enabled: (mode=='sun' && solarMonth.currentIndex==0) ?false :((solarMonth.currentText==1 || solarMonth.currentText==3 || solarMonth.currentText==5 || solarMonth.currentText==7 || solarMonth.currentText==8 || solarMonth.currentText==10 || solarMonth.currentText==12) ?true :false);
            onCurrentIndexChanged: {
                if (solarYear.currentIndex!=0 && solarMonth.currentIndex !=0) {
                    CD.getLunarDate(solarDay1.currentText, solarMonth.currentText, solarYear.currentText);
                    belowText= CD.lunarDay +"/" +CD.lunarMonth +"/" +CD.lunarYear +" Âm lịch"
                    aboveText= solarDay1.currentText +"/" +solarMonth.currentText +"/" +solarYear.currentText
                    lunarDayT.visible= (CD.lunarDay>0 && CD.lunarMonth>0 && CD.lunarYear >0) ?true :false
                    solarDayT.visible= lunarDayT.visible
                }
            }
        }

        ComboBox {
            id: solarDay2
            width: parent.width/5
            y: solarYear.y
            x: solarYear.x*3+ solarYear.width*2
            model: ["Ngày", 1, 2, 3, 4, 5 , 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30];
            visible: (mode=='sun' && (solarMonth.currentText==4 || solarMonth.currentText==6 || solarMonth.currentText==9 || solarMonth.currentText==11)) ?true :false
            onCurrentIndexChanged: {
                if (solarYear.currentIndex!=0 && solarMonth.currentIndex !=0) {
                    CD.getLunarDate(solarDay2.currentText, solarMonth.currentText, solarYear.currentText);
                    belowText= CD.lunarDay +"/" +CD.lunarMonth +"/" +CD.lunarYear +" Âm lịch"
                    aboveText= solarDay2.currentText +"/" +solarMonth.currentText +"/" +solarYear.currentText
                    lunarDayT.visible= (CD.lunarDay>0 && CD.lunarMonth>0 && CD.lunarYear >0) ?true :false
                    solarDayT.visible= lunarDayT.visible
                }
            }
        }

        ComboBox {
            id: solarDay3
            width: parent.width/5
            y: solarYear.y
            x: solarYear.x*3+ solarYear.width*2
            model: ["Ngày", 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28];
            visible: (mode=='sun' && solarMonth.currentText== 2 && solarYear.currentText%4!=0) ?true :false
            onCurrentIndexChanged: {
                if (solarYear.currentIndex!=0 && solarMonth.currentIndex !=0) {
                    CD.getLunarDate(solarDay3.currentText, solarMonth.currentText, solarYear.currentText);
                    belowText= CD.lunarDay +"/" +CD.lunarMonth +"/" +CD.lunarYear +" Âm lịch"
                    aboveText= solarDay3.currentText +"/" +solarMonth.currentText +"/" +solarYear.currentText
                    lunarDayT.visible= (CD.lunarDay>0 && CD.lunarMonth>0 && CD.lunarYear >0) ?true :false
                    solarDayT.visible= lunarDayT.visible
                }
            }
        }

        ComboBox {
            id: solarDay4
            width: parent.width/5
            y: solarYear.y
            x: solarYear.x*3+ solarYear.width*2
            model: ["Ngày", 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29];
            visible: (mode=='sun' && solarMonth.currentText== 2 && solarYear.currentText%4==0) ?true :false
            onCurrentIndexChanged: {
                if (solarYear.currentIndex!=0 && solarMonth.currentIndex !=0) {
                    CD.getLunarDate(solarDay4.currentText, solarMonth.currentText, solarYear.currentText);
                    aboveText= solarDay4.currentText +"/" +solarMonth.currentText +"/" +solarYear.currentText
                    belowText= CD.lunarDay +"/" +CD.lunarMonth +"/" +CD.lunarYear +" Âm lịch"
                    lunarDayT.visible= (CD.lunarDay>0 && CD.lunarMonth>0 && CD.lunarYear >0) ?true :false
                    solarDayT.visible= lunarDayT.visible
                }
            }
        }

        // list of moon combo box
        ComboBox {
            id: lunarYear
            width: solarYear.width
            x: solarYear.x
            y: solarYear.y
            model: ["Năm", 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019];
            visible: (mode=='moon') ?true :false
            onCurrentIndexChanged: {
                if (lunarYear.currentIndex!=0 && lunarMonth.currentIndex!=0 && lunarDay.currentIndex!=0) {
                    CD.convertLunar2Solar(lunarDay.currentText, lunarMonth.currentText, lunarYear.currentText, 0, 7)
                    aboveText= lunarDay.currentText +"/" +lunarMonth.currentText +"/" +lunarYear.currentText +"Âm lịch"
                    belowText= CD.solarDayNumber +"/" +CD.solarMonthNumber +"/" +CD.solarYearNumber
                    lunarDayT.visible= true
                    solarDayT.visible= lunarDayT.visible
                }
            }
        }

        ComboBox {
            id: lunarMonth
            width: solarMonth.width
            y: solarMonth.y
            x: solarMonth.x
            model: ["Tháng", 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
            visible: (mode=='moon') ?true :false
            enabled: (lunarYear.currentIndex!=0) ?true :false
            onCurrentIndexChanged: {
                if (lunarYear.currentIndex!=0 && lunarMonth.currentIndex!=0 && lunarDay.currentIndex!=0) {
                    CD.convertLunar2Solar(lunarDay.currentText, lunarMonth.currentText, lunarYear.currentText, 0, 7)
                    aboveText= lunarDay.currentText +"/" +lunarMonth.currentText +"/" +lunarYear.currentText +"Âm lịch"
                    belowText= CD.solarDayNumber +"/" +CD.solarMonthNumber +"/" +CD.solarYearNumber
                    lunarDayT.visible= true
                    solarDayT.visible= lunarDayT.visible
                }
            }
        }

        ComboBox {
            id: lunarDay
            width: solarDay1.width
            y: solarDay1.y
            x: solarDay1.x
            model: ["Ngày", 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30];
            visible: (mode=='moon') ?true :false
            enabled: (mode=='moon' && lunarMonth.currentIndex==0) ?false :true
            onCurrentIndexChanged: {
                if (lunarYear.currentIndex!=0 && lunarMonth.currentIndex!=0 && lunarDay.currentIndex!=0) {
                    CD.convertLunar2Solar(lunarDay.currentText, lunarMonth.currentText, lunarYear.currentText, 0, 7)
                    aboveText= lunarDay.currentText +"/" +lunarMonth.currentText +"/" +lunarYear.currentText +"Âm lịch"
                    belowText= CD.solarDayNumber +"/" +CD.solarMonthNumber +"/" +CD.solarYearNumber
                    lunarDayT.visible= true
                    solarDayT.visible= lunarDayT.visible
                }
            }
        }

        Text {
            id: solarDayT
            text: aboveText
            anchors.top: solarYear.bottom
            anchors.topMargin: fromImage.height/2
            x: (parent.width- width)/2
            color: "white"
            font.pixelSize: appWidth/25
            visible: false
        }

        Text {
            id: lunarDayT
            anchors.top: solarDayT.bottom
            anchors.topMargin: height/1.5
            x: (parent.width- width)/2
            color: "white"
            text: belowText
            visible: false
            font.pixelSize: solarDayT.font.pixelSize
        }





    }
}

