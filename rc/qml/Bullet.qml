import QtQuick 2.4

BulletForm {

    id: bullet

    property int canonX
    property int canonY
    property int targetX
    property int targetY

    ParallelAnimation {
        id: bullet_anim

        running: true

        NumberAnimation { target: bullet; property: "x"; from: canonX; to: -10; duration: 5000 }
        NumberAnimation { target: bullet; property: "y"; from: canonY; to: calculateLeftEdge_y(canonX, canonY, targetX, targetY); duration: 5000 }

        onStopped:
        {
            bullet.destroy();
        }
    }


    function calculateLeftEdge_y(from_x, from_y, to_x, to_y){

        var a = Math.atan((to_y-from_y)/(to_x-from_x))
        var b = to_y - a*to_x
        return (a*(-10)+b)
    }

    // collision timer
    Timer
    {
        id: collisionTimer

        interval: 1; running: true; repeat: true

        onTriggered: checkCollision()
    }

    function checkCollision(){
       // console.log(bullet.x)
        console.log(bullet.x, " = ", targetX)
        if(bullet.x===targetX){

        }
    }
}
