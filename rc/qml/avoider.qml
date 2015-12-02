import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 1.0

Rectangle
{
    property alias canvas: canvas
    id: canvas

    width: 800
    height: 600

    z: 0

    Background
    {
        id: background

        z: 1

        width:  canvas.width
        height: canvas.height
    }

    Controler
    {
        id: pad

        z: 5

        transformOrigin: Item.BottomRight
        scale: 0.5

        anchors.right: canvas.right
        anchors.bottom: canvas.bottom
    }

//***   CANON OBJECT ***
    property alias canon: canon

    Canon
    {
        id: canon

        z: 5

        transformOrigin: Item.Center
        scale: 0.5

        anchors.right: canvas.right
        anchors.verticalCenter: canvas.verticalCenter

        targetX: player.x
        targetY: player.y

        onTargetHit:
        {
            canvas.state = "gameOver"
        }
    }


//***   END OF CANON OBJECT ***

    // arena
    Rectangle
    {
        id: ring

        x:      50
        y:      50

        z:      3

        width:  parent.width - (pad.width * pad.scale) - 70
        height: parent.height - 50 - 50

        border.color:  "#FF0000"
        color:         "transparent"
    }

    
    Player
    {
        id: player
        x: 100
        y: 100
        z: 5

        transformOrigin: Item.Center

        // read pad every 20ms and update player's move
        Timer
        {
            interval: 20; running: true; repeat: true
            onTriggered:
            {
                var dx = pad.x_value;
                var dy = pad.y_value;

                if (dx > 0 && player.x + player.width < ring.x + ring.width)
                    player.x += dx * 2

                if (dx < 0 && player.x > ring.x)
                    player.x += dx * 2

                if (dy > 0 && player.y + player.height < ring.y + ring.height)
                    player.y += dy * 2

                if (dy < 0 && player.y > ring.y)
                    player.y += dy * 2

                // Here we tell bullet where player is
                canon.targetX = player.x
                canon.targetY = player.y
            }
        }
    }


    ScoreTable
    {
        id: scoreTable

        z: 5

        anchors.top:  parent.top
        anchors.left: parent.left

        property int increment: 0

        state: "init"

        states:
        [
            State
            {
                name: "init"

                PropertyChanges
                {
                    target: timer
                    running: false
                }

                PropertyChanges
                {
                    target: scoreTable
                    score: 0
                    increment: 0
                }
            },

            State
            {
                name: "level 1"

                PropertyChanges
                {
                    target: timer
                    running: true
                }

                PropertyChanges
                {
                    target: scoreTable
                    score: 0
                    increment: 10
                }
            }
        ]

        Timer
        {
            id: timer
            interval: 1000; repeat: true
            onTriggered: scoreTable.score += scoreTable.increment
        }
    }


    Item
    {
        id: menu

        z: 10

        anchors.verticalCenter:   parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        Button
        {
            id: beginButton

            anchors.topMargin:        parent.Top
            anchors.horizontalCenter: parent.horizontalCenter

            text: "Begin game"

            onClicked: canvas.state = "game"
        }
    }


    Text{
        id: gameOverText

        transformOrigin: Item.Center
        anchors.horizontalCenter: canvas.horizontalCenter
        anchors.verticalCenter:   canvas.verticalCenter

        text: "GAME OVER"
        color: "red"
        font.bold: true
        font.pixelSize: 50
        visible: false
        z: 5
    }

    // initial state
    state: "init"

    states:
    [
        State
        {
            name: "init"

            PropertyChanges
            {
                target: menu
                opacity: 1
                visible: true
            }

            PropertyChanges
            {
                target: player
                opacity: 0
                visible: false
            }

            PropertyChanges
            {
                target: canon
                opacity: 0
                visible: false
                state: "disabled"
            }

            PropertyChanges
            {
                target: pad
                opacity: 0
                visible: false
            }

            PropertyChanges
            {
                target: scoreTable
                state: "init"
                opacity: 0
                visible: false
            }

            PropertyChanges
            {
                target: ring
                opacity: 0
                visible: false
            }

            PropertyChanges
            {
                target: background
                opacity: 0
                visible: false
            }
        },

        State
        {
            name: "game"

            PropertyChanges
            {
                target: menu
                opacity: 0
                visible: false
            }

            PropertyChanges
            {
                target: scoreTable
                state: "level 1"
            }

            PropertyChanges
            {
                target: canon
                state: "enabled"
            }
        },

        State
        {
            name: "gameOver"

            PropertyChanges
            {
                target: gameOverText
                visible: true
            }

            PropertyChanges
            {
                target: menu
                opacity: 0
                visible: true
            }

            PropertyChanges
            {
                target: player
                opacity: 0
                visible: false
            }

            PropertyChanges
            {
                target: canon
                opacity: 0
                visible: false
                state: "disabled"
            }

            PropertyChanges
            {
                target: pad
                opacity: 0
                visible: false
            }

            PropertyChanges
            {
                target: scoreTable
                state: "init"
                opacity: 0
                visible: false
            }

            PropertyChanges
            {
                target: ring
                opacity: 0
                visible: false
            }

            PropertyChanges
            {
                target: background
                opacity: 0
                visible: false
            }

        }

    ]

}

