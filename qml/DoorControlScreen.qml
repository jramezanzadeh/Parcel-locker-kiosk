import QtQuick
import QtQuick.Controls
import ParcelLocker

Item {
    property StackView stackView
    property string lockerId: ""
    DoorController {
        id: door
    }

    Rectangle {
        anchors.fill: parent
        color: "#2980b9"

        Column {
            anchors.centerIn: parent
            spacing: 20

            Text {
                text: "Locker " + lockerId
                font.pixelSize: 28
                color: "white"
                horizontalAlignment: Text.AlignHCenter
            }

            Text {
                id: statusText
                text: "Status: " + door.status
                font.pixelSize: 20
                color: "white"
            }

            Row {
                spacing: 20

                Button {
                    text: "Open Door"
                    font.pixelSize: 22
                    onClicked: door.open()
                }

                Button {
                    text: "Close Door"
                    font.pixelSize: 22
                    onClicked: door.close()
                }
            }

            Button {
                text: "Finish"
                font.pixelSize: 22
                onClicked: stackView.replace(Qt.resolvedUrl("ResultScreen.qml"),
                    {   stackView: stackView,
                        success: true,
                        message: "Pickup complete" })
            }
        }
    }
}
