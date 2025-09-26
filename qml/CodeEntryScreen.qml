import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import ParcelLocker

Item {
    property StackView stackView
    property string enteredCode: ""

    Rectangle {
        anchors.fill: parent
        color: "#34495e"

        Column {
            anchors.centerIn: parent
            spacing: 20

            Text {
                text: "Enter Pickup Code"
                font.pixelSize: 28
                color: "white"
                anchors.horizontalCenter: parent.horizontalCenter
            }

            TextField {
                id: codeField
                text: enteredCode
                echoMode: TextInput.Password
                readOnly: true
                width: keypad.width
                font.pixelSize: 24
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }

            GridLayout {
                id:keypad
                anchors.horizontalCenter: parent.horizontalCenter
                columns: 3
                columnSpacing: 10
                rowSpacing: 10

                Repeater {
                    model: 9
                    delegate: RoundButton {
                        implicitWidth: 48
                        implicitHeight: 38
                        text: (index + 1).toString()
                        font.pixelSize: 24
                        onClicked: enteredCode += text
                    }
                }

                RoundButton {
                    enabled: enteredCode.length > 0
                    implicitWidth: 48
                    implicitHeight: 38
                    icon.source: "../images/backspace.svg"
                    icon.color: enabled?"#DE2C2C":Qt.darker("#DE2C2C")
                    icon.width: 38
                    icon.height: 38
                    onClicked: {
                            enteredCode = enteredCode.slice(0, -1)
                    }
                }

                RoundButton {
                    implicitWidth: 48
                    implicitHeight: 38
                    text: "0"
                    font.pixelSize: 24
                    onClicked: enteredCode += text
                }
            }

            RowLayout {
                anchors.horizontalCenter: parent.horizontalCenter
                width: keypad.width
                spacing: 10

                RoundButton {
                    text: "Back"
                    onClicked: stackView.pop()
                    Layout.fillWidth: true
                }

                RoundButton {
                    background: Rectangle {
                        radius: parent.radius
                        color: enabled?"#00ff00":"#007f00"
                    }
                    text: "Confirm"
                    enabled: enteredCode.length > 0
                    onClicked: {
                        stackView.replace(Qt.resolvedUrl("ValidatingScreen.qml"), { stackView: stackView, pin: enteredCode })
                    }
                    Layout.fillWidth: true
                }
            }
        }
    }
}
