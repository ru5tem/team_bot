import QtQuick 2.4
import QtQuick.Controls 2.5
import QtQuick.Window 2.3




LoginForm {
    id: loginScene
    signal loginCompleted()
    Connections {
        target:  appCore
        onLoadLastUserName: {
            customTextInput.textIn = _userName
        }
    }

    buttonStart {
        onClicked:  {
            appCore.loginUser(customTextInput.textIn)
        }
    }

    headline {
        text: qsTr("Team bot")
        font.family: deansgate.name
        font.pixelSize: dp(30)
    }

    rectangleTop {
        id: top
        height: parent.height * 0.2
        color: appColorBlackWithTransparency
    }

    dividerHorizontal {
        id: divider
    }

    rectangleCenter {
        id: center
        height: parent.height - divider
        color: appColorBlackWithTransparency
    }

    lableName {
        text: "Enter your name:"
        font.family: deansgate.name
        font.pixelSize: dp(20)
    }

    buttonStart {
        text: "Start"
        font.family: deansgate.name
        font.pixelSize: dp(20)
        width: dp(100)
        height: dp(50)

        background: Rectangle {
                    color: appColorYellow
                    radius: 5
                }
    }

    customTextInput  {
        textIn: ""
        textFont: deansgate.name
        textSize: dp(20)
        borderColor: appColorWhite
        textColor: appColorWhite
        textCenter: true
    }



}



