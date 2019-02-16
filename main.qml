import QtQuick 2.9
import QtQuick.Window 2.2



Window {
    FontLoader {id: deansgate; source: "qrc:/fonts/DeansgateCondensed-Bold.ttf"}
    property string appColorBlack : "#232321"
    property string appColorBlackWithTransparency : "#e0232321"
    property string appColorWhite : "#eeedeb"
    property string appColorWhiteWithTransparency : "#e0eeedeb"
    property string appColorYellow : "#f8c11c"

    property int dpi: Screen.pixelDensity * 25.4

    function dp(x){
        if(dpi < 120) {
                return x; // Для обычного монитора компьютера
           } else {
                return x*(dpi/160);
           }
    }


    id: root
    visible: true
    width: 480
    height: 620


    Connections {
        target:  appCore
        onOpenDialog: {
          background.visible = true
          login.visible = false
          dialog.visible = true
        }
    }

    Background {
        id: background
        anchors.fill: parent

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
}









