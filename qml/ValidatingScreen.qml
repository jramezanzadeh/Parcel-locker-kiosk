import QtQuick
import QtQuick.Controls
import ParcelLocker

Item {
    property StackView stackView
    property string pin: ""

    Rectangle {
        anchors.fill: parent
        color: "#2ecc71"

        Column {
            anchors.centerIn: parent
            spacing: 20

            BusyIndicator {
                running: true
                width: 64; height: 64
            }

            Text {
                text: "Validating..."
                font.pixelSize: 20
                color: "white"
            }
        }
    }

    Component.onCompleted: {
        Backend.validateCode(pin)
    }

    Connections {
        target: Backend
        function onValidationResult(success, message, lockerId) {
            Qt.callLater(function() {
                if (success) {
                    stackView.replace(Qt.resolvedUrl("DoorControlScreen.qml"),
                                      { stackView: stackView, lockerId: lockerId })
                } else {
                    stackView.replace(Qt.resolvedUrl("ResultScreen.qml"),
                                      { stackView: stackView, success: false, message: message })
                }
             })
        }

    }
}
