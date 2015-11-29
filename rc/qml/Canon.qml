import QtQuick 2.4

CanonForm {

    id: cannon

    property int targetX
    property int targetY

    // rotation (aka aiming ;) ) timer
    Timer {
        interval: 10; running: true; repeat: true
        onTriggered: image_canon.rotation = calcAngle()

        function calcAngle() {   // This function calculate proper angle for canon object

            var position = mapToItem(null, 0, 0);
            var ratio = (position.y- targetY)/(position.x - targetX) //mapToItem takes x,y coordinates from Canon on canvas
            var angle = Math.atan(ratio)/(2*3.14)*360

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

    function createBullet()
    {
        var component = Qt.createComponent("qrc:/qml/Bullet.qml");

        var position = mapToItem(null, 0, 0);
        component.createObject(canvas, {"targetX": targetX + 25,
                                        "targetY": targetY + 25,
                                        "canonX":  position.x,
                                        "canonY":  position.y,
                                        "z":       this.z
                                       });
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
        }
    ]

}

