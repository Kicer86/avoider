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

        onMoveX: player.x += x
        onMoveY: player.y += y

    }

    Player
    {
        id: player
        x: 100
        y: 100
    }

}

