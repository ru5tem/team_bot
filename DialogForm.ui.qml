import QtQuick 2.4
import QtQuick.Controls 2.5

Item {
    id: element
    width: 400
    height: 400
    property alias customTextInput: customTextInput
    property alias topText: topText
    property alias rectangleBottom: rectangleBottom
    property alias rectangleCenter: rectangleCenter
    property alias rectangleTop: rectangleTop
    property alias listView: listView
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

        Text {
            id: topText
            width: 200
            height: 50
            text: qsTr("Text")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.top: parent.top
            font.pixelSize: 12
        }
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

        CustomTextInput {
            id: customTextInput
            height: 40
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 10
        }

        Button {
            id: buttonSend
            x: 10
            width: 100
            height: 20
            text: qsTr("Say")
            anchors.top: customTextInput.bottom
            anchors.topMargin: 10
            spacing: 8
            focusPolicy: Qt.TabFocus
            anchors.left: parent.left
            anchors.leftMargin: 10
        }

    }


}



















/*##^## Designer {
    D{i:2;anchors_height:200;anchors_width:200}D{i:1;anchors_width:200}D{i:5;anchors_height:160;anchors_width:110;anchors_x:8;anchors_y:80}
D{i:4;anchors_height:160;anchors_width:110;anchors_x:8;anchors_y:80}D{i:3;anchors_height:154;anchors_width:200;anchors_x:80;anchors_y:117}
D{i:15;anchors_height:20;anchors_width:80;anchors_x:0;anchors_y:47}D{i:16;anchors_height:20;anchors_width:80;anchors_y:47}
D{i:14;anchors_x:0;anchors_y:0}
}
 ##^##*/
