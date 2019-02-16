import QtQuick 2.4
import QtQuick.Controls 2.5
import QtQuick.Window 2.3



DialogForm {
    id: dialogScene
    signal sendMessage()
    Connections {
        target:  appCore
        onAddMessage : {
            listModel.append({message: _message})
        }
    }

    buttonSend  {
        onClicked:  {
            appCore.sendMessage(customTextInput.textIn)
        }
    }


    customTextInput {
        borderColor: appColorWhite
        textColor: appColorWhite
        height: dp(24)
        textSize: dp(22)
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        textCenter: false
    }

    rectangleTop {
        id: top
        height: parent.height * 0.10
        color: appColorBlackWithTransparency
    }

    topText {
        text: "Chat"
        font.family: deansgate.name
        font.pixelSize: dp(30)
        color: appColorYellow
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }


    rectangleBottom  {
        id: bottom
        height: parent.height * 0.2
        color: appColorBlackWithTransparency
    }

    rectangleCenter {
        id: center
        height: parent.height - top - bottom
    }

    buttonSend {
        text: "Отправить"
        font.family: deansgate.name
        font.pixelSize: dp(20)
        width: dp(150)
        height: dp(40)

        background: Rectangle {
                    color: appColorYellow
                    radius: 5
                }
    }

    rectangleCenter {
        color: appColorWhiteWithTransparency
    }



    listView  {
        delegate: Item {
            id: item
            anchors.left: parent.left
            anchors.right: parent.right
            height: dp(30)
            Text {
                anchors.fill: parent
                anchors.margins: 5
                text:  message
                font.family: deansgate.name
                font.pixelSize: dp(12)
            }
        }
        model: ListModel {
            id: listModel
        }
    }
}

