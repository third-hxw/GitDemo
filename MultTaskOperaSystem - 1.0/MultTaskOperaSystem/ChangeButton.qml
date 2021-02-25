import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Item {
    Button {
        id: changeBtn
        width: 30; height: 30
        style: ButtonStyle {
            background: Rectangle {
                id:changeRect
                color: "transparent"

                Image {
                    id: changeImag
                    anchors.bottom:changeText.top
                    anchors.bottomMargin: 2
                    source: "images/13.png"
                    sourceSize.width: parent.width
                    sourceSize.height: parent.height
                }

                Text {
                    id:changeText
                    anchors.top:changeImag.bottom
                    anchors.topMargin: 2
                    text: qsTr("变换")
                    font.pixelSize: 15
                    color: "white"
                }
            }
        }
    }
}

