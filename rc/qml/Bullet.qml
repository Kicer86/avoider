import QtQuick 2.4

BulletForm {

    id: bullet

    property int canonX
    property int canonY
    property int targetX
    property int targetY

    signal targetHit()

    ParallelAnimation {
        id: bullet_anim

        running: true

        NumberAnimation { target: bullet; property: "x"; from: canonX; to: -10; duration: 5000 }
        NumberAnimation { target: bullet; property: "y"; from: canonY; to: calculateLeftEdge_y(canonX, canonY, targetX, targetY); duration: 5000 }

        onStopped:
        {
            disarm();
        }
    }


    function calculateLeftEdge_y(from_x, from_y, to_x, to_y){

        var a = Math.atan((to_y-from_y)/(to_x-from_x))
        var b = to_y - a*to_x
        return (a*(-10)+b)
    }


    // collision timer - it should be changed to interruption or smth like that
    Timer
    {
        id: collisionTimer

        interval: 20; running: true; repeat: true

        onTriggered: checkCollision()
    }


    function checkCollision(){  // This function check when bullet hits player

       // console.log(bullet.x, " = ", canon.targetX)//uncomment if you wanna see coordinates

        if(bullet.x + 10 > canon.targetX && bullet.x - 10 < canon.targetX){
            if(bullet.y + 20 > canon.targetY && bullet.y - 20 < canon.targetY)
            {
                console.log("KOLIZJA!!!");
                targetHit();
                disarm();
            }
        }
    }

    function disarm()
    {
        bullet.destroy();
    }
}
