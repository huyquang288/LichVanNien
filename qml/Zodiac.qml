import QtQuick 2.4
import "js/Zodiac.js" as Z

Item {
    id: zod
    property int aquariusNumber: 1;
    property int piscesNumber: 2;
    property int ariesNumber: 3;
    property int taurusNumber: 4;
    property int geminiNumber: 5
    property int cancerNumber: 6
    property int leoNumber: 7
    property int virgoNumber: 8
    property int libraNumber: 9
    property int scorpioNumber: 10
    property int sagittariousNumber: 11
    property int capricornNumber: 12

    property string zodiacIconSource: "/images/zodiacs/virgo.png";
    property string focusZodiacName: "ZODIAC"
    property string dayOfZodiac: "28/08/1994"
    property string text1: "Cung Xử Nữ được Thủy Tinh bảo hộ, tượng trưng cho trí tuệ, lòng chung thủy, cầu toàn nguyên tắc"
    property string text2: "Ngày hôm nay của " +focusZodiacName + "  {｡^◕‿◔^｡}"
    property string workHeartsSource: ""
    property string loveHeartsSource: ""
    property string emotionHeartsSource: ""
    property string luckyHeartsSource: ""
    property string moneyHeartsSource: ""

    Rectangle {
        color: "orange"
        anchors.fill: parent
        MouseArea {
            anchors.fill: parent
            onEntered:  {
                mouseEnteredX= mouseX
            }
            onReleased: {
                if (aquarius.opacity==0 && Math.abs(mouseEnteredX- mouseX) <10) {
                    showZodiacsList.start()
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
        Rectangle {
            id: topBanner
            width: appWidth
            height: appHight/7
            x: 0
            y: 0
            color: "skyblue"
            Text {
                y: 0
                x: 50
                id: tabName
                text: qsTr("Ngày hôm nay của")
            }
            Text {
                y: 40
                x: 50
                text: qsTr("12 cung hoàng đạo")
            }
        }

        // bao binh
        Rectangle {
            id: aquarius
            anchors.top: topBanner.bottom
            anchors.topMargin: height
            height: (parent.height- topBanner.height)/18
            width: parent.width*0.8
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.05
            MouseArea {
                anchors.fill: parent
                onPressed: parent.opacity= 0.6
                onExited: parent.opacity=1
                onClicked: {
                    exceptAquarius.start()
                    Z.getIndex(aquariusNumber)
                }
            }
            Image {
                source: "/images/zodiacs/aquarius2.png"
                height: parent.height
                width: height
                x: width/3
            }
            Text {
                font.pixelSize: parent.height*0.6
                x: parent.height*5/3
                y: (parent.height- height)/2
                text: qsTr("Bảo bình - Aquarius (20/1→18/2)")
            }
        }

        // song ngu
        Rectangle {
            id: pisces
            width: aquarius.width
            height: aquarius.height
            anchors.top: aquarius.bottom
            anchors.topMargin: height/3
            anchors.left: aquarius.left
            MouseArea {
                anchors.fill: parent
                onPressed: parent.opacity= 0.6
                onExited: parent.opacity=1
                onClicked: {
                    exceptPisces.start()
                    Z.getIndex(piscesNumber)
                }
            }
            Image {
                source: "/images/zodiacs/pisces2.png"
                height: parent.height
                width: height
                x: width/3
            }
            Text {
                font.pixelSize: parent.height*0.6
                x: parent.height*5/3
                y: (parent.height- height)/2
                text: qsTr("Song ngư - Pisces (19/2→20/3)")
            }
        }

        // bach duong
        Rectangle {
            id: aries
            width: aquarius.width
            height: aquarius.height
            anchors.top: pisces.bottom
            anchors.topMargin: height/3
            anchors.left: aquarius.left
            MouseArea {
                anchors.fill: parent
                onPressed: parent.opacity= 0.6
                onExited: parent.opacity=1
                onClicked: {
                    exceptAries.start()
                    Z.getIndex(ariesNumber)
                }
            }
            Image {
                source: "/images/zodiacs/aries2.png"
                height: parent.height
                width: height
                x: width/3
            }
            Text {
                font.pixelSize: parent.height*0.6
                x: parent.height*5/3
                y: (parent.height- height)/2
                text: qsTr("Bạch dương - Aries (21/3→19/4)")
            }
        }

        // kim nguu
        Rectangle {
            id: taurus
            width: aquarius.width
            height: aquarius.height
            anchors.top: aries.bottom
            anchors.topMargin: height/3
            anchors.left: aquarius.left
            MouseArea {
                anchors.fill: parent
                onPressed: parent.opacity= 0.6
                onExited: parent.opacity=1
                onClicked: {
                    exceptTaurus.start()
                    Z.getIndex(taurusNumber)
                }
            }
            Image {
                source: "/images/zodiacs/taurus2.png"
                height: parent.height
                width: height
                x: width/3
            }
            Text {
                font.pixelSize: parent.height*0.6
                x: parent.height*5/3
                y: (parent.height- height)/2
                text: qsTr("Kim ngưu - Taurus (20/4→20/5)")
            }
        }

        // song tu
        Rectangle {
            id: gemini
            width: aquarius.width
            height: aquarius.height
            anchors.top: taurus.bottom
            anchors.topMargin: height/3
            anchors.left: aquarius.left
            MouseArea {
                anchors.fill: parent
                onPressed: parent.opacity= 0.6
                onExited: parent.opacity=1
                onClicked: {
                    exceptGemini.start()
                    Z.getIndex(geminiNumber)
                }
            }
            Image {
                source: "/images/zodiacs/gemini2.png"
                height: parent.height
                width: height
                x: width/3
            }
            Text {
                font.pixelSize: parent.height*0.6
                x: parent.height*5/3
                y: (parent.height- height)/2
                text: qsTr("Song tử - Gemini (21/5→21/6)")
            }
        }

        //cu giai
        Rectangle {
            id: cancer
            width: aquarius.width
            height: aquarius.height
            anchors.top: gemini.bottom
            anchors.topMargin: height/3
            anchors.left: aquarius.left
            MouseArea {
                anchors.fill: parent
                onPressed: parent.opacity= 0.6
                onExited: parent.opacity=1
                onClicked: {
                    exceptCancer.start()
                    Z.getIndex(cancerNumber)
                }
            }
            Image {
                source: "/images/zodiacs/cancer2.png"
                height: parent.height
                width: height
                x: width/3
            }
            Text {
                font.pixelSize: parent.height*0.6
                x: parent.height*5/3
                y: (parent.height- height)/2
                text: qsTr("Cự giải - Cancer (22/6→22/7)")
            }
        }

        // su tu
        Rectangle {
            id: leo
            width: aquarius.width
            height: aquarius.height
            anchors.top: cancer.bottom
            anchors.topMargin: height/3
            anchors.left: aquarius.left
            MouseArea {
                anchors.fill: parent
                onPressed: parent.opacity= 0.6
                onExited: parent.opacity=1
                onClicked: {
                    exceptLeo.start()
                    Z.getIndex(leoNumber)
                }
            }
            Image {
                source: "/images/zodiacs/leo2.png"
                height: parent.height
                width: height
                x: width/3
            }
            Text {
                font.pixelSize: parent.height*0.6
                x: parent.height*5/3
                y: (parent.height- height)/2
                text: qsTr("Sư tử - Leo (23/7→22/8)")
            }
        }

        // xu nu
        Rectangle {
            id: virgo
            width: aquarius.width
            height: aquarius.height
            anchors.top: leo.bottom
            anchors.topMargin: height/3
            anchors.left: aquarius.left
            MouseArea {
                anchors.fill: parent
                onPressed: parent.opacity= 0.6
                onExited: parent.opacity=1
                onClicked: {
                    exceptVirgo.start()
                    Z.getIndex(virgoNumber)
                }
            }
            Image {
                source: "/images/zodiacs/virgo2.png"
                height: parent.height
                width: height
                x: width/3
            }
            Text {
                font.pixelSize: parent.height*0.6
                x: parent.height*5/3
                y: (parent.height- height)/2
                text: qsTr("Xử nữ - Virgo (23/8→22/9)")
            }
        }

        // thien binh
        Rectangle {
            id: libra
            width: aquarius.width
            height: aquarius.height
            anchors.top: virgo.bottom
            anchors.topMargin: height/3
            anchors.left: aquarius.left
            MouseArea {
                anchors.fill: parent
                onPressed: parent.opacity= 0.6
                onExited: parent.opacity=1
                onClicked: {
                    exceptLibra.start()
                    Z.getIndex(libraNumber)
                }
            }
            Image {
                source: "/images/zodiacs/libra2.png"
                height: parent.height
                width: height
                x: width/3
            }
            Text {
                font.pixelSize: parent.height*0.6
                x: parent.height*5/3
                y: (parent.height- height)/2
                text: qsTr("Thiên bình - Libra (23/9→23/10)")
            }
        }

        // bo cap
        Rectangle {
            id: scorpio
            width: aquarius.width
            height: aquarius.height
            anchors.top: libra.bottom
            anchors.topMargin: height/3
            anchors.left: aquarius.left
            MouseArea {
                anchors.fill: parent
                onPressed: parent.opacity= 0.6
                onExited: parent.opacity=1
                onClicked: {
                    exceptScorpio.start()
                    Z.getIndex(scorpioNumber)
                }
            }
            Image {
                source: "/images/zodiacs/scorpio2.png"
                height: parent.height
                width: height
                x: width/3
            }
            Text {
                font.pixelSize: parent.height*0.6
                x: parent.height*5/3
                y: (parent.height- height)/2
                text: qsTr("Bọ Cạp - Scorpio (24/10→22/11)")
            }
        }

        // nhan ma
        Rectangle {
            id: sagittalus
            width: aquarius.width
            height: aquarius.height
            anchors.top: scorpio.bottom
            anchors.topMargin: height/3
            anchors.left: aquarius.left
            MouseArea {
                anchors.fill: parent
                onPressed: parent.opacity= 0.6
                onExited: parent.opacity=1
                onClicked: {
                    exceptSagittarius.start()
                    Z.getIndex(sagittariousNumber)
                }
            }
            Image {
                source: "/images/zodiacs/sagittarious2.png"
                height: parent.height
                width: height
                x: width/3
            }
            Text {
                font.pixelSize: parent.height*0.6
                x: parent.height*5/3
                y: (parent.height- height)/2
                text: qsTr("Nhân mã - Sagittarius (23/11→21/12)")
            }
        }

        // ma ket
        Rectangle {
            id: capricorn
            width: aquarius.width
            height: aquarius.height
            anchors.top: sagittalus.bottom
            anchors.topMargin: height/3
            anchors.left: aquarius.left
            MouseArea {
                anchors.fill: parent
                onPressed: parent.opacity= 0.6
                onExited: parent.opacity=1
                onClicked: {
                    exceptCapricorn.start()
                    Z.getIndex(capricornNumber)
                }
            }
            Image {
                source: "/images/zodiacs/capricorn2.png"
                height: parent.height
                width: height
                x: width/3
            }
            Text {
                font.pixelSize: parent.height*0.6
                x: parent.height*5/3
                y: (parent.height- height)/2
                text: qsTr("Ma kết - Capricorn (22/12→19/1)")
            }
        }

        // menu chinh
        Rectangle {
            id: mainRectangle
            width: parent.width*0.9
            height: parent.height*0.9
            anchors.top: parent.top
            anchors.topMargin: (parent.height- topBanner.height)*0.05
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.05
            visible: (topBanner.opacity==0) ?true :false
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
                source: "/images/rectangle.png"
                anchors.fill: parent
            }
            Text {
                id: focusZodiac
                text: focusZodiacName
                font.pixelSize: parent.width/12
                anchors.top: parent.top
                anchors.topMargin: height/3*2
                x: (parent.width- width)/2
            }
            Text {
                id: focusZodiacDay
                anchors.top: focusZodiac.bottom
                anchors.topMargin: height/2
                text: dayOfZodiac
                x: (parent.width- width)/2
            }
            Image {
                id: zodiacIcon
                source: zodiacIconSource
                width: parent.width/3
                height: width*0.85
                anchors.top: focusZodiacDay.bottom
                anchors.topMargin: focusZodiacDay.height/2
                x: (parent.width- width)/2
            }
            Text {
                id: t1
                text: text1
                font.pixelSize: appWidth/28
                wrapMode: Text.Wrap
                color: "#070777"
                width: parent.width*0.85
                anchors.top: zodiacIcon.bottom
                anchors.topMargin: focusZodiacDay.height
                x: (parent.width- width)/2
                horizontalAlignment: Text.AlignHCenter
            }
            Text {
                id: t2
                text: text2
                font.pixelSize: appWidth/28
                color: "#070777"
                anchors.top: t1.bottom
                anchors.topMargin: (parent.height- t1.y- t1.height- height*6- 5*focusZodiacDay.height/2)/2
                anchors.left: t1.left
            }
            Text {
                id: t3
                text: "   ♚ May mắn ♛ "
                font.pixelSize: appWidth/28
                color: "orange"
                anchors.top: t2.bottom
                anchors.topMargin: focusZodiacDay.height/2
                anchors.left: t1.left
            }
            Image {
                source: luckyHeartsSource
                height: t3.height
                width: height*5.2
                anchors.bottom: t3.bottom
                anchors.left: t6.right
            }
            Text {
                id: t4
                text: "   ♚ Tiền bạc ♛ "
                font.pixelSize: appWidth/28
                color: "orange"
                anchors.top: t3.bottom
                anchors.topMargin: focusZodiacDay.height/2
                anchors.left: t1.left
            }
            Image {
                source: moneyHeartsSource
                height: t3.height
                width: height*5.2
                anchors.bottom: t4.bottom
                anchors.left: t6.right
            }
            Text {
                id: t5
                text: "   ♚ Tình yêu ♛ "
                font.pixelSize: appWidth/28
                color: "orange"
                anchors.top: t4.bottom
                anchors.topMargin: focusZodiacDay.height/2
                anchors.left: t1.left
            }
            Image {
                source: loveHeartsSource
                height: t3.height
                width: height*5.2
                anchors.bottom: t5.bottom
                anchors.left: t6.right
            }
            Text {
                id: t6
                text: "   ♚ Tâm trạng ♛ "
                font.pixelSize: appWidth/28
                color: "orange"
                anchors.top: t5.bottom
                anchors.topMargin: focusZodiacDay.height/2
                anchors.left: t1.left
            }
            Image {
                source: emotionHeartsSource
                height: t3.height
                width: height*5.2
                anchors.bottom: t6.bottom
                anchors.left: t6.right
            }
            Text {
                id: t7
                text: "   ♚ Công việc ♛ "
                font.pixelSize: appWidth/28
                color: "orange"
                anchors.top: t6.bottom
                anchors.topMargin: focusZodiacDay.height/2
                anchors.left: t1.left
            }
            Image {
                source: workHeartsSource
                height: t3.height
                width: height*5.2
                anchors.bottom: t7.bottom
                anchors.left: t6.right
            }
        }

        SequentialAnimation {
            id: exceptAries
            NumberAnimation {
                targets: [taurus, gemini, cancer, leo, virgo, libra, scorpio, sagittalus, capricorn, aquarius, pisces]
                properties: "opacity"
                duration: 175
                from: 1
                to: 0
            }
            NumberAnimation { targets: [topBanner, aries]; property: "opacity"; to: 0; duration: 100 }
            NumberAnimation { target: mainRectangle; property: "opacity"; from: 0; to: 1; duration: 150 }
        }
        SequentialAnimation {
            id: exceptTaurus
            NumberAnimation {
                targets: [aries, gemini, cancer, leo, virgo, libra, scorpio, sagittalus, capricorn, aquarius, pisces]
                properties: "opacity"
                duration: 175
                from: 1
                to: 0
            }
            NumberAnimation { targets: [topBanner, taurus]; property: "opacity"; to: 0; duration: 100 }
            NumberAnimation { target: mainRectangle; property: "opacity"; from: 0; to: 1; duration: 150 }
        }
        SequentialAnimation {
            id: exceptGemini
            NumberAnimation {
                targets: [aries, taurus, cancer, leo, virgo, libra, scorpio, sagittalus, capricorn, aquarius, pisces]
                properties: "opacity"
                duration: 175
                from: 1
                to: 0
            }
            NumberAnimation { targets: [topBanner, gemini]; property: "opacity"; to: 0; duration: 100 }
            NumberAnimation { target: mainRectangle; property: "opacity"; from: 0; to: 1; duration: 150 }
        }
        SequentialAnimation {
            id: exceptCancer
            NumberAnimation {
                targets: [aries, taurus, gemini, leo, virgo, libra, scorpio, sagittalus, capricorn, aquarius, pisces]
                properties: "opacity"
                duration: 175
                from: 1
                to: 0
            }
            NumberAnimation { targets: [topBanner, cancer]; property: "opacity"; to: 0; duration: 100 }
            NumberAnimation { target: mainRectangle; property: "opacity"; from: 0; to: 1; duration: 150 }
        }
        SequentialAnimation {
            id: exceptLeo
            NumberAnimation {
                targets: [aries, taurus, gemini, cancer, virgo, libra, scorpio, sagittalus, capricorn, aquarius, pisces]
                properties: "opacity"
                duration: 175
                from: 1
                to: 0
            }
            NumberAnimation { targets: [topBanner, leo]; property: "opacity"; to: 0; duration: 100 }
            NumberAnimation { target: mainRectangle; property: "opacity"; from: 0; to: 1; duration: 150 }
        }
        SequentialAnimation {
            id: exceptVirgo
            NumberAnimation {
                targets: [aries, taurus, gemini, cancer, leo, libra, scorpio, sagittalus, capricorn, aquarius, pisces]
                properties: "opacity"
                duration: 175
                from: 1
                to: 0
            }
            NumberAnimation { targets: [topBanner, virgo]; property: "opacity"; to: 0; duration: 100 }
            NumberAnimation { target: mainRectangle; property: "opacity"; from: 0; to: 1; duration: 150 }
        }
        SequentialAnimation {
            id: exceptLibra
            NumberAnimation {
                targets: [aries, taurus, gemini, cancer, leo, virgo, scorpio, sagittalus, capricorn, aquarius, pisces]
                properties: "opacity"
                duration: 175
                from: 1
                to: 0
            }
            NumberAnimation { targets: [topBanner, libra]; property: "opacity"; to: 0; duration: 100 }
            NumberAnimation { target: mainRectangle; property: "opacity"; from: 0; to: 1; duration: 150 }
        }
        SequentialAnimation {
            id: exceptScorpio
            NumberAnimation {
                targets: [aries, taurus, gemini, cancer, leo, virgo, libra, sagittalus, capricorn, aquarius, pisces]
                properties: "opacity"
                duration: 175
                from: 1
                to: 0
            }
            NumberAnimation { targets: [topBanner, scorpio]; property: "opacity"; to: 0; duration: 100 }
            NumberAnimation { target: mainRectangle; property: "opacity"; from: 0; to: 1; duration: 150 }
        }
        SequentialAnimation {
            id: exceptSagittarius
            NumberAnimation {
                targets: [aries, taurus, gemini, cancer, leo, virgo, libra, scorpio, capricorn, aquarius, pisces]
                properties: "opacity"
                duration: 175
                from: 1
                to: 0
            }
            NumberAnimation { targets: [topBanner, sagittalus]; property: "opacity"; to: 0; duration: 100 }
            NumberAnimation { target: mainRectangle; property: "opacity"; from: 0; to: 1; duration: 150 }
        }
        SequentialAnimation {
            id: exceptCapricorn
            NumberAnimation {
                targets: [aries, taurus, gemini, cancer, leo, virgo, libra, scorpio, sagittalus, aquarius, pisces]
                properties: "opacity"
                duration: 175
                from: 1
                to: 0
            }
            NumberAnimation { targets: [topBanner, capricorn]; property: "opacity"; to: 0; duration: 100 }
            NumberAnimation { target: mainRectangle; property: "opacity"; from: 0; to: 1; duration: 150 }
        }
        SequentialAnimation {
            id: exceptAquarius
            NumberAnimation {
                targets: [aries, taurus, gemini, cancer, leo, virgo, libra, scorpio, sagittalus, capricorn, pisces]
                properties: "opacity"
                duration: 175
                from: 1
                to: 0
            }
            NumberAnimation { targets: [topBanner, aquarius]; property: "opacity"; to: 0; duration: 100 }
            NumberAnimation { target: mainRectangle; property: "opacity"; from: 0; to: 1; duration: 150 }
        }
        SequentialAnimation {
            id: exceptPisces
            NumberAnimation {
                targets: [aries, taurus, gemini, cancer, leo, virgo, libra, scorpio, sagittalus, capricorn, aquarius]
                properties: "opacity"
                duration: 175
                from: 1
                to: 0
            }
            NumberAnimation { targets: [topBanner, pisces]; property: "opacity"; to: 0; duration: 100 }
            NumberAnimation { target: mainRectangle; property: "opacity"; from: 0; to: 1; duration: 150 }
        }
        NumberAnimation {
            id: showZodiacsList
            targets: [topBanner, pisces, aries, taurus, gemini, cancer, leo, virgo, libra, scorpio, sagittalus, capricorn, aquarius]
            properties: "opacity"
            duration: 500
            from: 0
            to: 1
        }



    }


}

