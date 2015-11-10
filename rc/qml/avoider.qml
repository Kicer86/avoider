import QtQuick 2.0
import QtQuick.Window 2.2

Rectangle
{
    id: canvas

    width: 800
    height: 600

    Controler
    {
        anchors.right: canvas.right
        anchors.bottom: canvas.bottom
    }

}

