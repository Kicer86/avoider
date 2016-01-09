import QtQuick 2.4

import "../../.."

BulletForm {

    id: bullet

    property real angle
    property real speed

    property Player player

    signal disarmed()

    Timer
    {
        id: bullet_anim

        running: true
        repeat:  true
        interval: 16

        onRunningChanged:
        {
            if (running == false)
            {
                // bullet reached its litmis. Disarm it
                disarm();
            }
        }

        onTriggered:
        {
            bullet.x -= Math.cos(angle) * speed
            bullet.y -= Math.sin(angle) * speed

            checkCollision()

            if (x < 0 || y < 0 || y > canvas.height)
                running = false;
        }
    }


    function calculateLeftEdge_y(from_x, from_y, to_x, to_y){

        var a = Math.atan((to_y-from_y)/(to_x-from_x))
        var b = to_y - a*to_x
        return (a*(-10)+b)
    }


    function checkCollision(){  // This function checks when bullet hits player

        if(player.x < bullet.x && bullet.x < (player.x + player.width)) {
            if(player.y < bullet.y && bullet.y < (player.y + player.height))
            {
                player.hit();
            }
        }
    }

    function disarm()
    {
        console.log("disarming bullet")
        bullet.disarmed();                  // emit signal about disarm
        bullet.destroy();                   // destroy 'this'
    }
}
