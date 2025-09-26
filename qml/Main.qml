import QtQuick
import QtQuick.Controls
import ParcelLocker

ApplicationWindow {
    visible: true
    width: 1280
    height: 720
    title: qsTr("Parcel Locker")

    StackView {
        id: stack
        anchors.fill: parent
        initialItem: WelcomeScreen { stackView: stack }
    }
}
