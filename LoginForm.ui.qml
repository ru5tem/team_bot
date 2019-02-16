import QtQuick 2.4
import QtQuick.Controls 2.5


Item {
    id: element
    width: 400
    height: 400
    property alias customTextInput: customTextInput
    property alias dividerHorizontal: dividerHorizontal
    property alias rectangleCenterItems: rectangleCenterItems
    property alias rectangleCenter: rectangleCenter
    property alias rectangleTop: rectangleTop
    property alias headline: headline
    property alias lableName: lableName
    property alias buttonStart: buttonStart

    Rectangle {
        id: rectangleTop
        height: 75
        color: "#232321"
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0

        Text {
            id: headline
            color: "#f8c11c"
            text: qsTr("headline")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 12
        }
    }

    Rectangle {
        id: dividerHorizontal
        y: 0
        height: 2
        color: "#676664"
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: rectangleTop.bottom
        anchors.topMargin: 0
    }

    Rectangle {
        id: rectangleCenter
        y: 0
        color: "#232321"
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: dividerHorizontal.bottom
        anchors.topMargin: 0

        Rectangle {
            id: rectangleCenterItems
            x: 423
            y: -20
            width: 200
            height: 200
            color: "#00000000"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            Text {
                id: lableName
                color: "#eeedeb"
                text: qsTr("Text")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 0
                font.pixelSize: 12
            }

            CustomTextInput {
                id: customTextInput
                height: 40
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.top: lableName.bottom
                anchors.topMargin: 5
            }

            Button {
                id: buttonStart
                text: qsTr("Button")
                spacing: 4
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: customTextInput.bottom
                anchors.topMargin: 15
            }


        }
    }

}

























/*##^## Designer {
    D{i:1;anchors_height:75;anchors_width:400;anchors_x:0;anchors_y:0}D{i:3;anchors_height:200;anchors_width:200;anchors_x:61;anchors_y:104}
D{i:5;invisible:true}D{i:4;anchors_height:277;anchors_width:400;anchors_x:190;anchors_y:123}
}
 ##^##*/
