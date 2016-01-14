import QtQuick 2.0

Item
{
    id: controller

    property int enemies_z_axis: 0
    property int top_limit: 0
    property int bottom_limit: 0
    property Player player

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
        },

        State
        {
            name: "level_02"
        }
    ]
}
