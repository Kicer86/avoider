import QtQuick 2.4

BulletForm {

    id: bullet

    property real angle
    property real speed

    property int playerX
    property int playerY

    signal targetHit()
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


    function checkCollision(){  // This function check when bullet hits player

        // console.log(bullet.x, " = ", canon.targetX)//uncomment if you wanna see coordinates

        if(playerX - 20 < bullet.x && bullet.x < playerX + 20){
            if(playerY - 20 < bullet.y && bullet.y < playerY + 20)
            {
                console.log("KOLIZJA!!!");
                targetHit();
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
