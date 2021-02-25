import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
Item {
    Button {
        id:arithButton
        width: 30; height: 30
        style: ButtonStyle {
            background: Rectangle{
                id:arithRect
                color:  "transparent"  //设置背景透明

                Text {
                    id:arithText
                    anchors.top:arithImag.bottom
                    anchors.topMargin: 2
                    text: qsTr("算法")
                    font.pixelSize: 15
                    color: "white"
                }

                Image {
                    id: arithImag
                    anchors.bottom:arithRect.top
                    anchors.bottomMargin: 2
                    source: "images/10.png"
                    sourceSize.width: parent.width
                    sourceSize.height: parent.height

                }

            }
        }
    }
}

