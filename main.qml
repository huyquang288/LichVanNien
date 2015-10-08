import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import "qml"

ApplicationWindow {
    visible: true
    width: Screen.width
    height: Screen.height
    property string  currentPage : "main";
    MainMenu{
        anchors.fill: parent
    }
}
