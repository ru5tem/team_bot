import QtQuick 2.9
import QtQuick.Window 2.2


Window {
    id: root
    visible: true
    width: 480
    height: 620

    Connections {
        target:  appCore
        onOpenDialog: {
          login.visible = false
          dialog.visible = true
        }
    }

    Login {
        id: login
        visible: true
        anchors.fill: parent
    }

    Dialog {
        id: dialog
        visible: false
        anchors.fill: parent
    }
}









