import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQml.StateMachine 1.0

Rectangle
{
    id: canvas

    width: 800
    height: 600

    z: 0

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

    }

    
    Player
    {
        id: player
        x: 100
        y: 100
        z: 1
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


    Item
    {
        id: menu

        z: 2

        Button
        {
            id: beginButton

            anchors.fill: parent

            text: "Begin game"
        }
    }


    StateMachine
    {
        id: stateMachine
        // set the initial state
        initialState: init

        // start the state machine
        running: true

        State
        {
            id: init

            SignalTransition
            {
                targetState: game
                signal: beginButton.clicked
            }

            onEntered: console.log("init entered")
            onExited: console.log("init exited")
        }

        State
        {
            id: game

            SignalTransition
            {
                targetState: s3
                signal: button.clicked
            }

            onEntered: console.log("game entered")
            onExited: console.log("game exited")
        }

        State
        {
            id: gameOver

            SignalTransition
            {
                targetState: game
                signal: button.clicked
            }

            onEntered: console.log("gameOver entered")
            onExited: console.log("gameOver exited")
        }

    }

}







