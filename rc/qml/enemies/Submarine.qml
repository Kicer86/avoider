
import QtQuick 2.4

import "canons"

Rectangle
{
    id: submarine

    width:  100
    height: 50

    color: "#ff0000"
    radius: 100

    property int targetX
    property int targetY

    signal targetHit()

    BaseCanon
    {
        id: canon

        z: submarine.z

        transformOrigin: Item.Center
        scale: 0.5

        anchors.left: submarine.left
        anchors.verticalCenter: submarine.verticalCenter

        targetX: submarine.targetX
        targetY: submarine.targetY

        state: submarine.state

        onTargetHit:
        {
            submarine.targetHit()
        }
    }

    state: "disabled"

    states:
    [
        State
        {
            name: "enabled"
        },

        State
        {
            name: "disabled"
        }
    ]


    SequentialAnimation
    {
        id:      vertical_move
        loops:   Animation.Infinite
        running: true

        NumberAnimation
        {
            target: submarine;
            property: "y";
            from: 0;
            to: 300;
            duration: 5000
            easing.type: Easing.InOutQuad
        }

        NumberAnimation
        {
            target: submarine;
            property: "y";
            from: 300;
            to: 0;
            duration: 5000
            easing.type: Easing.InOutQuad
        }
    }

}
