import QtQuick 2.4

Item {
    width: 10
    height: 10

    property alias bullet_img : bullet_img

    Rectangle {
        id: bullet_img
        x: 0
        y: 0
        width: 10
        height: 10
        color: "#078000"
    }

}

