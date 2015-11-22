import QtQuick 2.4

CanonForm {

    property int targetX
    property int targetY

    Timer {
           interval: 10; running: true; repeat: true
           onTriggered: image_canon.rotation = calcAngle()

           function calcAngle() {   // This function calculate proper angle for canon object

               var position = mapToItem(null, 0, 0);
               var variable = (position.y- targetY)/(position.x - targetX) //mapToItem takes x,y coordinates from Canon on canvas
               var angle = Math.atan(variable)/(2*3.14)*360

               return (angle);
           }
       }

}

