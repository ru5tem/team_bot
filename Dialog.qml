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
            appCore.sendMessage(textInput.text)
        }
    }

    backgroundTextInput {
        color: "#efefef"
    }

    textInput {
        color: "black"
    }

    listView  {
        delegate: Item {
            id: item
            anchors.left: parent.left
            anchors.right: parent.right
            height: 40
            Text {
                anchors.fill: parent
                anchors.margins: 5
                text:  message
            }
        }
        model: ListModel {
            id: listModel
        }
    }
}

