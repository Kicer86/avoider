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

    Timer
    {
        id: function_timer

        interval: 100; running:false; repeat: true

        onTriggered: createBullet()
    }

    function createBulletX3(){
        function_timer.running = true
        var i = 0;
        for(i=0; i<3; i++){

            console.log("ddd")
            for(i=0; i<1000; i++)
            {
                //sleep
            }
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

