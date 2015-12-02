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


    onXChanged: checkCollision()


    function checkCollision(){  // This function check when bullet hits player

        if( canon.targetX - 25 < bullet.x && bullet.x < canon.targetX + 25)
        {
            if(canon.targetY - 25 < bullet.y && bullet.y < canon.targetY + 25)
            {
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
