import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

import MyCppObj 1.0

Window {
    id: root
    visible: true
    width: 600
    height: 400

    signal qmlSendSignal()

    CppObj {
        id: cppObj
    }

    Connections {
        target: cppObj
        onCppSignal:{
            console.log("---recv--",msg)
            txt.text = cppObj.name;
        }
    }

    Connections {
        target: root
        onQmlSendSignal:{
            console.log("--root send---",msg)
        }
    }

    MouseArea{
        id:mouse
        anchors.fill: parent
        onClicked: {
            cppObj.name = txt.text
        }
    }



    TextEdit {
        id: txt
        width: 100
        height: 50
        text: cppObj.name
    }



}

