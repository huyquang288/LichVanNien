import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2

Rectangle {
    id: main_rectangle;
    color: "#252443"

    // khai bao bien
    property int appHight: main_rectangle.height
    property int appWidth: main_rectangle.width
    property string currentTab: "dayCalendarTab"
    property double mouseEnteredX: -1
    property int numberOfTabs: 5

    // Put the name of the QML files containing your pages (without the '.qml')
    property variant pagesList  : [
        "MainMenu"
    ];


    // Set this property to another file name to change page
    Repeater {
        model: pagesList;
        delegate: Loader {
            active: false;
            asynchronous: true;
            anchors.fill: parent;
            visible: (currentPage === modelData);
            source: "%1.qml".arg(modelData)
            onVisibleChanged:      { loadIfNotLoaded(); }
            Component.onCompleted: { loadIfNotLoaded(); }

            function loadIfNotLoaded () {
                // to load the file at first show
                if (visible && !active) {
                    active = true;
                }
            }
        }
    }

    Component.onCompleted: {
        //DbE.reloadCategoriesList();
    }    

    MouseArea {
        id: mouseArea1;
        anchors.fill: parent
        enabled: true;
        onEntered:  {
            mouseEnteredX= mouseX
            //mouseEnteredY= mouseY
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
        id: topBanner
        source: "/images/topBanner.png"
        width: appWidth
        height: appHight/15
        x: 0
        y: 0
    }

    Image {
        width: appWidth
        height: appHight/10
        source: "/images/bottomBanner.png"
        anchors.bottom: parent.bottom
        anchors.left: parent.left
    }

    // day calendar tab
    DayCalendar {
        id: dayCalendarTab
        x: 0
        y: appHight/15
        width: appWidth
        height: appHight*0.9- appHight/15
        onClicked: {
            color: "white"
        }
    }

    // month calendar tab
    MonthCalendar {
        id: monthCalendarTab
        x: 0
        y: 0
        width: appWidth
        height: appHight*0.9
        visible: false

    }

    // doi ngay
    DaySwitch {
        id: daySwitchTab
        x: 0
        y: 0
        width: appWidth
        height: appHight*0.9
        visible: false
    }

    // gio quoc te
    Zodiac {
        id: zodiacTab
        x: 0
        y: 0
        width: appWidth
        height: appHight*0.9
        visible: false
    }

    // thong tin khac
    Others {
        id: othersTab
        x: 0
        y: 0
        width: appWidth
        height: appHight*0.9
        visible: false
    }


    // horizontal animation
    Rectangle {
        id: animationRec
        x: 0-width
        y: 0
        opacity: 0.35
        width: appWidth
        height: appHight*0.9
        color: "black"
    }
    // vertical animation
    Rectangle {
        id: animationRec2
        x: 0
        y: Screen.height
        opacity: 0.35
        width: appWidth
        height: appHight*0.8
        color: "black"
    }


    Row{
        id: rowOfMainButton
        anchors.bottom: parent.bottom
        height: appHight/10
        width: appWidth
        spacing: 0
        enabled: mouseArea1.enabled
        ImageButton {
            id: dayCalendarButton
            width: parent.width/numberOfTabs
            height: parent.height
            source: "/images/dayCalendar.png"
            opacity: 0.7 //default
            onClicked: {
                hideAllTabs();
                dayCalendarTab.visible= true
                changeTabByClick.start()
                currentTab= "dayCalendarTab"
                hideRowOfMainButtonEffect();
            }
        }
        ImageButton {
            id: monthCalendarButton
            width: parent.width/numberOfTabs
            height: parent.height
            source: "/images/monthCalendar.png"
            onClicked: {
                hideAllTabs()
                monthCalendarTab.visible= true
                changeTabByClick.start()
                currentTab= "monthCalendarTab"
                hideRowOfMainButtonEffect();
            }
        }
        ImageButton {
            id: daySwitchButton
            width: parent.width/numberOfTabs
            height: parent.height
            source: "/images/switchDay.png"
            onClicked: {
                hideAllTabs();
                daySwitchTab.visible= true;
                changeTabByClick.start()
                currentTab= "daySwitchTab"
                hideRowOfMainButtonEffect();
            }
        }
        ImageButton {
            id: zodiacButton
            width: parent.width/numberOfTabs
            height: parent.height
            source: "/images/zodiac.png"
            onClicked: {
                hideAllTabs()
                zodiacTab.visible= true;
                changeTabByClick.start()
                currentTab= "zodiacTab"
                hideRowOfMainButtonEffect();
            }
        }
        ImageButton {
            id: othersButton
            width: parent.width/numberOfTabs
            height: parent.height
            source: "/images/others.png"
            onClicked: {
                hideAllTabs();
                othersTab.visible= true;
                changeTabByClick.start()
                currentTab= "othersTab"                
                hideRowOfMainButtonEffect();
            }
        }
    }

    function hideRowOfMainButtonEffect() {
        dayCalendarButton.opacity= 1;
        monthCalendarButton.opacity= 1;
        daySwitchButton.opacity= 1;
        zodiacButton.opacity= 1;
        othersButton.opacity= 1;
        switch (currentTab) {
        case "dayCalendarTab":
            dayCalendarButton.opacity= 0.7
            return;
        case "monthCalendarTab":
            monthCalendarButton.opacity= 0.7
            return;
        case "daySwitchTab":
            daySwitchButton.opacity= 0.7
            return
        case "zodiacTab":
            zodiacButton.opacity= 0.7
            return;
        case "othersTab":
            othersButton.opacity= 0.7;
            return;
        }
    }



    // animation cua viec chuyen tab
    NumberAnimation {
        id: changeTabToRightAnimation
        target: animationRec
        property: "x"
        from: 0- animationRec.width*0.4
        to: 0 - animationRec.width
        duration: 200
        easing.type: Easing.InOutQuad
    }
    NumberAnimation {
        id: changeTabToLeftAnimation
        target: animationRec
        property: "x"
        from: animationRec.width*0.4
        to: animationRec.width
        duration: 200
        easing.type: Easing.InOutQuad
    }
    NumberAnimation {
        id: changeTabByClick
        target: animationRec2
        property: "y"
        from: appHight/10
        to: appHight
        duration: 200
        easing.type: Easing.InOutQuad
    }

    About {
        id: about
        height: appHight
        width: appWidth
        x: 0
        y: 0
        z: -1
        onClicked: {
            about.z= -1;
        }
    }

    function hideAllTabs () {
        dayCalendarTab.visible= false;
        monthCalendarTab.visible= false;
        daySwitchTab.visible= false;
        zodiacTab.visible= false;
        othersTab.visible= false;
    }


    function backToMainMenu () {
        currentPage= "MainMenu"
        todayButton.visible= true;
        rowOfMainButton.visible= true;
        switch (currentTab) {
        case "dayCalendarTab":
            dayCalendarTab.visible= true
            break;
        case "monthCalendarTab":
            monthCalendarTab.visible= true
            break;
        case "daySwitchTab":
            daySwitchTab.visible= true
            break;
        case "zodiacTab":
            zodiacTab.visible= true
            break;
        case "othersTab":
            othersTab.visible= true
            break;
        default:
            return;
        }
    }

    function changeTabToRight () {
        switch (currentTab) {
        case "dayCalendarTab":
            hideAllTabs()
            monthCalendarTab.visible= true
            currentTab="monthCalendarTab"
            break;
        case "monthCalendarTab":
            hideAllTabs()
            daySwitchTab.visible= true
            currentTab = "daySwitchTab"
            break;
        case "daySwitchTab":
            hideAllTabs()
            zodiacTab.visible= true;
            currentTab = "zodiacTab"
            break;
        case "zodiacTab":
            hideAllTabs()
            othersTab.visible= true;
            currentTab = "othersTab"
            break;
        default:
            return;
        }
        changeTabToRightAnimation.start()

    }

    function changeTabToLeft () {
        switch (currentTab) {
        case "othersTab":
            hideAllTabs()
            zodiacTab.visible= true
            currentTab= "zodiacTab"
            break;
        case "zodiacTab":
            hideAllTabs()
            daySwitchTab.visible= true
            currentTab= "daySwitchTab"
            break;
        case "daySwitchTab":
            hideAllTabs()
            monthCalendarTab.visible=true
            currentTab= "monthCalendarTab"
            break;
        case "monthCalendarTab":
            hideAllTabs()
            dayCalendarTab.visible= true
            currentTab= "dayCalendarTab";
            break;
        default:
            return;
        }
        changeTabToLeftAnimation.start()
    }



}
