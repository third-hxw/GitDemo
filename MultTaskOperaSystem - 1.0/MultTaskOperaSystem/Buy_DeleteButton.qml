import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
Item {
    width: 100
    height: 30
    signal sendDelRow()
    Row {
       anchors.fill: parent
       spacing: 0
       Button {
           id:buyButton
           width: 50
           height: 30
           style: ButtonStyle {
               background:Rectangle {
                   implicitWidth: 50
                   implicitHeight: 30
                   border.color: "transparent"
                   color: "transparent"
                   Text {
                       id: buyText
                       anchors.centerIn: parent
                       text: qsTr("购买")
                       font.family: "宋体"
                       font.pixelSize: 12
                       color:buyButton.pressed ? "red" : buyButton.hovered ? "red" :
                             buyButton.activeFocus ? "red" : "green"
                   }


               }
           }
       }
       Button {
           id:deleteButton
           width: 50
           height: 30

           style: ButtonStyle {
               background:Rectangle {
                   implicitWidth: 50
                   implicitHeight: 30
                   border.color: "transparent"
                   color: "transparent"
                   Text {
                       id: deleteText
                       anchors.centerIn: parent
                       text: qsTr("删除")
                       font.family: "宋体"
                       font.pixelSize: 12
                       color:deleteButton.pressed ? "green" : deleteButton.hovered ? "green" :
                             deleteButton.activeFocus ? "green" : "red"
                   }   
               }
           }
           onClicked: {
                sendDelRow()
           }
       }
    }
}

