/*
  In this level submarine shoots diagonal bullets without any modifications
*/

import QtQuick 2.0

import "../enemies"
import "../enemies/canons"
import ".."

Item
{
    id: level

    property Player target

    Submarine
    {
        id: submarine

        z: level.z
        anchors.right: level.right
        anchors.verticalCenter: level.verticalCenter

        AimingCanon
        {
            id: canon

            z: submarine.z

            transformOrigin: Item.Left
            scale: 0.5

            anchors.left: submarine.left
            anchors.verticalCenter: submarine.verticalCenter

            target: level.target

            state: "enabled"
        }
    }
}
