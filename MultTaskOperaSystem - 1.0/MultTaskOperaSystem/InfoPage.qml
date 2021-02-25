import QtQuick 2.0

Item {
    id: infoPage
    Rectangle {
        id: rect1
        width: parent.width
        height:btnPage.height
        color: "#4F4F4F"

        Column {
            anchors.centerIn: parent
            spacing: 10
            Text{
                id:text2
                text: "欢迎使用Master-V1.0"
                font.pixelSize: 20
                font.family: "楷体"
                font.bold: true
                color: "white"
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignHCenter//(1)

            }
            Text{
                id:text3
                width: parent.width
                height: 30
                text: qsTr("版权所有@最终解释权归深圳市科比特航空科技有限公司")
                font.pixelSize: 20
                font.family: "楷体"
                font.bold: true
                color: "white"
                horizontalAlignment: Text.AlignHCenter//(1)

            }
        }

    }

}



