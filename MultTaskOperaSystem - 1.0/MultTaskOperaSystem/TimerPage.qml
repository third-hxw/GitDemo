import QtQuick 2.0
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.4

Rectangle {
    id:autoPage

    color: "#4F4F4F"
    property alias name: timer
    QtObject {
        id:attrs
        property int counter
        Component.onCompleted: {
            attrs.counter = 0
        }
    }

    ColumnLayout{
        anchors.centerIn: parent
        spacing: 20
        Text {
            id: autoText
            width: parent.width
            text: qsTr("自动变化数字:")
            color: "yellow"
            font.family: "宋体"
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter//(1)
            verticalAlignment:   Text.AlignVCenter//(2)
        }
        Text {
            id: numText
            text: qsTr("0")
            color: "#32CD32"
            font.pixelSize: 80
            font.family: "黑体"
            font.bold: true
            Layout.alignment: Qt.AlignCenter
        }

    }
    Timer {
        id: timer
        interval: 100
        repeat:true
        triggeredOnStart: true
        onTriggered: {
            numText.text = attrs.counter
            attrs.counter++
            if(attrs.counter % 100 == 0)
            {
                numText.color = Qt.rgba(Math.random(),Math.random(),Math.random(),1)
            }
        }
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            timer.start()
        }
    }

}

