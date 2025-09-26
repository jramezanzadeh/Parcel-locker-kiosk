import QtQuick
import QtQuick.Controls

Item {
    property bool success: false
    property string message: ""
    property StackView stackView

    Rectangle {
        anchors.fill: parent
        color: success ? "green" : "red"

        Column {
            anchors.centerIn: parent
            spacing: 20

            Text {
                text: success ? "Success!" : "Error"
                font.pixelSize: 36
                color: "white"
            }

            Text {
                text: message
                font.pixelSize: 20
                color: "white"
            }
        }
    }

    Timer {
        interval: 2000; running: true; repeat: false
        onTriggered: stackView.pop()
    }
}
