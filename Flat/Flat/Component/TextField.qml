import QtQuick 2.6
import QtQuick.Controls 2.0

TextField {
    FontLoader {
        id: roboto
        source: "../Font/Roboto-Light.ttf"
    }

    id: control
    placeholderText: qsTr("Example")
    font.pixelSize: 16
    font.family: roboto.name
    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 40
        color: "white"
        border.color: root.accentColor
        border.width: 2
    }
}
