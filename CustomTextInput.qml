import QtQuick 2.0
import QtQuick.Controls 2.5

Rectangle {

    property string borderColor : "white"
    property int borderSize : 1
    property string textIn : ""
    property string textColor : "white"
    property string textFont : "Times"
    property int textSize : 12
    property bool textCenter : true

    color: "transparent"

    TextInput {
        id: textInput
        text: textIn
        color: textColor
        font.family: textFont
        width: parent.width

        anchors.bottom:  borderBotton.top
        font.pixelSize: textSize
        horizontalAlignment: textCenter ? TextInput.AlignHCenter : TextInput.AlignLeft
        onTextChanged: {textIn = text}
    }

    Rectangle {
        id: borderBotton
        color: borderColor
        width: parent.width
        height: borderSize
        anchors.bottom:  parent.bottom
    }



}

