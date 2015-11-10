import QtQuick 2.0
import QtQuick.Window 2.2

Rectangle
{
    id: canvas

    width: 800
    height: 600

    Text
    {
       id: helloText
       text: "Hello world!"
       y: 30
       anchors.horizontalCenter: canvas.horizontalCenter
       font.pointSize: 24; font.bold: true
    }

    Controler
    {
        anchors.right: canvas.right
        anchors.bottom: canvas.bottom
    }

}

