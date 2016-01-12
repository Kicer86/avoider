/*
  In this level submarine shoots horizontal bullets without any modifications
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


        HorizontalCanon
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
}
