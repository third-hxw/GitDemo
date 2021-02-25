import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2
import QtQuick.Controls.Styles 1.4

Rectangle {
    id:backRect;
    Layout.fillWidth: true
    Layout.preferredHeight:parent.height
    color: "#363636"
    //标题栏退出按

    Rectangle {
        Layout.fillWidth: true
        Layout.preferredHeight:parent.height * 0.045
        anchors.left: parent.left
        anchors.leftMargin: 20
        color: "#363636"
        Text {
            id: text1
            text: qsTr("Master-V1.0")
            color: "white"
            font.pixelSize: 15
            font.family: "微软雅黑"
            font.bold: true
            anchors.top: parent.top
            anchors.topMargin: 5
        }
    }
    Button {
        width: 20
        height: 20
        anchors.right: parent.right
        anchors.rightMargin:4
        anchors.top: parent.top
        anchors.topMargin: 5
        style: ButtonStyle {
            background: Rectangle {
                color: "#363636"
                border.width: 2
                border.color: "white"
                anchors.fill: parent
                radius: parent.width/2
                Text {
                    text: "×"
                    anchors.centerIn: parent
                    font.pixelSize: 20;
                    color: "white"
                }

            }
        }
        onClicked: {
            Qt.quit();
        }
    }
}


