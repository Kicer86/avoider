
import QtQuick 2.5

import "canons"

Rectangle
{
    id: submarine

    width:  100
    height: 50

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
}
