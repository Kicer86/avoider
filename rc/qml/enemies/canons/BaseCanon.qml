import QtQuick 2.4


BaseCanonForm {

    id: cannon

    property int targetX
    property int targetY

    signal stopped()
    signal targetHit()

    // rotation (aka aiming ;) ) timer
    Timer {
        interval: 10; running: true; repeat: true
        onTriggered: image_canon.rotation = calcAngle()

        function calcAngle() {   // This function calculate proper angle for canon object

            var radians = calcRadians();
            var angle = radians/(2*3.14)*360

            return (angle);
        }
    }

    // shooting timer
    Timer
    {
        id: shootingTimer

        interval: 2000; running: true; repeat: true

        onTriggered: createBullet()
    }


    function calcRadians() {   // This function calculate angle between canon and player (in radians)

        var position = mapToItem(null, 0, 0);
        var ratio = (position.y - (targetY + 25) )/(position.x - (targetX + 25) ) //mapToItem takes x,y coordinates from Canon on canvas
        var angle = Math.atan(ratio)

        return (angle);
    }


    function createBullet()
    {
        var component = Qt.createComponent("qrc:/qml/enemies/canons/missiles/Bullet.qml");

        var position = mapToItem(null, 0, 0);
        var bullet = component.createObject(canvas, {playerX: Qt.binding(function() {return targetX + 25} ),
                                                     playerY: Qt.binding(function() {return targetY + 25} ),
                                                     angle:   calcRadians(),
                                                     speed:   3,
                                                     x:       position.x,
                                                     y:       position.y,
                                                     z:       canon.z
                                                    });


        cannon.stopped.connect(bullet.disarm);   // when canon is being stopped, disarm all active bullets
        bullet.targetHit.connect(targetHit);     // when bullet hit target, emit canon's signal about it
        bullet.disarmed.connect(function()       // when bullet dies, disconnect it from canon's signals
        {
            cannon.stopped.disconnect(bullet.disarm)
        })
    }


    state: "disabled"

    states:
    [
        State
        {
            name: "enabled"

            PropertyChanges
            {
                target: shootingTimer
                running: true
            }

        },

        State
        {
            name: "disabled"

            PropertyChanges
            {
                target: shootingTimer
                running: false
            }

            onCompleted:
            {
                stopped()
            }
        }
    ]

    Component.onDestruction:
    {
        stopped()
    }

}

