import QtQuick 2.4

BulletForm {

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

//       property var from_x : canon.x + 50
//       property var from_y : canon.y + 50
//       property var to_x : player.x + 25
//       property var to_y : player.y + 25

        NumberAnimation { target: bullet; property: "x"; from:  canon.x + 50; to: -10; duration: 500 }
        NumberAnimation { target: bullet; property: "y"; from: canon.y + 50; to: calculateLeftEdge_y(canon.x + 50, canon.y + 50, player.x + 25, player.y + 25); duration: 500 }

        }
    function calculateLeftEdge_y(from_x, from_y, to_x, to_y){


       var a = Math.atan((to_y-from_y)/(to_x-from_x))
        var b = to_y - a*to_x
        return (a*(-10)+b)
    }



}
