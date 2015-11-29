import QtQuick 2.4
import QtGraphicalEffects 1.0

Item
{
    id: background


    Timer
    {
        running: true
        repeat:  true

        interval: 6000

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

        source: "qrc:/img/background.jpg"

        visible: false
        opacity: 0
    }

    Image
    {
        id: bkg_img2

        source: "qrc:/img/background2.jpg"

        visible: false
        opacity: 0

        transformOrigin: Item.Center

        width:  background.width  * 2
        height: background.height * 2

        anchors.horizontalCenter: background.horizontalCenter
        anchors.verticalCenter: background.verticalCenter
    }

    state: "background2"

    states:
    [
        State
        {
            name: "background1"

            PropertyChanges
            {
                target: animation1
                running: true;
            }

            PropertyChanges
            {
                target: bkg_img1
                visible: true;
                opacity: 1
            }
        },

        State
        {
            name: "background2"

            PropertyChanges
            {
                target: animation2
                running: true
            }

            PropertyChanges
            {
                target: bkg_img2
                visible: true;
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
            }

            NumberAnimation
            {
                target: bkg_img1;
                property: "x";
                from: -xanimation.maxX;
                to: 0;
                duration: 20000
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
            }

            NumberAnimation
            {
                target: bkg_img1;
                property: "y";
                from: -yanimation.maxY;
                to: 0;
                duration: 18000
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

}
