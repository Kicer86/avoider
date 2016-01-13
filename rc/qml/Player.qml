import QtQuick 2.0

Item
{
    id: player

    signal hit()

    property int size

    Rectangle
    {
        anchors.fill: parent
        color: "#ff0000"
        radius: player.width
        border.width: 2
    }
}

