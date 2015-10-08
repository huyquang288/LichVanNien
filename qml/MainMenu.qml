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
                    currentPage="MonthCalendar"
                    break;
                case "MonthCalendar":
                    currentPage = "DaySwitch"
                    break;
                case "DaySwitch":
                    currentPage = "Others"
                    break;
                case "Others":
                    break;
                default:
                    currentPage="MonthCalendar"
                    break;
                }
                mouseEnteredX= -1;
            }
            else if (mouseEnteredX < 7 && mouseX- mouseEnteredX > appWidth/5) {
                showSubMenuAnimation.start()
                mouseEnteredX= -1;
                mouseArea1.enabled= false;
            }
            else if (mouseX- mouseEnteredX > appWidth/3) {
                switch (currentPage) {
                case "Others":
                    currentPage= "DaySwitch"
                    break;
                case "DaySwitch":
                    currentPage= "MonthCalendar"
                    break;
                case "MonthCalendar":
                    currentPage= "MainMenu";
                    break;
                default:
                    break;
                }
                mouseEnteredX= -1;
            }
        }

        onClicked: {
            if (Math.abs(mouseX-mouseEnteredX) <10 && Math.abs(mouseY- mouseEnteredY)< 10) {
                //subMenu.visible= false
            }
        }

    }

    MouseArea {
        id: mouseArea2;
        anchors.fill: parent
        enabled: !(mouseArea1.enabled)
        onClicked: {
            hideSubMenuAnimation.start()
            mouseArea1.enabled= true;
        }
    }



    ImageButton {
        id: today;
        anchors.right: parent.right
        anchors.rightMargin: width/5
        anchors.top: parent.top
        anchors.topMargin: height/4
        width: appWidth/6
        height: appHight/15
        source: "/images/images.jpeg"
        onClicked: {
            currentPage= "MainMenu"
        }
    }

    Row{
        anchors.bottom: parent.bottom
        height: appHight/10
        width: appWidth
        spacing: 0
        Button{
            id: dayCalendar
            width: parent.width/4
            height: parent.height
            text: "Lịch ngày"
            onClicked: {
                console.log(appHight + "  " + appWidth)
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
        y: today.height*1.5
        width: appWidth/2.7
        height: appHight- today.height*1.5
        color: "red"
    }


    // animations
    Rectangle {
        id: animationRec
        x: 0-width
        width: appWidth
        height: subMenu.height- dayCalendar.height
        color: "brown"
    }

    // animation cua viec chuyen tab
    NumberAnimation {
        id: changeTabAnimation
        target: animationRec
        property: "x"
        from: 0- animationRec.width
        to: 0
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

}
