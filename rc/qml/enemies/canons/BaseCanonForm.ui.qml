import QtQuick 2.4

Item {
    width: 100
    height: 100
    property alias image_canon : image_canon

    Image {

        id: image_canon

        x: 0
        y: 0
        width: 100
        height: 100
        source: "../img/canon.png"
    }
}

