import QtQuick 2.0

Rectangle  {
    Rectangle {
        id: background
        anchors.fill: parent;
        color: "#343434"
        Image { source: "pictures/alps-background-beautiful-view-1227520.jpg"; fillMode: Image.PreserveAspectCrop ; anchors.fill: parent;  opacity: 0.5 }
    }
}
