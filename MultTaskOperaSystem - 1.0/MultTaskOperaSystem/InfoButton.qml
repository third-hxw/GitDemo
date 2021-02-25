import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
Item {
    Button {
        id:infoButton
        width: 30; height: 30
        style: ButtonStyle {
            background: Rectangle{
                id:infoRect
                 color: control.pressed ? "blue" : control.hovered ? "#yellow"
                                    : control.activeFocus ? "#transparent" : "#red"
                //color:  "transparent"  //设置背景透明

                Text {
                    id:infoText
                    anchors.top:imag1.bottom
                    anchors.topMargin: 2
                    text: qsTr("信息")
                    font.pixelSize: 15
                    color: "white"
                }

                Image {
                    id: imag1
                    anchors.bottom:infoText.top
                    anchors.bottomMargin: 2
                    source: "images/14.png"
                    sourceSize.width: parent.width
                    sourceSize.height: parent.height

                }

            }
        }

    }

}

