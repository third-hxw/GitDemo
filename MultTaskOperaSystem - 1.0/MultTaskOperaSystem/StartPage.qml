import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Rectangle {
    id:backRect;
    anchors.fill: parent;
    color: "black"
    Rectangle {//向右拖动
        id:moveTitle;
        anchors.top: backRect.top;
        anchors.left: backRect.left;
        anchors.right: backRect.right;
        height: 35;

        MouseArea{
            anchors.fill:parent
            property point clickPos: "0,0"  //定义一个点

            onPressed: {
                clickPos = Qt.point(mouseX, mouseY)
            }

            onPositionChanged: {  //属性的改变
                var delta = Qt.point(mouseX-clickPos.x, mouseY-clickPos.y)
                root.setX(root.x+delta.x)
                root.setY(root.y+delta.y)
            }
        }
    }

    Rectangle {//向左拖动
        id:leftSizeChange;
        anchors.top: moveTitle.bottom;
        anchors.bottom: downSizeChange.top;
        anchors.left: backRect.left;

        width: 15;

        MouseArea{
            anchors.fill:parent
            property point clickPos: "0,0"  //定义一个点
            cursorShape:Qt.SizeHorCursor
            onPressed: {
                clickPos = Qt.point(mouseX, mouseY)
            }

            onPositionChanged: {  //属性的改变
                var delta = Qt.point(mouseX-clickPos.x, mouseY-clickPos.y)
                if((root.width-delta.x)>root.minimumWidth)
                {
                    root.setX(root.x+delta.x)
                    root.setWidth(root.width-delta.x)
                }
                else
                    root.setWidth(root.minimumWidth)
            }
        }
    }

    Rectangle {//向下拖动
        id:downSizeChange;
        anchors.bottom: backRect.bottom;
        anchors.left: leftSizeChange.right;
        anchors.right: rightSizeChange.left;
        height: 10;//远离发送的按钮
        //color: "green"

        MouseArea{
            anchors.fill:parent
            property point clickPos: "0,0"  //定义一个点
            cursorShape:Qt.SizeVerCursor
            onPressed: {
                clickPos = Qt.point(mouseX, mouseY)
            }

            onPositionChanged: {  //属性的改变
                var delta = Qt.point(mouseX-clickPos.x, mouseY-clickPos.y)
                if((root.height+delta.y)>root.minimumHeight)
                    //                        root.setHeight(root.height+delta.y)
                    root.height += delta.y
                else
                    root.setHeight(root.minimumHeight)
            }
        }
    }

    Rectangle {//向右拖动
        id:rightSizeChange;
        width: 15;
        anchors.right: backRect.right;
        anchors.top:moveTitle.bottom;
        anchors.bottom: downSizeChange.top;
        //color: "yellow";
        MouseArea{
            anchors.fill:parent
            property point clickPos: "0,0"  //定义一个点
            cursorShape:Qt.SizeHorCursor
            onPressed: {
                clickPos = Qt.point(mouseX, mouseY)
            }

            onPositionChanged: {  //属性的改变
                var delta = Qt.point(mouseX-clickPos.x, mouseY-clickPos.y)
                if((root.width+delta.x)>root.minimumWidth)
                {

                    root.setWidth(root.width+delta.x)
                }
                else
                    root.setWidth(root.minimumWidth)
            }
        }
    }

    Rectangle {
        id:italicDownSizeChange
        width: 15
        height: 10
        anchors.right: backRect.right
        anchors.bottom: backRect.bottom
        anchors.left: downSizeChange.right
        anchors.top: rightSizeChange.bottom
        MouseArea {
            anchors.fill:parent
            property point clickPos: "0,0"  //定义一个点
            cursorShape:Qt.SizeFDiagCursor
            onPressed: {
                clickPos = Qt.point(mouseX, mouseY)
            }
            onPositionChanged: {  //属性的改变
                var delta = Qt.point(mouseX-clickPos.x, mouseY-clickPos.y)
                if((root.height+delta.y)>root.minimumHeight &&
                        (root.width+delta.x)>root.minimumWidth){

                    root.height += delta.y
                    root.setWidth(root.width+delta.x)

                }
                else
                    root.setHeight(root.minimumHeight)
            }
        }
    }
}
