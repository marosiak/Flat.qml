import QtQuick 2.7
import QtQuick.Layouts 1.0
import "Flat/Component"


Window {
    id: root                // ==== You have to define it as root! ====
    minimumWidth: 600       // standard is 300
    minimumHeight: 300      // standard is 300
    windowColor: "#303F9F"  // brighter
    accentColor: "#283593"  // darker
    width: 500
    height: 400
    Row {
        x: 5
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
                root.windowColor = "#3498db"
                root.accentColor = "#2980b9"
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
}
