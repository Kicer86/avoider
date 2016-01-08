import QtQuick 2.4
import QtGraphicalEffects 1.0

Item
{
    id: background

    // background switcher
    Timer
    {
        running: true
        repeat:  true

        interval: 60000

        onTriggered:
        {
            if (background.state == "background1")
                background.state = "background2";
            else if (background.state == "background2")
                background.state = "background1";
        }
    }

    Image
    {
        id: bkg_img1

        source: "qrc:/img/background.svg"
        sourceSize.height: parent.height    // 'sourceSize' is a better solution for vector graphics than 'scale' - scale made pixels
        opacity: 0

        // enable image animation when image is visible
        onOpacityChanged:
        {
            if (opacity > 0 && animation1.running == false)
                animation1.running = true;
            else if (opacity == 0 && animation1.running == true)
                animation1.running = false;
        }
    }

    Image
    {
        id: bkg_img2

        source: "qrc:/img/background2.jpg"

        opacity: 0

        transformOrigin: Item.Center

        width:  background.width  * 2
        height: background.height * 2

        anchors.horizontalCenter: background.horizontalCenter
        anchors.verticalCenter: background.verticalCenter

        // enable image animation when image is visible
        onOpacityChanged:
        {
            if (opacity > 0 && animation2.running == false)
                animation2.running = true;
            else if (opacity == 0 && animation2.running == true)
                animation2.running = false;
        }
    }

    state: "background1"

    states:
    [
        State
        {
            name: "background1"

            PropertyChanges
            {
                target: bkg_img1
                opacity: 1
            }
        },

        State
        {
            name: "background2"

            PropertyChanges
            {
                target: bkg_img2
                opacity: 1
            }
        }
    ]


    // animations sequences for first background
    ParallelAnimation
    {
        id: animation1
        loops:   Animation.Infinite

        SequentialAnimation
        {
            id: xanimation

            loops:   Animation.Infinite
            property int maxX: bkg_img1.width - canvas.width

            NumberAnimation
            {
                target: bkg_img1;
                property: "x";
                from: 0;
                to: -xanimation.maxX;
                duration: 20000
                easing.type: Easing.InOutQuad
            }

            NumberAnimation
            {
                target: bkg_img1;
                property: "x";
                from: -xanimation.maxX;
                to: 0;
                duration: 20000
                easing.type: Easing.InOutQuad
            }
        }

        SequentialAnimation
        {
            id: yanimation

            loops:   Animation.Infinite
            property int maxY: bkg_img1.height - canvas.height

            NumberAnimation
            {
                target: bkg_img1;
                property: "y";
                from: 0;
                to: -yanimation.maxY;
                duration: 18000
                easing.type: Easing.InOutQuad
            }

            NumberAnimation
            {
                target: bkg_img1;
                property: "y";
                from: -yanimation.maxY;
                to: 0;
                duration: 18000
                easing.type: Easing.InOutQuad
            }
        }
    }

    // animation for second background
    ParallelAnimation
    {
        id: animation2

        loops:   Animation.Infinite

        RotationAnimator
        {
           target: bkg_img2;
           from: 0;
           to: 360;
           duration: 20000
           running: false
       }
    }

    // state transition
    transitions: Transition
    {
        NumberAnimation { target: bkg_img1; property: "opacity"; easing.type: Easing.InOutQuad; duration: 2000 }
        NumberAnimation { target: bkg_img2; property: "opacity"; easing.type: Easing.InOutQuad; duration: 2000 }
    }

}
