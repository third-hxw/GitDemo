import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2
import MyMultTask 1.0

Item {
    id:arithPage
    property alias text: showText.text
    property alias show: showText
    property int i:0
    signal qmlSendMsg(string msg)
    MultTask {
        id: cpp_obj
        property string buf: " "
        onBufChanged: {

            buf = input.name.text

        }
    }

    Component.onCompleted: {

        arithPage.onQmlSendMsg.connect(cpp_obj.cppRecvMsg)
        cpp_obj.onCppSendMsg.connect(processB)

    }

    function processB(str){

        console.log('qml function processB',str)
    }
    Rectangle {
        color: "#4F4F4F"
        anchors.fill: parent
        objectName: "arithRect"

        ColumnLayout {

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            spacing: 100
            RowLayout {
                id:layout
                anchors.fill: parent
                spacing: 30
                InputText {
                    id:input
                    text: "输入字符:"
                }
                UserButton {
                    anchors.top:input.top
                    anchors.topMargin: -5
                    onMyClicked: {

                        arithPage.qmlSendMsg(input.name.text)

                        cpp_obj.str = input.name.text
                        cpp_obj.sendSignal()
                        //将接收到的字符转换为大写后显示
                        showText.text = cpp_obj.str.toUpperCase()
                    }
                }
            }

            Text {
                id:showText
                width: 50
                text:" "
                color: "lightgreen"
                font.bold: true
                font.pixelSize: 150
                font.family: "黑体"
                Layout.alignment: Qt.AlignCenter
            }
        }
    }






}

