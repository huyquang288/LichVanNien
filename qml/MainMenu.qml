import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2

Rectangle {
    id: main_rectangle;
    width: 360;
    height: 640;
    color: "#252443"

    // khai bao bien
    property int appHight: main_rectangle.height
    property int appWidth: main_rectangle.width
    property double mouseEnteredX: -1
    property double mouseEnteredY: -1


    // Put the name of the QML files containing your pages (without the '.qml')
    property variant pagesList  : [
        "MainMenu",
        "MonthCalendar",
        "DaySwitch",
        "Others"
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
            mouseEnteredY= mouseY
        }

        onReleased: {
            if (mouseEnteredX- mouseX > appWidth/3) {
                switch (currentPage) {
                case "MainMenu":
                    changeTabToRightAnimation.start()
                    currentPage="MonthCalendar"
                    break;
                case "MonthCalendar":
                    changeTabToRightAnimation.start()
                    currentPage = "DaySwitch"
                    break;
                case "DaySwitch":
                    changeTabToRightAnimation.start()
                    currentPage = "Others"
                    break;
                case "Others":
                    break;
                default:
                    changeTabToRightAnimation.start()
                    currentPage="MonthCalendar"
                    break;
                }
                mouseEnteredX= -1;
            }
            else if (mouseEnteredX < 7 && mouseX- mouseEnteredX > appWidth/5) {
                showSubMenuAnimation.start()
                submenuClockwiseRotation.start()
                mouseEnteredX= -1;
                mouseArea1.enabled= false;
            }
            else if (mouseX- mouseEnteredX > appWidth/3) {
                switch (currentPage) {
                case "Others":
                    changeTabToLeftAnimation.start()
                    currentPage= "DaySwitch"
                    break;
                case "DaySwitch":
                    changeTabToLeftAnimation.start()
                    currentPage= "MonthCalendar"
                    break;
                case "MonthCalendar":
                    changeTabToLeftAnimation.start()
                    currentPage= "MainMenu";
                    break;
                default:
                    break;
                }
                mouseEnteredX= -1;
            }
        }

        onClicked: {
        }

    }

    MouseArea {
        id: mouseArea2;
        anchors.fill: parent
        enabled: !(mouseArea1.enabled)
        onClicked: {
            hideSubMenuAnimation.start()
            submenuUnclockwiseRotation.start()
            mouseArea1.enabled= true;
        }
    }



    ImageButton {
        id: todayButton;
        anchors.right: parent.right
        anchors.rightMargin: width/5
        anchors.top: parent.top
        anchors.topMargin: height/4
        width: appWidth/6
        height: appHight/15
        source: "/images/today.png"
        onClicked: {
            currentPage= "MainMenu"
            subMenuButton.rotation= 0;
            subMenu.x= (0- subMenu.width)
            mouseArea1.enabled= true
        }
    }

    ImageButton {
        id: subMenuButton
        anchors.top: todayButton.top
        anchors.left: parent.left
        anchors.leftMargin: todayButton.width/5
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

    Row{
        anchors.bottom: parent.bottom
        height: appHight/10
        width: appWidth
        spacing: 0
        enabled: mouseArea1.enabled
        Button{
            id: dayCalendar
            width: parent.width/4
            height: parent.height
            text: "Lịch ngày"
            onClicked: {
                currentPage = "MainMenu"
            }
        }
        Button{
            id: monthCalendar
            width: parent.width/4
            height: parent.height
            text: "Lịch tháng"
            onClicked: {
                currentPage = "MonthCalendar"
            }
        }
        Button{
            id: daySwitch
            width: parent.width/4
            height: parent.height
            text: "Đổi ngày"
            onClicked: {
                currentPage = "DaySwitch"
            }
        }
        Button{
            id: others
            width: parent.width/4
            height: parent.height
            text: "Khác"
            onClicked: {
                currentPage = "Others"
            }
        }
    }

    Rectangle {
        id: subMenu
        x: 0- width
        y: todayButton.height*1.5
        width: appWidth/2.7
        height: appHight- todayButton.height*1.5
        color: "red"
    }


    // animations
    Rectangle {
        id: animationRec
        x: 0-width
        y: subMenu.y
        opacity: 0.5
        width: appWidth
        height: subMenu.height- dayCalendar.height
        color: "brown"
    }

    // animation cua viec chuyen tab
    NumberAnimation {
        id: changeTabToRightAnimation
        target: animationRec
        property: "x"
        from: 0
        to: 0 - animationRec.width
        duration: 200
        easing.type: Easing.InOutQuad
    }
    NumberAnimation {
        id: changeTabToLeftAnimation
        target: animationRec
        property: "x"
        from: 0
        to: animationRec.width
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

}
