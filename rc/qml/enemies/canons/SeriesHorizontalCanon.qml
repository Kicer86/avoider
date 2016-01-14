import QtQuick 2.4

import "../../"

BaseCanonForm
{

    id: cannon

    property Player target

    signal stopped()

    // shooting timer
    Timer
    {
        id: shootingTimer

        interval: 2000; running: true; repeat: true

        onTriggered: createBulletX3()
    }

    function delay(delayTime) {
        timer = Qt.createQmlObject()("import QtQuick 2.0; Timer {}", parent);
        timer.interval = delayTime;
        timer.repeat = false;
        timer.start();
    }

    function createBulletX3(){

        var i = 0;
        for(i=0; i<3; i++){
           createBullet();
            delay(100);
        }
    }


    function createBullet()
    {
            var component = Qt.createComponent("qrc:/qml/enemies/canons/missiles/Bullet.qml");
            if (component.status == Component.Error)
            {
                console.log("Bullet loading error: " + component.errorString())
            }else{
                console.log("Bullet OK!!!!!")
            }

            var position = mapToItem(null, 0, 0);
            var bullet = component.createObject(canvas, {player: Qt.binding(function() {return target} ),
                                                         angle:  0,
                                                         speed:  3,
                                                         x:      position.x,
                                                         y:      position.y,
                                                         z:      canon.z
                                                        });


            cannon.stopped.connect(bullet.disarm);   // when canon is being stopped, disarm all active bullets
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
