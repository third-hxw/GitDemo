import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
Item {
    Button {
        id:autoButton
        width: 30; height: 30
        style: ButtonStyle {
            background: Rectangle{
                id:autoRect
                color:  "transparent"  //设置背景透明

                Text {
                    id:autoText
                    anchors.top:autoImag.bottom
                    anchors.topMargin: 2
                    text: qsTr("自动")
                    font.pixelSize: 15
                    color: "white"
                }

                Image {
                    id: autoImag
                    anchors.bottom:autoText.top
                    anchors.bottomMargin: 2
                    source: "images/11.png"
                    sourceSize.width: parent.width
                    sourceSize.height: parent.height

                }

            }
        }

    }

}

