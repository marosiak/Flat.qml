import QtQuick 2.6
import QtGraphicalEffects 1.0

Item {
    function open(){
        if(visible == false){visible = true}
        showAnim.running = true
        showAnimOnOpacity.running = true
        showAnimOnOShadow.running = true
        showAnimOnOShadow1.running = true
    }
    function close(){
        hideAnim.running = true
        hideAnimOnOpacity.running = true
        hideAnimOnOShadow.running = true
        hideAnimOnOShadow1.running = true
    }

    visible: false
    NumberAnimation on y {id: showAnim; easing.type: Easing.InQuad; from: -(height); to: ((parent.height/2)-(rect.height/2))-(root.header.height/2); duration: 250 }
    NumberAnimation on opacity {id: showAnimOnOpacity; easing.type: Easing.InQuad; from: 0; to: 1; duration: 400 }
    NumberAnimation on y {id: hideAnim; easing.type: Easing.InQuad; to: -(height); from: ((parent.height/2)-(rect.height/2))-(root.header.height/2); duration: 250 }
    NumberAnimation on opacity {id: hideAnimOnOpacity; easing.type: Easing.InQuad; to: 0; from: 1; duration: 400 }
    implicitHeight: 150
    implicitWidth: 300
    x: ((parent.width/2)-(rect.width/2))
    y: -(width)
    DropShadow {
        anchors.fill: rect
        horizontalOffset: 0
        verticalOffset: 0
        radius: 13.0
        samples: 10
        color: "#80000000"
        source: rect
        visible: false
        NumberAnimation on visible {id: showAnimOnOShadow; easing.type: Easing.InQuad; from: 0; to: 1; duration: 410 }
        NumberAnimation on radius {id: showAnimOnOShadow1; easing.type: Easing.InQuad; from: 0; to: 13; duration: 600 }
        NumberAnimation on visible {id: hideAnimOnOShadow; easing.type: Easing.InQuad; to: 0; from: 1; duration: 410 }
        NumberAnimation on radius {id: hideAnimOnOShadow1; easing.type: Easing.InQuad; to: 0; from: 13; duration: 600 }
    }
    Rectangle {
        id: rect
        anchors.fill: parent
        implicitHeight: parent.width-12
        implicitWidth: parent.height-12
        color: root.accentColor
    }

}
