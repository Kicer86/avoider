import QtQuick 2.4

BulletForm {

    property int canonX
    property int canonY
    property int targetX
    property int targetY

    Timer
    {
        interval: 1000; running: true; repeat: true
        onTriggered:
        {
            bullet_anim.running = true
        }
    }

    ParallelAnimation {
        id: bullet_anim

        NumberAnimation { target: bullet; property: "x"; from: canonX; to: -10; duration: 500 }
        NumberAnimation { target: bullet; property: "y"; from: canonY; to: calculateLeftEdge_y(canonX, canonY, targetX, targetY); duration: 500 }

    }

    function calculateLeftEdge_y(from_x, from_y, to_x, to_y){

        var a = Math.atan((to_y-from_y)/(to_x-from_x))
        var b = to_y - a*to_x
        return (a*(-10)+b)
    }

}
