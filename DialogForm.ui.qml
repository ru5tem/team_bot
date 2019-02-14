import QtQuick 2.4
import QtQuick.Controls 2.5

Item {
    id: element
    width: 400
    height: 400
    property alias backgroundTextInput: backgroundTextInput
    property alias listView: listView
    property alias textInput: textInput
    property alias buttonSend: buttonSend

    Rectangle {
        id: rectangleTop
        height: 59
        color: "#232321"
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
    }

    Rectangle {
        id: rectangleCenter
        color: "#ffffff"
        anchors.bottom: rectangleBottom.top
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: rectangleTop.bottom
        anchors.topMargin: 0

        ListView {
            id: listView
            anchors.fill: parent
            delegate: Item {
                x: 5
                width: 80
                height: 40
                Row {
                    id: row1
                    Rectangle {
                        width: 40
                        height: 40
                        color: colorCode
                    }

                    Text {
                        text: name
                        font.bold: true
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    spacing: 10
                }
            }
            model: ListModel {
                ListElement {
                    name: "Grey"
                    colorCode: "grey"
                }

                ListElement {
                    name: "Red"
                    colorCode: "red"
                }

                ListElement {
                    name: "Blue"
                    colorCode: "blue"
                }

                ListElement {
                    name: "Green"
                    colorCode: "green"
                }
            }
        }
    }

    Rectangle {
        id: rectangleBottom
        y: 316
        height: 84
        color: "#676664"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0

        Rectangle {
            id: backgroundTextInput
            height: 25
            color: "#ffffff"
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 10

            TextInput {
                id: textInput
                y: 5
                height: 20
                color: "#eeedeb"
                text: qsTr("")
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.left: parent.left
                font.pixelSize: 12
            }
        }

        Button {
            id: buttonSend
            y: 47
            width: 100
            height: 27
            text: qsTr("Say")
            spacing: 8
            focusPolicy: Qt.TabFocus
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
        }

    }

}











/*##^## Designer {
    D{i:1;anchors_width:200}D{i:4;anchors_height:160;anchors_width:110;anchors_x:8;anchors_y:80}
D{i:3;anchors_height:154;anchors_width:200;anchors_x:80;anchors_y:117}D{i:2;anchors_height:200;anchors_width:200}
D{i:15;anchors_height:20;anchors_width:80;anchors_x:20;anchors_y:5}D{i:14;anchors_height:84;anchors_width:200;anchors_x:128;anchors_y:316}
D{i:16;anchors_height:20;anchors_width:80}
}
 ##^##*/
