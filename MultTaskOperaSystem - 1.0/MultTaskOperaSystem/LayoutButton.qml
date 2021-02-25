import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Item {
    Button {
        id: layoutBtn
        width: 30; height: 30
        style: ButtonStyle {
            background: Rectangle {
                id:layRect
                color: "transparent"

                Image {
                    id: layImag
                    anchors.bottom:layText.top
                    anchors.bottomMargin: 2
                    source: "images/9.png"
                    sourceSize.width: parent.width
                    sourceSize.height: parent.height
                }

                Text {
                    id:layText
                    anchors.top:layImag.bottom
                    anchors.topMargin: 2
                    text: qsTr("布局")
                    font.pixelSize: 15
                    color: "white"
                }
            }
        }
    }
}

