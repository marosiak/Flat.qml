import QtQuick 2.6
import QtQuick.Controls 2.0

ProgressBar {
    id: control
    value: 0.5
    height: 15
    implicitHeight: 15
    Component.onCompleted: control.height = 15

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 4
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        color: root.accentColor
        radius: 0
    }

    contentItem: Item {
        implicitWidth: background.implicitWidth
        implicitHeight: background.implicitHeight

        Rectangle {
            width: control.visualPosition * background.width
            height: parent.height
            radius: 0
            border.width: 3
            border.color: root.accentColor
            color: root.windowColor
        }
    }
}
