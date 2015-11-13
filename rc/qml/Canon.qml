import QtQuick 2.4

CanonForm {

//        SequentialAnimation on y { // new animation
//         running: true
//         repeat: true
//         NumberAnimation { to: 150; easing: "easeOutBounce"; duration: 2000 }
//         PauseAnimation { duration: 1000 }
//         NumberAnimation { to: 50; easing: "easeOutQuad"; duration: 1000 }
//       }

    RotationAnimation on rotation { //this jebana animation is working but this above NOT!!!!!
        loops: Animation.Infinite
        from: 0
        to: 360
    }

    }

