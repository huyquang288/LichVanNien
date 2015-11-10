import QtQuick 2.4
import QtQuick.Controls 1.4
import "js/DayCalendar.js" as DC
import "js/ConvertDay.js" as CD
import "js/GetWeather.js" as GW

Item {
    id: dayCal

    // bien thoi gian
    property date currentTime: new Date()

    // nhiet do
    property int temperature: 0
    property string weather: ""

    // bien ngay hom nay
    property date today: new Date ()

    // bien luu khi su kien vuot thay doi ngay thang xay ra.
    property date selectedDay: today

    // day la thu trong tuan
    property int dayToShow : today.getDay()
    property int dateToShow : today.getDate()
    property int monthToShow: today.getMonth()+1
    property int yearToShow: today.getFullYear()

    //source anh
    property string firstNumberImageSource: (dateToShow<10) ?("/images/numbers/" +dateToShow +".png") :("/images/numbers/" +Math.floor(dateToShow/10) +".png")
    property string secondNumberImageSource: "/images/numbers/" + dateToShow%10 +".png"
    property string lunarDayImageSource: "/images/12ConGiap/" +DC.chiForDayImage[(Math.floor(CD.jdFromDate(dateToShow,monthToShow, yearToShow)+1.5)%12)]  +".png"
    property string lunarYearImageSource: "/images/12ConGiap/" +DC.chiForYearImage[(lunarYearNumber%12)] +".png"
    property string weatherImageSource: "/images/weathers/" +(currentTime.getHours()>5 && (currentTime.getHours()<18) ?"day" :"night") +".png"

    // luu gia tri ngay am lich
    property int lunarDayNumber: CD.getLunarDate(dateToShow, monthToShow, yearToShow)
    property int lunarMonthNumber: CD.getLunarMonth()
    property int lunarYearNumber: CD.getLunarYear()

    // su kien vuot trai, phai de chuyen ngay
    property double mouseEnteredX: -1;
    Component.onCompleted: {
        //CD.convertSolar2Lunar(3, 11, 2015, 0);
    }

    // su dung de update thoi gian lien tuc moi 30s
    Timer {
        interval: 5000
        running: true
        repeat: true
        onTriggered: {
            GW.getWeather()
            currentTime= new Date();
            if (weather.indexOf('Cloudy')!=-1) {
                if (weather.indexOf('Mostly')!=-1 || (currentTime.getHours()<6 || currentTime.getHours()>18)) {
                    weatherImageSource= "/images/weathers/cloudy.png"
                } else {
                    weatherImageSource= "/images/weathers/sunnycloudy.png"
                }
            } else if (weather.indexOf('Showers')!=-1) {
                weatherImageSource= "/images/weathers/rainy.png"
            } else {
                weatherImageSource= "/images/weathers/" +(currentTime.getHours()>5 && (currentTime.getHours()<18) ?"day" :"night") +".png";
            }

        }
    }


    // top banner
    Rectangle {
        id: topBanner
        width: appWidth
        height: appHight/15
        x: 0
        y: 0
        Image {
            anchors.fill: parent
            source: "/images/topBanner.png"
        }
        Image {
            source: "/images/teamName.png"
            anchors.left: parent.left
            anchors.top: parent.top
            height: parent.height
            width: parent.width/5
        }
        Image {
            source: "/images/appName.png"
            height: parent.height/3*2
            width: parent.width/2
            x: (parent.width-width)/2
            y: (parent.height-height)/2
        }
        ImageButton {
            width: parent.width/25 * 4
            height: parent.height/3*2
            source: "/images/today.png"
            anchors.right: parent.right
            anchors.rightMargin: parent.height/6
            anchors.top: parent.top
            anchors.topMargin: parent.height/6
            onClicked: {
                selectedDay= today
                changeDay()
            }
            onPressed: opacity=0.6
            onReleased: opacity=1
        }
    }

    Rectangle {
        id: detailRectangle
        color: "grey"
        anchors.top: topBanner.bottom
        x: 0
        width: parent.width
        height: parent.height- topBanner.height

        Image {
            source: "/images/background.png"
            anchors.fill: parent
        }

        Rectangle {
            id: square
            y: height/20
            x: (appWidth- width)/2
            width: appWidth*0.75
            height: width*0.925

            MouseArea {
                id: mouseAreaForSolarDay;
                anchors.fill: parent
                enabled: true;
                onEntered:  {
                    mouseEnteredX= mouseX
                    //mouseEnteredY= mouseY
                }

                onReleased: {
                    // vuot sang trai
                    if (Math.abs(mouseEnteredX- mouseX) >parent.width/3) {
                        if (mouseEnteredX- mouseX > parent.width/3) {
                            selectedDay= new Date(selectedDay.getTime() + 24*60*60*1000)
                        }
                        // vuot sang phai
                        else if (mouseX- mouseEnteredX > parent.width/3) {
                            selectedDay= new Date(selectedDay.getTime() - 24*60*60*1000)
                        }
                        changeDay();
                    }
                }
            }

            Image {
                source: "/images/square.png"
                anchors.fill: parent
                opacity: 1
            }

            // anh nam am lich
            Image {
                id: lunarYearImage
                source: lunarYearImageSource
                anchors.top: parent.top
                anchors.topMargin: height/10
                x: (square.width- solarMonthYear.width- width)/2
                height: appWidth/10.5
                width: height
            }

            // thang + nam duong lich
            Text {
                id: solarMonthYear
                color: "#11b22c"
                font.pixelSize: appWidth/16
                anchors.bottom: lunarYearImage.bottom
                x: (square.width- width- lunarYearImage.width)/2 + lunarYearImage.width
                text: "Tháng " +monthToShow+ " Năm " + yearToShow
            }

            // thu*'
            Text {
                id: date
                anchors.top: solarMonthYear.bottom
                anchors.topMargin: solarMonthYear.height*0.1
                x: (square.width- width)/2
                font.pixelSize: appWidth/19
                color: "#f20707"
                text: DC.weekday[dayToShow]
            }

            // hai chu so cua ngay duong lich
            Image {
                id: firstNumberImage
                width: appWidth/5.5
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
                width: lunarYearImage.width*1.6
                height: width
            }
        }


        // tuc ngu
        Text {
            wrapMode: Text.Wrap
            color: "#070777"
            id: idiom
            font.pixelSize: appWidth/28
            text: qsTr("Tại Châu Phi, mỗi buổi sáng thức dậy một con báo biết rằng để tồn tại, nó phải chạy nhanh hơn con hươu chạy chậm nhất");
            width: appWidth*0.85
            anchors.top: square.bottom
            anchors.topMargin: date.height/3.5
            x: (appWidth- width)/2
            horizontalAlignment: Text.AlignHCenter
        }

        Rectangle {
            id: rect
            width: appWidth*0.98
            height: (detailRectangle.height- idiom.y- idiom.height- date.height/3.5)/2
            anchors.top: idiom.bottom
            anchors.topMargin: date.height/3.5
            x: appWidth*0.01

            Image {
                anchors.fill: parent
                source: "/images/rectangle.png"
            }

            Image {
                id: clockImage
                source: "/images/clock.png"
                height: dayDetail.height*2
                width: height
                anchors.top: parent.top
                anchors.topMargin: height/3.5
                anchors.left: parent.left
                anchors.leftMargin: height
            }

            Text {
                color: "#f20707"
                font.pixelSize: appWidth/18
                anchors.left: clockImage.right
                anchors.leftMargin: clockImage.width/5
                anchors.bottom: clockImage.bottom
                anchors.bottomMargin: (clockImage.height- font.pixelSize)/2
                text: ((currentTime.getHours()>9) ?currentTime.getHours() :("0" +currentTime.getHours())) +":" +((currentTime.getMinutes()>9) ?currentTime.getMinutes() :("0" +currentTime.getMinutes()))
            }

            Text {
                id: tem
                color: "#f20707"
                font.pixelSize: appWidth/22
                anchors.right: weatherImage.left
                anchors.rightMargin: weatherImage.width/5
                anchors.top: weatherImage.top
                anchors.topMargin: font.pixelSize/20
                text: temperature +"°C"
            }

            Text {
                color: "#093e9b"
                font.pixelSize: appWidth/32
                anchors.right: weatherImage.left
                anchors.rightMargin: weatherImage.width/5
                anchors.bottom: weatherImage.bottom
                anchors.bottomMargin: (weatherImage.height- tem.height)/10
                text: "Hà Nội"
            }

            Image {
                id: weatherImage
                source: weatherImageSource
                height: clockImage.height
                width: height
                anchors.top: clockImage.top
                anchors.right: parent.right
                anchors.rightMargin: height
            }

            ImageButton {
                id: dayDetail
                source: "/images/dayDetail.png"
                x: (rect.width- width)/2
                anchors.bottom: parent.bottom
                anchors.bottomMargin: height/4
                width: rect.width/2.8
                height: rect.height/3.8
                onClicked: {

                }
                onPressed: opacity=0.6
                onReleased: opacity=1
            }
        }

        Text {
            id: day1
            color: "#093e9b"
            font.pixelSize: idiom.font.pixelSize
            text: qsTr("Ngày")
            anchors.top: rect.bottom
            anchors.topMargin: font.pixelSize/10
            x: (appWidth/3- width)/2
        }
        Text {
            id: day2
            color: "#070777"
            font.pixelSize: solarMonthYear.font.pixelSize
            anchors.top: day1.bottom
            anchors.topMargin: font.pixelSize/10
            x: (appWidth/3- width)/2
            text: lunarDayNumber
        }
        Text {
            color: "#093e9b"
            text: DC.can[Math.floor(CD.jdFromDate(dateToShow, monthToShow, yearToShow) +9.5)%10] +" " +DC.chiForText[Math.floor(CD.jdFromDate(dateToShow, monthToShow, yearToShow) +1.5)%12]
            anchors.top: day2.bottom
            anchors.topMargin: font.pixelSize/10
            x: (appWidth/3- width)/2
        }

        // thang
        Text {
            id: mon1
            color: "#093e9b"
            font.pixelSize: idiom.font.pixelSize
            text: qsTr("Tháng")
            anchors.top: rect.bottom
            anchors.topMargin: font.pixelSize/10
            x: (appWidth/3- width)/2 +appWidth/3
        }
        Text {
            id: mon2
            color: "#070777"
            font.pixelSize: solarMonthYear.font.pixelSize
            anchors.top: mon1.bottom
            anchors.topMargin: font.pixelSize/10
            x: (appWidth/3- width)/2 +appWidth/3
            text: lunarMonthNumber
        }
        Text {
            color: "#093e9b"
            text: DC.can[(lunarYearNumber*12+lunarMonthNumber+3)%10] +" " +DC.chiForText[(lunarMonthNumber+1)%12]
            anchors.top: mon2.bottom
            anchors.topMargin: font.pixelSize/10
            x: (appWidth/3- width)/2 +appWidth/3
        }

        // nam
        Text {
            id: yea1
            color: "#093e9b"
            font.pixelSize: idiom.font.pixelSize
            text: qsTr("Năm")
            anchors.top: rect.bottom
            anchors.topMargin: font.pixelSize/10
            x: (appWidth/3- width)/2 +appWidth/3*2
        }
        Text {
            id: yea2
            color: "#070777"
            font.pixelSize: solarMonthYear.font.pixelSize
            anchors.top: yea1.bottom
            anchors.topMargin: font.pixelSize/10
            x: (appWidth/3- width)/2 +appWidth/3*2
            text: lunarYearNumber
        }
        Text {
            color: "#093e9b"
            text: DC.can[(lunarYearNumber+6)%10] +" " +DC.chiForText[(lunarYearNumber+8)%12]
            anchors.top: yea2.bottom
            anchors.topMargin: font.pixelSize/10
            x: (appWidth/3- width)/2 +appWidth/3*2
        }

    }

    function changeDay() {
        // thay doi gia tri cua cac thong so hien thi tren man hinh
        // day la thu trong tuan
        dayToShow = selectedDay.getDay()
        dateToShow = selectedDay.getDate()
        monthToShow= selectedDay.getMonth()+1
        yearToShow= selectedDay.getFullYear()

        //source anh
        firstNumberImageSource= (dateToShow<10) ?("/images/numbers/" +dateToShow +".png") :("/images/numbers/" +Math.floor(dateToShow/10) +".png")
        secondNumberImageSource= "/images/numbers/" + dateToShow%10 +".png"
        lunarDayImageSource= "/images/12ConGiap/" +DC.chiForDayImage[(Math.floor(CD.jdFromDate(dateToShow,monthToShow, yearToShow)+1.5)%12)]  +".png"
        lunarYearImageSource= "/images/12ConGiap/" +DC.chiForYearImage[(lunarYearNumber%12)] +".png"

        // luu gia tri ngay am lich
        lunarDayNumber= CD.getLunarDate(dateToShow, monthToShow, yearToShow)
        lunarMonthNumber= CD.getLunarMonth()
        lunarYearNumber= CD.getLunarYear()

        // xoa su kien luu dien bat dau cua su kien vuot
        mouseEnteredX= -1;
    }

}

