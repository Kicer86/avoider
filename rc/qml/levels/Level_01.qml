
import QtQuick 2.0

import "../enemies"
import "../enemies/canons"

Item
{
    id: level

    property int targetX
    property int targetY

    signal targetHit()

    Submarine
    {

        id: submarine

        z: level.z
        anchors.right: level.right


        Horizontal
        {
            id: canon

            z: submarine.z

            transformOrigin: Item.Left
            scale: 0.5

            anchors.left: submarine.left
            anchors.verticalCenter: submarine.verticalCenter

            targetX: level.targetX
            targetY: level.targetY

            state: "enabled"

            onTargetHit:
            {
                level.targetHit()
            }
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
