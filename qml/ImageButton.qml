import QtQuick 2.0

Item{
    id: imagebutton
    //height: image.sourceSize.height
    //width: image.sourceSize.width

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
