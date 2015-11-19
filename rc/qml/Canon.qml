import QtQuick 2.4

CanonForm {

    Timer {
           interval: 10; running: true; repeat: true
           onTriggered: image_canon.rotation = calcAngle()

           function calcAngle() {   // This function calculate proper angle for canon object

               var variable = (canon.y - player.y)/(canon.x - player.x)
               var angle = Math.atan(variable)/(2*3.14)*360

               return (angle);
           }
       }

}

