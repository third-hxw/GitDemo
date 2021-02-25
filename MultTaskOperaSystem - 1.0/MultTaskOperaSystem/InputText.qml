import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2

Item {
    id: lineEdit
    Layout.preferredWidth: 200
    Layout.preferredHeight: 30
    property alias acount: acountLable
    property alias text: acountLable.text

    property alias name: nameLine

    Text {
        id: acountLable
        text: "账号:"
        font.family: "宋体"
        font.pixelSize: 16
        color: "white"

    }

    TextField {
        id: nameLine
        width: 150
        height: 22
        anchors.left: acountLable.right
        anchors.top: acountLable.top
        anchors.topMargin: -2

        font.family:"宋体"
        Layout.preferredHeight: 30
    }



}

