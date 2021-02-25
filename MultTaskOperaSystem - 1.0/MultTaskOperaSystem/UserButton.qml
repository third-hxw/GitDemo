import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Rectangle {
    property int radius: 0
    width: 60; height: 25
    property alias text: tex.text
    signal myClicked()

    border.width: 2
    border.color: "white"
    color: "#00BFFF"

    Text{
        id:tex;
        color: "white"
        font.pointSize:11;
        font.family: "宋体"
        anchors.centerIn: parent;
        text: "确认";
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            myClicked()
        }


    }

}




