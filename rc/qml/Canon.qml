import QtQuick 2.4

CanonForm {

        SequentialAnimation on image_canon.y { // test animation
         running: true
         loops: Animation.Infinite
         NumberAnimation {  to: 150; duration: 2000 }
         PauseAnimation { duration: 1000 }
         NumberAnimation {  to: 50; duration: 1000 }
       }

    }

