import QtQuick 2.0

Item
{
    id: controller

    property int enemies_z_axis: 0

    property int playerX
    property int playerY

    signal playerHit()

    state: "inactive"

    states:
    [
        State
        {
            name: "inactive"
        },

        State
        {
            name: "level_01"

            onCompleted:
            {
                var submarineComponent = Qt.createComponent("qrc:/qml/enemies/Submarine.qml");

                var position = mapToItem(null, 0, 0);
                var submarine = submarineComponent.createObject(canvas,
                                                     {
                                                         targetX: Qt.binding(function() {return playerX} ),
                                                         targetY: Qt.binding(function() {return playerY} ),
                                                         "anchors.right": canvas.right,
                                                         state: "enabled",
                                                         z: enemies_z_axis
                                                     });

                submarine.targetHit.connect(controller.playerHit);
            }
        },

        State
        {
            name: "level_02"
        }
    ]
}
