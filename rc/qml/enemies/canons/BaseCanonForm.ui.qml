import QtQuick 2.4

Item {
    property alias image_canon : image_canon

    Image {

        id: image_canon

        x: 0
        y: 0
        anchors.fill: parent
        source: "qrc:/img/canon.png"
    }
}

