import QtQuick 2.0

Item
{
    id: controller

    property int enemies_z_axis: 0

    property int playerX
    property int playerY

    signal playerHit()

    state: "inactive"

    ListModel
    {
        id: activeLevel
    }

    states:
    [
        State
        {
            name: "inactive"

            onCompleted:
            {
                while(activeLevel.count > 0)
                {
                    activeLevel.get(0).obj.destroy();
                    activeLevel.remove(0);
                }
            }
        },

        State
        {
            name: "level_01"

            onCompleted:
            {
                var levelComponent = Qt.createComponent("qrc:/qml/levels/Level_01.qml");

                var position = mapToItem(null, 0, 0);
                var level = levelComponent.createObject(canvas,
                                                     {
                                                         targetX: Qt.binding(function() {return playerX} ),
                                                         targetY: Qt.binding(function() {return playerY} ),
                                                         z:       enemies_z_axis,
                                                         width:   canvas.width,
                                                         height:  canvas.height,
                                                     });

                level.targetHit.connect(controller.playerHit);

                activeLevel.append({"obj": level})
            }
        },

        State
        {
            name: "level_02"
        }
    ]
}
