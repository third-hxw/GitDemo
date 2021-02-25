import QtQuick 2.0

Item {
    width: 30
    height: parent.width

    property alias imageBton: btn
    property alias source: btn.source
    property alias text: text1.text
    property  bool flag: false
    signal myclicked()

    Column {
        anchors.fill: parent
        spacing: 5
        ColorButton {
            id: btn
            anchors.horizontalCenter: parent.horizontalCenter
            width: 30
            height: 30
            source: "qrc:/images/images/11.png"

            color: flag==1 ? "yellow" : "white"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    myclicked()
                }

            }
        }
        Text {
            id:text1
            width: parent.width
            text: qsTr("text")
            color: flag==1 ? "yellow" : "white"
            font.family: "楷体"
            font.pixelSize: 15
            horizontalAlignment: Text.AlignHCenter//(1)
            verticalAlignment:   Text.AlignVCenter//(2)

        }

    }
}

