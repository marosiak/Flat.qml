/*
Example usage:

ComboBox {
    model: ["example1", "example2", "example3"]
}

*/

import QtQuick 2.6
import QtQuick.Controls 2.0

ComboBox {
    id: control
    model: ["First", "Second", "Third"]
    FontLoader {
        id: roboto
        source: "../Font/Roboto-Light.ttf"
    }
    font.family: roboto.name
    font.pixelSize: 13
    delegate: ItemDelegate {
        width: control.width
        text: modelData
        font.family: roboto.name
        font.weight: control.currentIndex === index ? Font.DemiBold : Font.Normal
        highlighted: control.highlightedIndex == index
    }

    indicator: Canvas {
        x: control.width - width - control.rightPadding
        y: control.topPadding + (control.availableHeight - height) / 2
        width: 12
        height: 8
        contextType: "2d"

        Connections {
            target: control
            onPressedChanged: indicator.requestPaint()
        }

        onPaint: {
            context.reset();
            context.moveTo(0, 0);
            context.lineTo(width, 0);
            context.lineTo(width / 2, height);
            context.closePath();
            context.fillStyle = control.pressed ? root.accentColor : root.windowColor;
            context.fill();
        }
    }

    contentItem: Text {
        leftPadding: 0
        rightPadding: control.indicator.width + control.spacing
        text: control.displayText
        font: control.font
        color: "white"
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    background: Rectangle {
        implicitWidth: 120
        implicitHeight: 40
        color: control.pressed ? root.windowColor : root.accentColor
        radius: 2
    }
}
