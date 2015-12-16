
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




}
