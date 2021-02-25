import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Item {
    Button {
        id: listBtn
        width: 30; height: 30
        style: ButtonStyle {
            background: Rectangle {
                id:listRect
                color: "transparent"

                Image {
                    id: listImag
                    anchors.bottom:listText.top
                    anchors.bottomMargin: 2
                    source: "images/9.png"
                    sourceSize.width: parent.width
                    sourceSize.height: parent.height
                }

                Text {
                    id:listText
                    anchors.top:listImag.bottom
                    anchors.topMargin: 2
                    text: qsTr("列表")
                    font.pixelSize: 15
                    color: "white"
                }
            }
        }
    }
}

