import QtQuick 2.4
import QtGraphicalEffects 1.0

Item
{
    Image
    {
        id: bkg_img

        source: "qrc:/img/background.jpg"
    }

    ParallelAnimation
    {
        running: true
        loops:   Animation.Infinite

        SequentialAnimation
        {
            id: xanimation

            loops:   Animation.Infinite
            property int maxX: bkg_img.width - canvas.width

            NumberAnimation
            {
                target: bkg_img;
                property: "x";
                from: 0;
                to: -xanimation.maxX;
                duration: 20000
            }

            NumberAnimation
            {
                target: bkg_img;
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
            property int maxY: bkg_img.height - canvas.height

            NumberAnimation
            {
                target: bkg_img;
                property: "y";
                from: 0;
                to: -yanimation.maxY;
                duration: 18000
            }

            NumberAnimation
            {
                target: bkg_img;
                property: "y";
                from: -yanimation.maxY;
                to: 0;
                duration: 18000
            }
        }
    }

}
