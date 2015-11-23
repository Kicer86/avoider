import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 1.0


Rectangle
{
    id: canvas

    width: 800
    height: 600

    z: 0

//***   BULLET OBJECT ***
    Bullet
    {
        id: bullet

        x: canon.x + 50
        y: canon.y + 50

    }
//*** END OF BULLET OBJECT ***

    Controler
    {
        id: pad

        z: 1

        transformOrigin: Item.BottomRight
        scale: 0.5

        anchors.right: canvas.right
        anchors.bottom: canvas.bottom
    }


    Canon
    {
        id: canon

        z: 1

        transformOrigin: Item.Center
        scale: 0.5

        anchors.right: canvas.right
        anchors.verticalCenter: canvas.verticalCenter

        targetX: player.x
        targetY: player.y
    }

    
    Player
    {
        id: player
        x: 100
        y: 100
        z: 1
        transformOrigin: Item.Center
    }


        Timer
        {
           interval: 20; running: true; repeat: true
           onTriggered:
           {
               player.x += pad.x_value * 2
               player.y += pad.y_value * 2
           }
        }
    }


    ScoreTable
    {
        id: scoreTable

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

        z: 2

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
            }

            PropertyChanges
            {
                target: pad
                opacity: 0
                visible: false
            }

            PropertyChanges
            {
                target: bullet
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
        },

        State
        {
            name: "gameOver"
        }

    ]

}
