import QtQuick 2.6
import QtQuick.Controls 2.0

Label {
    font.pixelSize: 13
    FontLoader {
        id: roboto
        source: "../Font/Roboto-Light.ttf"
    }
    font.family: roboto.name
    text: qsTr("Label")
    color: "#ecf0f1"
}
