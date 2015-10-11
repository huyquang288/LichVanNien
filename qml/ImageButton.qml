import QtQuick 2.4

Item{
    id: imagebutton
    property string source
    signal clicked()

    Image {
        id: image
        width: parent.width
        height: parent.height
        MouseArea {
            id: mousebutton
            anchors.fill: parent
            onClicked: {
                imagebutton.clicked();
            }
        }
        source: imagebutton.source
    }

}//end item
