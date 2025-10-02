import QtQuick
import QtQuick.Controls
import ParcelLocker

Item {
    property StackView stackView

    function onEscapeKey(){
        console.log("Welcome screen: Escape Key, do nothing")
    }

    Rectangle {
        anchors.fill: parent
        color: "#2c3e50"

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
