import QtQuick 2.4

Item {
    id: controler

    width: 400
    height: 400

    property int x_value: 0
    property int y_value: 0

    Rectangle
    {
        id: central
        x: 100
        y: 100
        width: 200
        height: 200
        color: "#ffffff"
        radius: 100
        border.width: 2

        MouseArea
        {
            anchors.fill: parent

            property int startX: 0
            property int startY: 0

            onPressed:
            {
                startX = mouseX
                startY = mouseY
            }

            onPositionChanged:
            {
                var dx = mouseX - startX
                var dy = mouseY - startY

                if (dx > 80)
                    controler.x_value = 1
                else if (dx < -80)
                    controler.x_value = -1
                else
                    controler.x_value = 0

                if (dy > 80)
                    controler.y_value = 1
                else if (dy < -80)
                    controler.y_value = -1
                else
                    controler.y_value = 0
            }
        }
    }

    Rectangle {
        id: rectangle1
        x: 150
        y: 0
        width: 100
        height: 100
        color: "#ffffff"
        radius: 50
        border.width: 2
    }

    Rectangle {
        id: rectangle2
        x: 260
        y: 260
        width: 100
        height: 100
        color: "#ffffff"
        radius: 50
        border.width: 2
    }

    Rectangle {
        id: rectangle3
        x: 150
        y: 300
        width: 100
        height: 100
        color: "#ffffff"
        radius: 50
        border.width: 2
    }

    Rectangle {
        id: rectangle4
        x: 0
        y: 150
        width: 100
        height: 100
        color: "#ffffff"
        radius: 50
        border.width: 2
    }

    Rectangle {
        id: rectangle5
        x: 300
        y: 150
        width: 100
        height: 100
        color: "#ffffff"
        radius: 50
        border.width: 2
    }

    Rectangle {
        id: rectangle6
        x: 40
        y: 40
        width: 100
        height: 100
        color: "#ffffff"
        radius: 50
        border.width: 2
    }

    Rectangle {
        id: rectangle7
        x: 260
        y: 40
        width: 100
        height: 100
        color: "#ffffff"
        radius: 50
        border.width: 2
    }

    Rectangle {
        id: rectangle8
        x: 40
        y: 260
        width: 100
        height: 100
        color: "#ffffff"
        radius: 50
        border.width: 2
    }
}

