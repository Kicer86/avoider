
import QtQuick 2.0

import "../enemies"
import "../enemies/canons"
import ".."

Item
{
    id: level

    property int top_limit: 0
    property int bottom_limit: 0
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
                target:   submarine
                property: "y"
                from:     top_limit
                to:       bottom_limit - submarine.height
                duration: 5000
                easing.type: Easing.InOutQuad
            }

            NumberAnimation
            {
                target:   submarine
                property: "y"
                from:     bottom_limit - submarine.height
                to:       top_limit
                duration: 5000
                easing.type: Easing.InOutQuad
            }
        }

    }
}
