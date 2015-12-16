
import QtQuick 2.0

import "../enemies"

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
        state: "enabled"
        anchors.right: level.right

        targetX: level.targetX
        targetY: level.targetY

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

        onTargetHit: level.targetHit()

    }
}
