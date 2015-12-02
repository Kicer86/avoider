import QtQuick 2.4

BulletForm {

    id: bullet

    property int startX
    property int startY
    property int targetX
    property int targetY

    property int playerX
    property int playerY

    signal targetHit()
    signal disarmed()

    ParallelAnimation {
        id: bullet_anim

        running: true

        NumberAnimation { target: bullet; property: "x"; from: startX; to: -10; duration: 5000 }
        NumberAnimation { target: bullet; property: "y"; from: startY; to: calculateLeftEdge_y(startX, startY, targetX, targetY); duration: 5000 }

        onStopped:
        {
            // bullet reached its litmis. Disarm it
            disarm();
        }
    }


    function calculateLeftEdge_y(from_x, from_y, to_x, to_y){

        var a = Math.atan((to_y-from_y)/(to_x-from_x))
        var b = to_y - a*to_x
        return (a*(-10)+b)
    }


    onXChanged:
    {
        checkCollision()
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
