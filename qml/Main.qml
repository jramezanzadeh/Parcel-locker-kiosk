import QtQuick
import QtQuick.Controls
import ParcelLocker

ApplicationWindow {
    visible: true
    width: 1280
    height: 720
    title: qsTr("Parcel Locker")

    Item {
        id: statusBar
        height: 40
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.left: parent.left

        // Cloud icon
        Image {
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 5
            source: "../images/cloud.png"
            fillMode: Image.PreserveAspectFit
            height: parent.height
        }

        Rectangle {
            width: 35; height: 35
            radius: width / 2
            anchors.right: parent.right
            anchors.top: parent.top
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

    StackView {
        id: stack
        // anchors.fill: parent
        anchors.top: statusBar.bottom
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        initialItem: WelcomeScreen { stackView: stack }
        focus: true
        Keys.onPressed: (event) => {
            if (event.key === Qt.Key_Escape) {
                currentItem.onEscapeKey()
            }
        }
    }
}
