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
    //property double mouseEnteredY: -1

    // Put the name of the QML files containing your pages (without the '.qml')
    property variant pagesList  : [
        "MainMenu",
        "About"
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
            }
            else if (mouseEnteredX < 7 && mouseX- mouseEnteredX > appWidth/5) {
                showSubMenuAnimation.start()
                submenuClockwiseRotation.start()
                mouseEnteredX= -1;
                mouseArea1.enabled= false;
            }
            else if (mouseX- mouseEnteredX > appWidth/3) {
                changeTabToLeft();
                mouseEnteredX= -1;
            }
        }
    }

    MouseArea {
        id: mouseArea2;
        width: appWidth- subMenu.width
        height: appHight
        anchors.right: parent.right
        enabled: !(mouseArea1.enabled)
        onClicked: {
            hideSubMenuAnimation.start()
            submenuUnclockwiseRotation.start()
            mouseArea1.enabled= true;
        }
    }

    ImageButton{
        id: todayButton;
        x: appWidth- width*1.2
        y: height/4
        width: appWidth/6
        height: appHight/15
        source: "/images/today.png"
        onClicked: {
            hideAllTabs()
            dayCalendarTab.visible= true
            subMenuButton.rotation= 0;
            subMenu.x= (0- subMenu.width)
            changeTabByClick.start()
            mouseArea1.enabled= true
        }
    }

    ImageButton {
        id: subMenuButton
        x: todayButton.width/5
        y: height/4
        height: todayButton.height
        width: height
        source: "/images/submenu.png"
        onClicked: {
            if (subMenu.x===0) {
                hideSubMenuAnimation.start()
                submenuUnclockwiseRotation.start()
                mouseArea1.enabled= true
            }
            else {
                showSubMenuAnimation.start()
                submenuClockwiseRotation.start()
                mouseArea1.enabled= false;
            }
        }
    }

    // day calendar tab
    DayCalendar {
        id: dayCalendarTab
        x: 0
        y: subMenu.y
        width: appWidth
        height: subMenu.height- dayCalendarButton.height
        onClicked: {
            color: "white"
        }
    }

    // month calendar tab
    MonthCalendar {
        id: monthCalendarTab
        x: 0
        y: subMenu.y
        width: appWidth
        height: subMenu.height- dayCalendarButton.height
        visible: false
    }

    // doi ngay
    DaySwitch {
        id: daySwitchTab
        x: 0
        y: subMenu.y
        width: appWidth
        height: subMenu.height- dayCalendarButton.height
        visible: false
    }

    // gio quoc te
    WorldClock {
        id: worldClockTab
        x: 0
        y: subMenu.y
        width: appWidth
        height: subMenu.height- dayCalendarButton.height
        visible: false
    }

    // thong tin khac
    Others {
        id: othersTab
        x: 0
        y: subMenu.y
        width: appWidth
        height: subMenu.height- dayCalendarButton.height
        visible: false
    }


    Row{
        id: rowOfMainButton
        anchors.bottom: parent.bottom
        height: appHight/10
        width: appWidth
        spacing: 0
        enabled: mouseArea1.enabled
        Button{
            id: dayCalendarButton
            width: parent.width/numberOfTabs
            height: parent.height
            text: "Lịch ngày"
            onClicked: {
                hideAllTabs();
                dayCalendarTab.visible= true
                changeTabByClick.start()
                currentTab= "dayCalendarTab"
            }
        }
        Button{
            id: monthCalendarButton
            width: parent.width/numberOfTabs
            height: parent.height
            text: "Lịch tháng"
            onClicked: {
                hideAllTabs()
                monthCalendarTab.visible= true
                changeTabByClick.start()
                currentTab= "monthCalendarTab"
            }
        }
        Button{
            id: daySwitchButton
            width: parent.width/numberOfTabs
            height: parent.height
            text: "Đổi ngày"
            onClicked: {
                hideAllTabs();
                daySwitchTab.visible= true;
                changeTabByClick.start()
                currentTab= "daySwitchTab"
            }
        }
        Button{
            id: worldClockButton
            width: parent.width/numberOfTabs
            height: parent.height
            text: "Giờ quốc tế"
            onClicked: {
                hideAllTabs()
                worldClockTab.visible= true;
                changeTabByClick.start()
                currentTab= "worldClockTab"
            }
        }
        Button{
            id: othersButton
            width: parent.width/numberOfTabs
            height: parent.height
            text: "Khác"
            onClicked: {
                hideAllTabs();
                othersTab.visible= true;
                changeTabByClick.start()
                currentTab= "othersTab"
            }
        }
    }

    SubMenu {
        id: subMenu
        x: 0- width
        y: todayButton.height*1.5
        width: appWidth/2.7
        height: appHight- todayButton.height*1.5
    }


    // animations
    Rectangle {
        id: animationRec
        x: 0-width
        y: subMenu.y
        opacity: 0.35
        width: appWidth
        height: subMenu.height- dayCalendarButton.height
        color: "black"
    }

    Rectangle {
        id: animationRec2
        x: 0
        y: Screen.height
        //y: subMenu.y
        opacity: 0.35
        width: appWidth
        height: subMenu.height- dayCalendarButton.height
        color: "black"
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
        from: subMenu.y
        to: appHight
        duration: 200
        easing.type: Easing.InOutQuad
    }

    // goi ra thanh submenu
    NumberAnimation {
        id: showSubMenuAnimation
        target: subMenu
        property: "x"
        from: 0- subMenu.width
        to: 0
        duration: 300
        easing.type: Easing.InOutQuad
    }

    // an di thanh submenu
    NumberAnimation {
        id: hideSubMenuAnimation
        target: subMenu
        property: "x"
        from: 0
        to: 0- subMenu.width
        duration: 300
        easing.type: Easing.InOutQuad
    }

    // hieu ung xoay cua submenu button
    // show submenu
    NumberAnimation {
        id: submenuClockwiseRotation
        target: subMenuButton
        property: "rotation"
        from: 0
        to: 90
        duration: 300
        easing.type: Easing.InOutQuad
    }
    NumberAnimation {
        id: submenuUnclockwiseRotation
        target: subMenuButton
        property: "rotation"
        from: 90
        to: 0
        duration: 300
        easing.type: Easing.InOutQuad
    }

    function hideAllTabs () {
        dayCalendarTab.visible= false;
        monthCalendarTab.visible= false;
        daySwitchTab.visible= false;
        worldClockTab.visible= false;
        othersTab.visible= false;
    }

    function hideMainMenu () {
        subMenu.visible= false;
        hideAllTabs();
        todayButton.visible= false;
        subMenuButton.visible= false;
        rowOfMainButton.visible= false;
        mouseArea1.visible= false;
        mouseArea2.visible= false;        
    }

    function backToMainMenu () {
        currentPage= "MainMenu"
        subMenu.visible= true;
        todayButton.visible= true;
        subMenuButton.visible= true;
        rowOfMainButton.visible= true;
        mouseArea2.visible= true;
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
        case "worldClockTab":
            worldClockTab.visible= true
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
            worldClockTab.visible= true;
            currentTab = "worldClockTab"
            break;
        case "worldClockTab":
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
            worldClockTab.visible= true
            currentTab= "worldClockTab"
            break;
        case "worldClockTab":
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
