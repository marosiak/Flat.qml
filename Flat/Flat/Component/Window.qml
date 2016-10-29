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

