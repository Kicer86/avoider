import QtQuick 2.0
import QtQuick.Window 2.2

Rectangle
{
    id: canvas

    width: 800
    height: 600

    Controler
    {
        id: pad

        transformOrigin: Item.BottomRight
        scale: 0.5

        anchors.right: canvas.right
        anchors.bottom: canvas.bottom
    }

    Player
    {
        id: player
        x: 100
        y: 100
    }

    Timer
    {
       interval: 5; running: true; repeat: true
       onTriggered:
       {
           player.x += pad.x_value
           player.y += pad.y_value
       }
   }

}

