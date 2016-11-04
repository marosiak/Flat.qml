import QtQuick 2.7
import QtQuick.Layouts 1.0
import "Flat/Component"


Window {
    id: root
    minimumWidth: 600
    minimumHeight: 300
    windowColor: "#303F9F"  // brighter
    accentColor: "#283593"  // darker
    width: 500
    height: 400
    title: "Flat.qml"
    Column {
        x: 5
        spacing: 8
        Row {
            spacing: 5
            Button {
                buttonText: "First Button"
                onClicked: {
                    root.windowColor = "#303F9F"
                    root.accentColor = "#283593"
                }
            }
            Button {
                buttonText: "Second Button"
                onClicked: {
                    root.windowColor = "#37474F"
                    root.accentColor = "#263238"
                }
            }
            Button {
                buttonText: "test"
                onClicked: {
                    root.windowColor = "#e74c3c"
                    root.accentColor = "#c0392b"
                }
            }
            Button {
                buttonText: "xD"
                onClicked: {
                    root.windowColor = "#34495e"
                    root.accentColor = "#2c3e50"
                }
            }
        }
        Row {
            spacing: 8
            ComboBox {
                model: ["First", "Second", "Third"]
            }
            ComboBox {
                model: ["Firsttttttttttttttttttttttttttt", "Second", "Third"]
            }
        }
        Row {
            spacing: 8
            CheckBox {
                text: "test"
            }
            CheckBox {
                text: "test xd"
            }
        }
        Row {
            spacing: 8
            Column {
                spacing: 8
                ProgressBar {}
                ProgressBar {value: 0.8}
            }
            Column {
                Label {
                    text: "This is Label"
                }

                TextField {}
                Button {
                    buttonText: "open popup"
                    onClicked: popup.open()
                }
            }
        }
    }
    Popup {
        id: popup
        Column {
            anchors.centerIn: parent
            width: parent.width-16
            height: parent.height-16
            Label {
                text: "Lorem Ipsum bla bla test"
            }
            Button {
                buttonText: "ok"
                onClicked: popup.close()
            }
        }
    }
}
