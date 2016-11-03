/*
Example usage:

Window {
    id: root                // ==== Always you have to define id as root! ====
    minimumWidth: 600       // standard is 300
    minimumHeight: 300      // standard is 300
    windowColor: "#303F9F"  // brighter
    accentColor: "#283593"  // darker
    width: 500
    height: 400
}


*/

import QtQuick 2.5
import QtQuick.Controls 2.0
import QtQuick.Window 2.0
import QtQuick.Layouts 1.1
import "../Component"


ApplicationWindow {
    Timer {
        id: debugTimer
        interval: 10; running: false; repeat: false
    }
    property color windowColor: "#34495e"
    property color accentColor: "#2c3e50"
    id: window
    visible: true
    width:  600
    height:  400
    color: windowColor

    title: "Your Title"
    flags: Qt.FramelessWindowHint | Qt.Window
    minimumHeight: 300
    minimumWidth: 300
    Component.onCompleted: {
        if(window.width < window.minimumWidth){
            window.width = window.minimumWidth
        }
        if(window.height < window.minimumHeight){
            window.height = window.minimumHeight
        }

        window.x = (Screen.width/2)-(window.width/2)
        window.y = (Screen.height/2)-(window.height/2)
    }
    FontLoader {
        id: robotoLight
        source: "../Font/Roboto-Light.ttf"
    }

    property point startMousePos
    property point startWindowPos
    property size startWindowSize

    function absoluteMousePos(mouseArea) {
        var windowAbs = mouseArea.mapToItem(null, mouseArea.mouseX, mouseArea.mouseY)
        return Qt.point(windowAbs.x + window.x,windowAbs.y + window.y)
    }
    header: Item {
        width: parent.width
        height: 60
        Rectangle {
            width: parent.width
            height: 50
            color: window.accentColor
            MouseArea {
                anchors.fill: parent
                property real lastMouseX: 0
                property real lastMouseY: 0
                onPressed: {
                    lastMouseX = mouseX
                    lastMouseY = mouseY
                }
                onMouseXChanged: {
                    if(window.width != Screen.width && window.height != Screen.height){
                        window.x += (mouseX - lastMouseX)
                    }
                }
                onMouseYChanged: {
                    if(window.width != Screen.width && window.height != Screen.height){
                        window.y += (mouseY - lastMouseY)
                    }
                }
            }

            Row {
                anchors.right: parent.right
                anchors.rightMargin: 8
                anchors.verticalCenter: parent.verticalCenter
                spacing: 8
                Rectangle {
                    id: minimizeRect
                    width: 24
                    height: width
                    color: window.windowColor
                    Text {
                        color: "white"
                        text: "_"
                        horizontalAlignment: Text.AlignHCenter
                        anchors.centerIn: parent
                        font.family: robotoLight.name
                        font.pixelSize: 20

                    }
                    MouseArea {
                        id: minimizeMA
                        anchors.fill: parent
                        onPressed: parent.color = window.accentColor
                        onReleased: {
                            parent.color = window.windowColor
                            window.showMinimized()
                        }
                    }
                }
                Rectangle {
                    width: 24
                    height: width
                    color: window.windowColor
                    id: maxRect
                    Item {
                        anchors.centerIn: parent
                        Rectangle {
                            x: ((parent.width/2)-(width/2))+1
                            y: ((parent.height/2)-(height/2))-1
                            width: 10
                            height: width
                            color: "transparent"
                            border.color: "white"
                        }
                        Rectangle {
                            id: sec
                            x: ((parent.width/2)-(width/2))-2
                            y: ((parent.height/2)-(height/2))+2
                            width: 10
                            height: width
                            color: window.windowColor
                            border.color: "white"
                        }
                    }
                    MouseArea {
                        id: maximizeMA
                        anchors.fill: parent
                        property bool cache: true
                        property int firstWidth
                        property int firstHeight
                        property int firstX
                        property int firstY
                        onPressed: {
                            sec.color = window.accentColor
                            parent.color = window.accentColor
                        }
                        onReleased: {
                            sec.color = window.windowColor
                            parent.color = window.windowColor

                            if(cache == true){
                                firstWidth = window.width
                                firstHeight = window.height
                                firstX = window.x
                                firstY = window.y
                                window.width = Screen.width
                                window.height = Screen.height
                                window.x = 0
                                window.y = 0
                                cache = false
                            } else {
                                window.width = firstWidth
                                window.height = firstHeight
                                window.x = firstX
                                window.y = firstY
                                cache = true
                            }
                        }
                    }
                }
                Rectangle {
                    width: 24
                    height: width
                    color: window.windowColor
                    id: closeRect
                    Text {
                        color: "white"
                        text: "x"
                        horizontalAlignment: Text.AlignHCenter
                        anchors.centerIn: parent
                        font.family: robotoLight.name
                        font.pixelSize: 20
                    }
                    MouseArea {
                        anchors.fill: parent
                        onPressed: parent.color = window.accentColor
                        onReleased: {
                            parent.color = window.windowColor
                            Qt.quit()
                        }
                    }
                }
            }
            Label {
                width: 100
                height: 20
                text: window.title
                font.pixelSize: 16
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        Rectangle {
            id: topSide
            width: 5
            height: 10
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.top: parent.top
            color: "transparent"
            MouseArea{
                id: topArea
                anchors.fill: parent
                cursorShape : Qt.SizeVerCursor
                onPressed: {
                    startMousePos = absoluteMousePos(topArea)
                    startWindowPos = Qt.point(window.x, window.y)
                    startWindowSize = Qt.size(window.width, window.height)
                }
                onMouseYChanged: {
                    var abs = absoluteMousePos(topArea)
                    var newHeight = Math.max(window.minimumHeight, startWindowSize.height - (abs.y - startMousePos.y))
                    var newY = startWindowPos.y - (newHeight - startWindowSize.height)
                    window.y = newY
                    window.height = newHeight
                }
            }
        }
    }

    Rectangle {
        id: bottomSide
        height: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        color: "transparent"
        MouseArea {
            id: bottomArea
            anchors.fill: parent
            cursorShape : Qt.SizeVerCursor
            onPressed: {
                startMousePos = absoluteMousePos(bottomArea)
                startWindowSize = Qt.size(window.width, window.height)
            }
            onMouseYChanged: {
                var abs = absoluteMousePos(bottomArea)
                var newHeight = Math.max(window.minimumHeight, startWindowSize.height + (abs.y - startMousePos.y))
                window.height = newHeight
            }
        }
    }
    Rectangle {
        id: leftSide
        width: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.left: parent.left
        color: "transparent"
        MouseArea {
            id: leftArea
            anchors.fill: parent
            cursorShape : Qt.SizeHorCursor
            onPressed: {
                startMousePos = absoluteMousePos(leftArea)
                startWindowPos = Qt.point(window.x, window.y)
                startWindowSize = Qt.size(window.width, window.height)
            }
            onMouseYChanged: {
                var abs = absoluteMousePos(leftArea)
                var newWidth = Math.max(window.minimumWidth, startWindowSize.width - (abs.x - startMousePos.x))
                var newX = startWindowPos.x - (newWidth - startWindowSize.width)
                window.x = newX
                window.width = newWidth
            }
        }
    }

    Rectangle {
        id: rightSide
        width: 10
        anchors.top: parent.top
        anchors.topMargin: 9
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 11
        anchors.right: parent.right
        color: "transparent"
        MouseArea {
            id: rightArea
            cursorShape : Qt.SizeHorCursor
            anchors.fill: parent
            property point lastMousePos: Qt.point(0, 0)
            onPressed: {
                startMousePos = absoluteMousePos(rightArea)
                startWindowSize = Qt.size(window.width, window.height)
            }
            onMouseYChanged: {
                var abs = absoluteMousePos(rightArea)
                var newWidth = Math.max(window.minimumWidth, startWindowSize.width + (abs.x - startMousePos.x))
                window.width = newWidth
            }
        }
    }
}
