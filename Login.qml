import QtQuick 2.4
import QtQuick.Controls 2.5
import QtQuick.Window 2.3




LoginForm {
    id: loginScene
    signal loginCompleted()
    Connections {
        target:  appCore
    }

    buttonStart {
        onClicked:  {
            appCore.loginUser(textInput.text)
        }

    }

    headline {
        text: qsTr("Team bot")
    }

    lableName {
        text: "Enter your name:"
    }

    buttonStart {
        text: "START"
    }

    backgroundTextInput {
        color: "#efefef"
    }
    textInput {
        color: "black"

    }
}



