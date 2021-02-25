import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.2
import QtQuick.Dialogs 1.2


Window {
    visible: true
    id:root
    width: 880
    height: 680
    minimumHeight:480
    minimumWidth: 371
    flags: Qt.Window | Qt.FramelessWindowHint
    StartPage {}
    ColumnLayout {
        anchors.fill: parent
        MoveWindow {
            id:movePage
        }

        Row {
            anchors.fill: parent
            ButtonPage {
                id:btnPage
                width: parent.width * 0.045
                height: parent.height
                z: mainPage2.z + 1
            }

            Rectangle {
                id: mainPage2
                width: parent.width - btnPage.width
                height:btnPage.height
                anchors.top: btnPage.top

                StackView {
                    id: stack
                    anchors.fill: parent
                    initialItem: mainPage

                    Component{
                        id : mainPage
                        InfoPage{}

                    }

                    Component {
                        id:layPage
                        LayoutPage {}
                    }

                    Component {
                        id:timerPage
                        TimerPage {}
                    }

                    Component {
                        id:arithPage
                        ArithmeticPage {}
                    }

                    Component {
                        id:tableViewPage

                        TableViewPage{

                        }
                    }

                    Component {
                        id:trafficLightPage

                        TrafficLightPage {}
                    }


                }
            }

        }
    }

    function loadPage(page) {
        switch(page) {
        case '信息':
            stack.push(mainPage);
            break;
        case '布局':
            stack.push(layPage);
            break;
        case '自动':
            stack.push(timerPage);
            break;
        case '算法':
            stack.push(arithPage);
            break;
        case '列表':
            stack.push(tableViewPage);

            break;
        case '变换':
            stack.push(trafficLightPage);
            break;
        }
    }

}













