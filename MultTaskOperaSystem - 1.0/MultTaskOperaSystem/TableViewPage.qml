import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import MyDataModel 1.0
Rectangle {
    id:tableViewPage
    anchors.fill: parent
    color: "#4F4F4F"

    signal sendNums(var num)
    DataModel {
        id: dataModel
        roles: ["goodsId","name","price","time"]

    }

    TableView{
        id :tableView
        width: parent.width
        height: parent.height/1.5
        anchors.centerIn: parent
        focus: true
        alternatingRowColors : false
        model: dataModel
        TableViewColumn {
            id:checkedColumn

            role: "checked"
            title: "选择"
            width: tableView.viewport.width * 0.5/tableView.columnCount

        }
        TableViewColumn {
            role: "goodsId"
            title: "订单编号"
            width: tableView.viewport.width/tableView.columnCount
        }
        TableViewColumn {
            role: "name"
            title: "商品名"
            width: tableView.viewport.width/tableView.columnCount
        }

        TableViewColumn {
            id: numberColumn
            role: "num"
            title: "数量"
            width: tableView.viewport.width/tableView.columnCount

            delegate: Rectangle {
                id:numberRect
                width:tableView.viewport.width/tableView.columnCount
                height: tableView.viewport.height/tableView.columnCount
                color: "transparent"
                property int num: 0
                Row {
                    spacing: 10
                    anchors.centerIn: parent
                    UserButton {
                        width: 20
                        height: 20
                        border.color: "transparent"
                        text: "+"
                        onMyClicked: {
                            num++;
                            tableViewPage.sendNums(num)
                        }
                    }
                    Text {
                        id: numbersText
                        font.pixelSize: 15
                        font.family: "宋体"
                        color: "blue"
                        text: num
                    }
                    UserButton {

                        height: 20
                        width: 20
                        color: "blue"
                        border.color: "transparent"
                        text: "－"
                        onMyClicked: {

                            if(num > 0)
                            {
                                num--
                            }
                            tableViewPage.sendNums(num)
                        }
                    }
                }
            }
        }

        TableViewColumn {
            id: priceColumn
            role: "price"
            title: "价格"
            width: tableView.viewport.width/tableView.columnCount
        }

        TableViewColumn {
            role: "time"
            title: "加入时间"
            width: tableView.viewport.width/tableView.columnCount
        }

        TableViewColumn {

            role:"operate"
            title:  "操作"
            width: tableView.viewport.width/tableView.columnCount
            delegate:Rectangle {
                width:tableView.viewport.width/tableView.columnCount

                color: "transparent"
                Buy_DeleteButton{
                    id:buy_del
                    anchors.centerIn: parent

                }
                Connections {
                    target: buy_del

                    onSendDelRow:{
                        dataModel.removeRows(styleData.row,1)
                    }
                }
            }


        }


        itemDelegate:Item {
            CheckBox {
                anchors.centerIn: parent
                checked: styleData.value
                visible: isCheckColumn( styleData.column )
            }

            Text{
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.fill: parent
                text: styleData.value
                color: styleData.selected? "red" : "black"
                font.family: "宋体"
                font.pixelSize: 12
                elide: styleData.elideMode
                visible: !isCheckColumn( styleData.column )
            }

            function isCheckColumn( columnIndex )
            {
                return tableView.getColumn( columnIndex ) === checkedColumn
            }

        }

        //自定义表头代理
        headerDelegate:
            Rectangle{
            color: "#00498C"
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#085FB2" }
                GradientStop { position: 1.0; color: "#00498C" }
            }

            width: 100;
            height: 40
            border.color: "black"

            Text
            {
                anchors.centerIn : parent
                text: styleData.value
                font.pixelSize: parent.height*0.5
            }
        }

        //行代理可以修改行高等信息
        rowDelegate: Rectangle {
            height: 50
            color: "white"
            anchors.leftMargin: 2

        }

        style: TableViewStyle{
            textColor: "white"
            highlightedTextColor : "#00CCFE"  //选中的颜色
            backgroundColor : "white"
        }
    }

}
