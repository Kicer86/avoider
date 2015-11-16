import QtQuick 2.4

ControlerForm
{
    id: controler

    property int x_value: 0
    property int y_value: 0

    property int startX: 0
    property int startY: 0


    mouse_area.onPressed:
    {
        startX = mouse.x
        startY = mouse.y
    }

    mouse_area.onPositionChanged:
    {
        const sensitivity = 20
        var dx = mouse.x - startX
        var dy = mouse.y - startY

        if (dx > sensitivity)
            controler.x_value = 1
        else if (dx < -sensitivity)
            controler.x_value = -1
        else
            controler.x_value = 0

        if (dy > sensitivity)
            controler.y_value = 1
        else if (dy < -sensitivity)
            controler.y_value = -1
        else
            controler.y_value = 0
    }

    mouse_area.onReleased:
    {
        controler.x_value = 0
        controler.y_value = 0
    }
}
