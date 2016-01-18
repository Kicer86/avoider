import QtQuick 2.0

Item
{
    id: controller

    property int enemies_z_axis: 0
    property int top_limit: 0
    property int bottom_limit: 0
    property Player player

    property int level: 0

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

                level = 1
            }
        },

        State
        {
            name: "game"

            onCompleted:
            {
                var path = "qrc:/qml/levels/Level_" + controller.level + ".qml";
                var levelComponent = Qt.createComponent(path);

                if (levelComponent.status == Component.Error)
                    console.log("Level loading error: " + levelComponent.errorString())
                else
                {
                    var position = mapToItem(null, 0, 0);
                    var level = levelComponent.createObject(canvas,
                                                         {
                                                             target:         Qt.binding(function() {return player} ),
                                                             z:              enemies_z_axis,
                                                             bottom_limit:   Qt.binding(function() {return bottom_limit} ),
                                                             top_limit:      Qt.binding(function() {return top_limit} ),
                                                             "anchors.fill": parent
                                                         });

                    activeLevel.append({"obj": level})
                }
            }
        }

    ]
}
