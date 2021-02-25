import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.2

Item {
    id:layoutwind
    anchors.fill: parent
    Rectangle {
        anchors.fill: parent
        color: "#4F4F4F"
        GridLayout {
            anchors.fill: parent
            anchors.top: parent.top
            anchors.topMargin: 100
            anchors.left: parent.left
            anchors.leftMargin: 100
            rows:7
            columns: 2
            rowSpacing: 10

            InputText {
                id: acountLable
                text: "账号:"
            }
            InputText {
                anchors.left: acountLable.right
                anchors.leftMargin: 50
                id: passwordLable
                text: "密码:"
            }

            Text {
                id: sexLable
                text: qsTr("性别:")
                color: "white"
                font.family: "宋体"
                font.pixelSize: 16
            }
            ComboBox {
                anchors.left: sexLable.right
                Layout.preferredWidth: 150
                model:["男","女"]

            }

            InputText {
                id: emailLanle
                Layout.columnSpan: 2
                text: "邮箱:"
                name.width: 400
            }

            InputText {
                id: emailLanle1
                text: "邮箱:"
                name.width: 250

            }

            UserButton {
                anchors.left: emailLanle1.right
                anchors.leftMargin: 120
                anchors.top: emailLanle1.top
                anchors.topMargin: -2
                text: "验证"
            }

            InputText {
                id: authLable
                text: "验证码:"
                name.width: 250
                anchors.left: emailLanle1.left
                anchors.leftMargin: -15
                Layout.columnSpan: 2
            }

            Text {
                Layout.columnSpan: 2
                id:describeLable
                text: qsTr("描述:")
                font.family: "宋体"
                font.pixelSize: 16
                color: "white"

            }

            DescripText {
                anchors.left: describeLable.right
                anchors.top: describeLable.bottom
                anchors.topMargin: 20
            }



            Row {
                anchors.right: parent.right
                anchors.rightMargin: 20
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 50
                spacing: 10
                UserButton {
                    id:userBtn1
                    radius: 2

                }
                UserButton {
                    id: userBtn2
                    radius:2
                    text: "取消"
                }
            }
        }
    }
}
