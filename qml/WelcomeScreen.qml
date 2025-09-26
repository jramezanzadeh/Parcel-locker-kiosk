import QtQuick
import QtQuick.Controls
import ParcelLocker

Item {
    property StackView stackView

    Rectangle {
        anchors.fill: parent
        color: "#2c3e50"

        Item {
            width: 100
            height: 70
            anchors.top: parent.top
            anchors.right: parent.right

            // Cloud icon
            Image {
                anchors.centerIn: parent
                source: "../images/cloud.png"
                fillMode: Image.PreserveAspectFit
                width: parent.width
                height: parent.height
            }

            Rectangle {
                width: 35; height: 35
                radius: width / 2
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.rightMargin: 5
                color: Backend.online ? "green" : "red"

                Text {
                    anchors.centerIn: parent
                    text: Backend.online ? "✔" : "✖"
                    font.pixelSize: 36
                    color: "white"
                }
            }

            MouseArea {
                anchors.fill: parent
                onDoubleClicked: {
                    Backend.online = !Backend.online
                }
            }
        }

        Column {
            anchors.centerIn: parent
            spacing: 20

            Text {
                text: "Welcome, press start to enter you code"
                color: "white"
                font.pixelSize: 40
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Start"
                font.pixelSize: 24
                onClicked: stackView.push(Qt.resolvedUrl("CodeEntryScreen.qml"), { stackView: stackView })
            }
        }
    }
}
