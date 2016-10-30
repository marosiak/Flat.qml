/*
Example usage:

Button {
    buttonText: "My button"
    onClicked: buttonText = "Good job"
}

*/

import QtQuick 2.7
import QtQuick.Controls 2.0

Button {
    id: button
    width: textComponent.width+15
    height: textComponent.height+15
    property string buttonText: "Example"
    FontLoader {
        id: roboto
        source: "../Font/Roboto-Light.ttf"
    }

    background: Rectangle {
        implicitWidth: 100
        implicitHeight: 40
        color: button.down ? root.windowColor : root.accentColor
        radius: 2
    }
    Text {
        id: textComponent
        color: "#ffffff"
        text: buttonText
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.centerIn: parent
        //anchors.fill: parent
        font.family: roboto.name
        font.pointSize: 12
    }
}
