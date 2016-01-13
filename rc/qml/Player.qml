import QtQuick 2.0

Item
{
    id: player

    signal hit()

    property int size

    Rectangle
    {
        width: player.size
        height: player.size

        color: "#ff0000"
        radius: player.size
        border.width: 2
    }
}

