import QtQuick 2.5
import QtQuick.Controls 2.0
import QtQuick.Window 2.0
import QtQuick.Layouts 1.1


ApplicationWindow {
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

    function absoluteMousePos(mouseArea){
        var windowAbs = mouseArea.mapToItem(null, mouseArea.mouseX, mouseArea.mouseY)
        return Qt.point(windowAbs.x + window.x,windowAbs.y + window.y)
    }
    header: Item {
        width: parent.width
        height: 60
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
                    window.x += (mouseX - lastMouseX)
                }
                onMouseYChanged: {
                    window.y += (mouseY - lastMouseY)
                }
            }
            Row {
                anchors.right: parent.right
                anchors.rightMargin: 8
                anchors.verticalCenter: parent.verticalCenter
                spacing: 8
                Rectangle {
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
                        anchors.fill: parent
                        onPressed: parent.color = window.accentColor
                        onReleased: parent.color = window.windowColor
                    }
                }
                Rectangle {
                    width: 24
                    height: width
                    color: window.windowColor
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
                            x: ((parent.width/2)-(width/2))-2
                            y: ((parent.height/2)-(height/2))+2
                            width: 10
                            height: width
                            color: window.windowColor
                            border.color: "white"
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        onPressed: parent.color = window.accentColor
                        onReleased: parent.color = window.windowColor
                    }
                }
                Rectangle {
                    width: 24
                    height: width
                    color: window.windowColor
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
                        onReleased: parent.color = window.windowColor
                    }
                }
            }
        }

    }


    Rectangle{
        id: bottomSide
        height: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        color: "transparent"
        MouseArea {
            cursorShape : Qt.SizeVerCursor
            anchors.fill: parent
            property point lastMousePos: Qt.point(0, 0)
            onPressed: {
                lastMousePos = Qt.point(mouseX, mouseY);
            }
            onMouseYChanged: window.height += (mouseY - lastMousePos.y)
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
            cursorShape : Qt.SizeHorCursor
            anchors.fill: parent
            property point lastMousePos: Qt.point(0, 0)
            onPressed: {
                lastMousePos = Qt.point(mouseX, mouseY);
            }
            onMouseXChanged: window.width+= (mouseX - lastMousePos.x)
        }
    }
}

