import QtQuick 2.4
import QtQuick.Controls 1.4

Item {
    id: daySwi
    signal clicked ()

    property string swap: "solar"
    Rectangle {        



        color: "yellow"
        anchors.fill: parent
        MouseArea {
            //anchors.fill: parent
            onClicked: {
                daySwi.clicked ()

            }
        }
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
        }

        ComboBox {
            id: solarMonth
            width: parent.width/5
            y: solarYear.y
            x: solarYear.x*2+ solarYear.width
            model: ["Month", 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
            visible: (swap=="solar") ?true :false
            enabled: (solarYear.currentIndex!=0) ?true :false
            /*
            onActivated: {
                //console.log(solarMonth.currentText)
                if (solarMonth.currentText==1 || solarMonth.currentText==3 || solarMonth.currentText==5 || solarMonth.currentText==7 || solarMonth.currentText==8 || solarMonth.currentText==10 || solarMonth.currentText==12) {
                    solarDay1.enabled= true
                }
                else if (solarMonth.currentText==4 || solarMonth.currentText==6 || solarMonth.currentText==9 || solarMonth.currentText==11) {
                    solarDay1.visible= false
                    solarDay2.visible= true
                }
                else if (solarMonth.currentText== 2 && solarYear.currentText%4!=0) {
                    solarDay1.visible= false
                    solarDay3.visible= true
                }
                else if (solarMonth.currentText== 2 && solarYear.currentText%4==0) {
                    solarDay1.visible= false
                    solarDay4.visible= true
                    solarDay4.enabled= true
                }
                //console.log(solarYear.currentText + " " + solarMonth.currentText)

            }
            */
        }

        ComboBox {
            id: solarDay1
            width: parent.width/5
            y: solarYear.y
            x: solarYear.x*3+ solarYear.width*2
            model: ["Day", 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 13, 24, 25, 26, 27, 28, 29, 30, 31];
            visible: (swap=="solar" && solarMonth.currentIndex==0) ?true :((solarMonth.currentText==1 || solarMonth.currentText==3 || solarMonth.currentText==5 || solarMonth.currentText==7 || solarMonth.currentText==8 || solarMonth.currentText==10 || solarMonth.currentText==12) ?true :false);
            enabled: (swap=="solar" && solarMonth.currentIndex==0) ?false :((solarMonth.currentText==1 || solarMonth.currentText==3 || solarMonth.currentText==5 || solarMonth.currentText==7 || solarMonth.currentText==8 || solarMonth.currentText==10 || solarMonth.currentText==12) ?true :false);
        }
        ComboBox {
            id: solarDay2
            width: parent.width/5
            y: solarYear.y
            x: solarYear.x*3+ solarYear.width*2
            model: ["Day", 1, 2, 3, 4, 5 , 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 13, 24, 25, 26, 27, 28, 29, 30];
            visible: (solarMonth.currentText==4 || solarMonth.currentText==6 || solarMonth.currentText==9 || solarMonth.currentText==11) ?true :false
        }

        ComboBox {
            id: solarDay3
            width: parent.width/5
            y: solarYear.y
            x: solarYear.x*3+ solarYear.width*2
            model: ["Day", 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 13, 24, 25, 26, 27, 28];
            visible: (solarMonth.currentText== 2 && solarYear.currentText%4!=0) ?true :false
        }

        ComboBox {
            id: solarDay4
            width: parent.width/5
            y: solarYear.y
            x: solarYear.x*3+ solarYear.width*2
            model: ["Day", 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 13, 24, 25, 26, 27, 28, 29];
            visible: (solarMonth.currentText== 2 && solarYear.currentText%4==0) ?true :false
        }

        ImageButton{
            source: "/images/confirmSwap.png"
            anchors.top: solarYear.bottom
            anchors.topMargin: width
            x: (parent.width- width)/2
            width: parent.width/5
            height: width/2.5
            onClicked: {

            }
        }





    }
}

