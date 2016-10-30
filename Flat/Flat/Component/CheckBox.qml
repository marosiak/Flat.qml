/*
Example usage:

CheckBox {
    text: "My Checkbox"
}

*/

import QtQuick 2.6
import QtQuick.Controls 2.0

CheckBox {
    FontLoader {
        id: roboto
        source: "../Font/Roboto-Light.ttf"
    }

    id: control
    text: qsTr("CheckBox")
    checked: true
    font.pixelSize: 14
    font.family: roboto.name
    indicator: Rectangle {
        implicitWidth: 26
        implicitHeight: 26
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        radius: 0
        color: root.accentColor

        Rectangle {
            width: 11
            height: width
            anchors.centerIn: parent
            color: control.down ? root.accentColor : root.windowColor
            visible: control.checked
        }
    }

    contentItem: Text {
        text: control.text
        font: control.font
        opacity: enabled ? 1.0 : 0.3
        color: control.down ? "#bdc3c7" : "#ecf0f1"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        leftPadding: control.indicator.width + control.spacing
    }
}
