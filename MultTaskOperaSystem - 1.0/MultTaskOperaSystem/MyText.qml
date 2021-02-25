import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2


Rectangle {
    Layout.preferredWidth: 50
    Layout.preferredHeight: 30
    property alias acount: acountLable
    property alias text: acountLable.text
    color: "#4F4F4F"

    Text {

        id: acountLable
        text: "账号:"
        font.family: "宋体"
        font.pixelSize: 16
        color: "white"

    }
}

