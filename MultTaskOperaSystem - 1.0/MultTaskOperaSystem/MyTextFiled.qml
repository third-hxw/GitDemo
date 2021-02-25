import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2

Rectangle {
    Layout.preferredHeight: 30
    Layout.preferredWidth: 200
    property alias name: nameLine
    color: "#4F4F4F"
    TextField {
        id: nameLine
        anchors.fill: parent
        font.family:"宋体"
    }
}

