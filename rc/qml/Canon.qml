import QtQuick 2.4

CanonForm {

    Timer {
           interval: 5; running: true; repeat: true
           onTriggered: image_canon.rotation = calcAngle()

           function calcAngle() {
// this section should calculate proper "Y" value
               if (player.y > 0 && player.y <=300){
                   var yyy = (300 - player.y)
               }else if (player.y >300 && player.y < 600){
                   yyy = (-(player.y - 300))
               }


               var variable = (yyy)/(image_canon.x - player.x)
               var angle = Math.atan(variable)/(2*3.14)*360

               console.log(-angle)
               return (-angle);
           }
       }

}

