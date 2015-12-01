import QtQuick 2.4
import "content" as Content
import "js/GetWeather.js" as GW

Item {
    id: oth

    property string t1Text
    property string t2Text
    property string t3Text
    property string t4Text
    property double mouseEnteredX: -1

    Rectangle {        
        anchors.fill: parent

        Image {
            anchors.fill: parent
            source: "/images/background.png"
        }
        MouseArea {
            anchors.fill: parent
            onEntered:  {
                mouseEnteredX= mouseX
            }
            onReleased: {
                if (Math.abs(mouseEnteredX- mouseX) <10) {
                    hideAllRectangle();
                }
                else if (mouseEnteredX- mouseX > appWidth/3) {
                    changeTabToRight()
                    mouseEnteredX= -1;
                    hideRowOfMainButtonEffect();
                }
                else if (mouseX- mouseEnteredX > appWidth/3) {
                    changeTabToLeft();
                    mouseEnteredX= -1;
                    hideRowOfMainButtonEffect();
                }
            }
        }

        ImageButton {
            id: clockButton
            width: parent.width*0.7
            height: parent.height/7.5
            y: height
            x: (parent.width- width)/2
            source: "/images/worldClock.png"
            onPressed: opacity=0.6
            onReleased: opacity=1
            onClicked: {
                hideAllRectangle()
                worldClocks.visible= true
                showWorldClocks.start()
            }
        }
        ImageButton {
            id: weatherButton
            x: clockButton.x
            y: clockButton.y+height*1.5
            width: clockButton.width
            height: clockButton.height
            source: "/images/weather.png"
            onPressed: opacity=0.6
            onReleased: opacity=1
            onClicked: {
                getWeather()
                hideAllRectangle();
                nextDaysWeather.visible= true
                showWeather.start()
            }
        }
        ImageButton {
            id: contactButton
            x: clockButton.x
            y: weatherButton.y + height*1.5
            width: clockButton.width
            height: clockButton.height
            source: "/images/contact.png"
            onPressed: opacity=0.6
            onReleased: opacity=1
            onClicked: {
                hideAllRectangle();
                teamAbout.visible=true
                showTeamAbout.start()
            }
        }
        ImageButton {
            id: aboutButton
            x: clockButton.x
            y: contactButton.y +height*1.5
            width: clockButton.width
            height: clockButton.height
            source: "/images/about.png"
            onPressed: opacity=0.6
            onReleased: opacity=1
            onClicked: {
                hideAllRectangle();
                appAbout.visible=true
                showAppAbout.start()
            }
        }

        Rectangle {
            id: nextDaysWeather
            width: worldClocks.width
            height: worldClocks.height
            anchors.top: worldClocks.top
            anchors.left: worldClocks.left
            visible: false
            Image {
                source: "/images/rectangle.png"
                anchors.fill: parent
            }
            Text {
                id: name2
                text: "Weather"
                font.pixelSize: parent.width/12
                anchors.top: parent.top
                anchors.topMargin: height/3*2
                x: (parent.width- width)/2
            }
            MouseArea {
                anchors.fill: parent
                onEntered:  {
                    mouseEnteredX= mouseX
                }
                onReleased: {
                    if (mouseEnteredX- mouseX > appWidth/3) {
                        changeTabToRight()
                        mouseEnteredX= -1;
                        hideRowOfMainButtonEffect();
                    }
                    else if (mouseX- mouseEnteredX > appWidth/3) {
                        changeTabToLeft();
                        mouseEnteredX= -1;
                        hideRowOfMainButtonEffect();
                    }
                }
            }


            Rectangle {
                id: r1
                height: (parent.height- name2.y- name2.height*1.5)/4
                width: parent.width*0.8
                x: parent.width*0.1
                anchors.top: name2.bottom
                anchors.topMargin: name2.height/10
                Image {
                    height: t1.height* 1.25
                    width: parent.width
                    y: t1.y- t1.height*0.125
                    source: "/images/rectangle.png"
                }
                Text {
                    id: t1
                    text: t1Text
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width*0.075
                    anchors.top: parent.top
                    anchors.topMargin: (parent.height- height)/2
                    color: "#070777"
                    font.pixelSize: appWidth/28
                }
            }

            Rectangle {
                id: r2
                height: r1.height
                width: r1.width
                anchors.top: r1.bottom
                anchors.left: r1.left
                Image {
                    height: t2.height*1.25
                    width: parent.width
                    y: t2.y- t2.height*0.125
                    source: "/images/rectangle.png"
                }
                Text {
                    id: t2
                    text: t2Text
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width*0.075
                    anchors.top: parent.top
                    anchors.topMargin: (parent.height- height)/2
                    color: "#070777"
                    font.pixelSize: appWidth/28
                }
            }

            Rectangle {
                id: r3
                height: r1.height
                width: r1.width
                anchors.top: r2.bottom
                anchors.left: r1.left
                Image {
                    height: t3.height*1.25
                    width: parent.width
                    y: t3.y- t3.height*0.125
                    source: "/images/rectangle.png"
                }
                Text {
                    id: t3
                    text: t3Text
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width*0.075
                    anchors.top: parent.top
                    anchors.topMargin: (parent.height- height)/2
                    color: "#070777"
                    font.pixelSize: appWidth/28
                }
            }

            Rectangle {
                id: r4
                height: r1.height
                width: r1.width
                anchors.top: r3.bottom
                anchors.left: r1.left
                Image {
                    height: t4.height*1.25
                    width: parent.width
                    y: t4.y- t4.height*0.125
                    source: "/images/rectangle.png"
                }
                Text {
                    id: t4
                    text: t4Text
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width*0.075
                    anchors.top: parent.top
                    anchors.topMargin: (parent.height- height)/2
                    color: "#070777"
                    font.pixelSize: appWidth/28
                }
            }

        }

        Rectangle {
            id: appAbout
            width: worldClocks.width
            height: worldClocks.height
            anchors.top: worldClocks.top
            anchors.left: worldClocks.left
            visible: false
            Image {
                source: "/images/rectangle.png"
                anchors.fill: parent
            }
            Text {
                id: name3
                text: "About"
                font.pixelSize: parent.width/12
                anchors.top: parent.top
                anchors.topMargin: height/3*2
                x: (parent.width- width)/2
            }
            MouseArea {
                anchors.fill: parent
                onEntered:  {
                    mouseEnteredX= mouseX
                }
                onReleased: {
                    if (mouseEnteredX- mouseX > appWidth/3) {
                        changeTabToRight()
                        mouseEnteredX= -1;
                        hideRowOfMainButtonEffect();
                    }
                    else if (mouseX- mouseEnteredX > appWidth/3) {
                        changeTabToLeft();
                        mouseEnteredX= -1;
                        hideRowOfMainButtonEffect();
                    }
                }
            }
            Text {
                wrapMode: Text.Wrap
                color: "#070777"
                id: aboutText
                font.pixelSize: appWidth/28
                text: qsTr("Ứng dụng lịch vạn niên được viết bởi nhóm NoName là ứng dụng lịch của người trẻ, ứng dụng được tạo ra với mong muống phục vụ nhu cầu tra cứu ngày tháng, cập nhật thời tiết, giờ tại các quốc gia trên thế giới.");
                width: parent.width*0.85
                anchors.top: name3.bottom
                anchors.topMargin: name3.height*0.75
                x: (parent.width- width)/2
                horizontalAlignment: Text.AlignHCenter
            }

        }

        Rectangle {
            id: teamAbout
            width: worldClocks.width
            height: worldClocks.height
            anchors.top: worldClocks.top
            anchors.left: worldClocks.left
            visible: false
            Image {
                source: "/images/rectangle.png"
                anchors.fill: parent
            }
            Text {
                id: name4
                text: "Contact"
                font.pixelSize: parent.width/12
                anchors.top: parent.top
                anchors.topMargin: height/3*2
                x: (parent.width- width)/2
            }
            MouseArea {
                anchors.fill: parent
                onEntered:  {
                    mouseEnteredX= mouseX
                }
                onReleased: {
                    if (mouseEnteredX- mouseX > appWidth/3) {
                        changeTabToRight()
                        mouseEnteredX= -1;
                        hideRowOfMainButtonEffect();
                    }
                    else if (mouseX- mouseEnteredX > appWidth/3) {
                        changeTabToLeft();
                        mouseEnteredX= -1;
                        hideRowOfMainButtonEffect();
                    }
                }
            }

            Image {
                id: img1
                x: parent.width/10
                y: name4.y + name4.height*1.5
                width: (parent.height- name4.y- name4.height*0.5)/7
                height: width
                source: "/images/huy.png"
            }
            Text {
                font.pixelSize: aboutText.font.pixelSize
                id: nam1
                text: qsTr("Trần Quang Huy")
                anchors.left: img1.right
                anchors.leftMargin: parent.width/10
                anchors.top: img1.top
                color: "#070777"
            }
            Text {
                id: ema1
                text: qsTr("Email:")
                anchors.left: nam1.left
                anchors.top: nam1.bottom
                anchors.topMargin: nam1.height*0.75
                font.pixelSize: aboutText.font.pixelSize
                color: "#070777"
            }

            Image {
                id: img2
                x: img1.x
                width: img1.width
                height: width
                source: "/images/hung.png"
                anchors.top: img1.bottom
                anchors.topMargin: width/4
            }
            Text {
                id: nam2
                font.pixelSize: aboutText.font.pixelSize
                anchors.left: nam1.left
                text: qsTr("Nguyễn Huy Hưng")
                color: "#070777"
                anchors.top: img2.top
            }
            Text {
                id: ema2
                anchors.left: nam1.left
                text: qsTr("Email:")
                anchors.top: nam2.bottom
                anchors.topMargin: nam2.height*0.75
                color: "#070777"
                font.pixelSize: aboutText.font.pixelSize
            }

            Image {
                id: img3
                x: img1.x
                width: img1.width
                height: width
                source: "/images/hoan.png"
                anchors.top: img2.bottom
                anchors.topMargin: width/4
            }
            Text {
                id: nam3
                anchors.left: nam1.left
                text: qsTr("Trần Văn Hoàn")
                anchors.top: img3.top
                color: "#070777"
                font.pixelSize: aboutText.font.pixelSize
            }
            Text {
                id: ema3
                anchors.left: nam1.left
                text: qsTr("Email:")
                color: "#070777"
                anchors.top: nam3.bottom
                anchors.topMargin: nam3.height*0.75
                font.pixelSize: aboutText.font.pixelSize
            }

            Image {
                id: img4
                x: img1.x
                width: img1.width
                height: width
                source: "/images/phuc.png"
                anchors.top: img3.bottom
                anchors.topMargin: width/4
            }
            Text {
                id: nam4
                anchors.left: nam1.left
                text: qsTr("Đỗ Hoàng Phúc")
                anchors.top: img4.top
                color: "#070777"
                font.pixelSize: aboutText.font.pixelSize
            }
            Text {
                id: ema4
                anchors.left: nam1.left
                color: "#070777"
                font.pixelSize: aboutText.font.pixelSize
                text: qsTr("Email:")
                anchors.top: nam4.bottom
                anchors.topMargin: nam4.height*0.75
            }

            Image {
                id: img5
                x: img1.x
                width: img1.width
                height: width
                source: "/images/trang.png"
                anchors.top: img4.bottom
                anchors.topMargin: width/4
            }
            Text {
                font.pixelSize: aboutText.font.pixelSize
                id: nam5
                anchors.left: nam1.left
                text: qsTr("Quách Thị Như Trang")
                color: "#070777"
                anchors.top: img5.top
            }
            Text {
                id: ema5
                anchors.left: nam1.left
                font.pixelSize: aboutText.font.pixelSize
                text: qsTr("Email:")
                anchors.top: nam5.bottom
                anchors.topMargin: nam5.height*0.75
                color: "#070777"
            }
        }

        Rectangle {
            id: worldClocks
            width: parent.width*0.9
            height: parent.height*0.9
            anchors.top: parent.top
            anchors.topMargin: (parent.height- height)/2
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.05
            visible: false
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
            MouseArea {
                anchors.fill: parent
                onEntered:  {
                    mouseEnteredX= mouseX
                }
                onReleased: {
                    if (mouseEnteredX- mouseX > appWidth/3) {
                        changeTabToRight()
                        mouseEnteredX= -1;
                        hideRowOfMainButtonEffect();
                    }
                    else if (mouseX- mouseEnteredX > appWidth/3) {
                        changeTabToLeft();
                        mouseEnteredX= -1;
                        hideRowOfMainButtonEffect();
                    }
                }
            }

            Content.Clock {
                id: clo1
                scale: (parent.width/2.5)/width
                anchors.top: name1.bottom
                anchors.topMargin: (parent.height- ((height*2- name1.height))*scale)/2.75
                anchors.left: parent.left
                anchors.leftMargin: (parent.width*0.2/3)*scale
                city: "New York"; shift: -4
            }
            Content.Clock {
                id: clo2
                anchors.top: clo1.top
                anchors.right: parent.right
                anchors.rightMargin: (parent.width*0.2/3)*scale
                scale: clo1.scale
                city: "London"; shift: 0
            }
            Content.Clock {
                id: clo3
                anchors.top: clo1.bottom
                anchors.topMargin: name1.height*scale*1.2
                anchors.left: clo1.left
                scale: clo1.scale
                city: "Mumbai"; shift: 5.5
            }
            Content.Clock {
                id: clo4
                anchors.top: clo3.top
                anchors.right: clo2.right
                scale: clo1.scale
                city: "Tokyo"; shift: 9
            }
        }


        NumberAnimation {
            id: showWorldClocks
            target: worldClocks
            property: "opacity"
            duration: 350
            easing.type: Easing.InOutQuad
            from: 0
            to: 1
        }
        NumberAnimation {
            id: showWeather
            target: nextDaysWeather
            property: "opacity"
            duration: 350
            easing.type: Easing.InOutQuad
            from: 0
            to: 1
        }
        NumberAnimation {
            id: showTeamAbout
            target: teamAbout
            property: "opacity"
            duration: 350
            easing.type: Easing.InOutQuad
            from: 0
            to: 1
        }
        NumberAnimation {
            id: showAppAbout
            target: appAbout
            property: "opacity"
            duration: 350
            easing.type: Easing.InOutQuad
            from: 0
            to: 1
        }

    }

    function hideAllRectangle() {
        appAbout.visible= false
        teamAbout.visible= false
        worldClocks.visible= false
        nextDaysWeather.visible= false
    }

    function getWeather() {
        var xmlhttp = new XMLHttpRequest();
        var url = "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20%3D%2091888417&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys";

        xmlhttp.onreadystatechange=function() {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                var response = JSON.parse(xmlhttp.responseText);

                t1Text= response.query.results.channel.item.forecast[1].day +", "
                t1Text+= response.query.results.channel.item.forecast[1].date +"\n"
                t1Text+= response.query.results.channel.item.forecast[1].text +":  "
                t1Text+= Math.round((response.query.results.channel.item.forecast[1].low-32)/1.8) +"~" +Math.round((response.query.results.channel.item.forecast[1].high-32)/1.8) +"°C";

                t2Text= response.query.results.channel.item.forecast[2].day +", "
                t2Text+= response.query.results.channel.item.forecast[2].date +"\n"
                t2Text+= response.query.results.channel.item.forecast[2].text +":  "
                t2Text+= Math.round((response.query.results.channel.item.forecast[2].low-32)/1.8) +"~" +Math.round((response.query.results.channel.item.forecast[2].high-32)/1.8) +"°C";

                t3Text= response.query.results.channel.item.forecast[3].day +", "
                t3Text+= response.query.results.channel.item.forecast[3].date +"\n"
                t3Text+= response.query.results.channel.item.forecast[3].text +":  "
                t3Text+= Math.round((response.query.results.channel.item.forecast[3].low-32)/1.8) +"~" +Math.round((response.query.results.channel.item.forecast[3].high-32)/1.8) +"°C";

                t4Text= response.query.results.channel.item.forecast[4].day +", "
                t4Text+= response.query.results.channel.item.forecast[4].date +"\n"
                t4Text+= response.query.results.channel.item.forecast[4].text +":  "
                t4Text+= Math.round((response.query.results.channel.item.forecast[4].low-32)/1.8) +"~" +Math.round((response.query.results.channel.item.forecast[4].high-32)/1.8) +"°C";
            }
        }
        xmlhttp.open("GET", url, true);
        xmlhttp.send();
    }

}

