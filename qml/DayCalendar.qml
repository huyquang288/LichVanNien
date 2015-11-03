import QtQuick 2.4
import QtQuick.Controls 1.4
import "js/DayCalendar.js" as DC
import "js/ConvertDay.js" as CD

Item {
    id: dayCal
    signal clicked ()
    property date today: new Date ()
    property int dayToShow : today.getDay()
    property int dateToShow : today.getDate()
    property int monthToShow: today.getMonth()+1
    property int yearToShow: today.getFullYear()
    property string firstNumberImageSource: (dateToShow<10) ?("/images/numbers/" +dateToShow +".png") :("/images/numbers/" +dateToShow/10 +".png")
    property string secondNumberImageSource: "/images/numbers/" + dateToShow%10 +".png"
    property string lunarDayImageSource: "/images/12ConGiap/" +DC.chiForDayImage[(Math.floor(CD.jdFromDate(dateToShow,monthToShow, yearToShow)+1.5)%12)]  +".png"
    property string lunarYearImageSource: "/images/12ConGiap/" +DC.chiForYearImage[(yearToShow%12)] +".png"

    Component.onCompleted: {
        //CD.convertSolar2Lunar(3, 11, 2015, 0);
    }

    Rectangle {
        color: "grey"
        anchors.fill: parent

        Image {
            source: "/images/background.png"
            anchors.fill: parent
        }

        Rectangle {
            id: square
            y: height/8
            x: (appWidth- width)/2
            width: appWidth*0.75
            height: width/6*6.5

            MouseArea {
                //anchors.fill: parent
                onClicked: {
                    dayCal.clicked ()
                }
            }

            Image {
                source: "/images/square.png"
                anchors.fill: parent
            }

            // anh nam am lich
            Image {
                id: lunarYearImage
                source: lunarYearImageSource
                anchors.top: parent.top
                anchors.topMargin: height/2
                x: (square.width- solarMonthYear.width- width)/2
                height: appWidth/14
                width: height
            }

            // thang + nam duong lich
            Text {
                id: solarMonthYear
                color: "#11b22c"
                font.pixelSize: appWidth/18
                anchors.bottom: lunarYearImage.bottom
                x: (square.width- width- lunarYearImage.width)/2 + lunarYearImage.width
                text: "Tháng " +monthToShow+ " Năm " + yearToShow
            }

            // thu*'
            Text {
                id: date
                anchors.top: solarMonthYear.bottom
                anchors.topMargin: solarMonthYear.height*0.2
                x: (square.width- width)/2
                font.pixelSize: appWidth/22
                color: "red"
                text: DC.weekday[dayToShow]
            }

            // hai chu so cua ngay duong lich
            Image {
                id: firstNumberImage
                width: appWidth/7
                height: width*1.6
                x: (dateToShow<10) ?(square.width- width)/2 :(square.width- width- secondNumberImage.width)/2
                anchors.top: date.bottom
                anchors.topMargin: date.height/2
                source: firstNumberImageSource
            }
            Image {
                id: secondNumberImage
                height: firstNumberImage.height
                width: firstNumberImage.width
                y: firstNumberImage.y
                visible: (dateToShow<10) ?false :true
                x: (square.width- width- firstNumberImage.width)/2 + firstNumberImage.width
                source: secondNumberImageSource
            }

            // anh con giap dai dien cho ngay am lich
            Image {
                id: lunarDayImage
                source: lunarDayImageSource
                anchors.top: firstNumberImage.bottom
                anchors.topMargin: date.height/2
                x: (square.width- width)/2
                width: lunarYearImage.width*1.4
                height: width
            }
        }



        // tuc ngu
        Text {
            wrapMode: Text.Wrap
            id: idiom
            text: qsTr("Một buổi sáng tại Châu Phi, một con báo phải biết rằng để tồn tại, nó phải chạy nhanh hơn con nai chạy chậm nhất");
            width: appWidth*0.8
            anchors.top: square.bottom
            anchors.topMargin: date.height/2
            x: (appWidth- width)/2
        }

        Rectangle {
            id: rect
            width: appWidth
            height: appWidth/5
            anchors.top: idiom.bottom
            anchors.topMargin: date.height/2
            x: 0
            Image {
                anchors.fill: parent
                source: "/images/rectange.png"
            }
        }

    }

}

