import QtQuick 2.0
import QtQuick.Layouts 1.2

Item {
    id:trafficLightPage
    width: 840
    height: 650
    Rectangle {
        anchors.fill: parent
        color: "#4F4F4F"
        Timer {
            id:stateChange
            interval: 1000
            running: true
            repeat: true
            onTriggered: {

                layout.acounter++
                if(layout.acounter > 10)
                    layout.acounter = 0
                switch(layout.acounter % 10)
                {
                case 0:
                    layout.state = "stop";
                    break;
                case 4:
                    layout.state = "wait";
                    break;
                case 6:
                    layout.state = "go";
                    break;
                case 8:
                    layout.state = "wait"
                    break;
                }
            }
        }
        MouseArea
        {
            id:startclick
            anchors.fill: parent
            onClicked: {

                stateChange.start()
                console.log("-----start------")
            }
        }

        RowLayout {
            id:layout
            anchors.centerIn: parent
            spacing: 30
            property int acounter: 0
            Rectangle {
                id:redLight
                width: 100
                height: 100
                radius: 50
                color: "red"
            }
            Rectangle{
                id:yellowLight
                width: 100
                height: 100
                radius: 50
                color: "#2E1616"
            }
            Rectangle{
                id:greenLight
                width: 100
                height: 100
                radius: 50
                color: "#2E1616"
            }

            states: [
                State {
                    name: "stop"
                    PropertyChanges {
                        target: redLight
                        color:"red"

                    }
                    PropertyChanges {
                        target: yellowLight
                        color:"#2E1616"
                    }
                    PropertyChanges {
                        target: greenLight
                        color:"#2E1616"
                    }
                },
                State {
                    name: "wait"
                    PropertyChanges {
                        target: yellowLight
                        color:"yellow"
                    }
                    PropertyChanges {
                        target: greenLight
                        color:"#2E1616"
                    }
                    PropertyChanges {
                        target: redLight
                        color:"#2E1616"
                    }
                },
                State {
                    name: "go"
                    PropertyChanges {
                        target: greenLight
                        color:"green"
                    }
                    PropertyChanges {
                        target: redLight
                        color:"#2E1616"
                    }
                    PropertyChanges {
                        target: yellowLight
                        color:"#2E1616"
                    }

                }
            ]
            transitions: [

                Transition {
                    reversible: true
                    from: "stop"
                    to: "wait"

                    ColorAnimation{//属性动画的处理
                        target: redLight
                        properties: "color"
                        duration: 1000

                    }
                    ColorAnimation {
                        target: yellowLight
                        properties: "color"
                        duration: 1000
                    }

                },
                Transition {
                    reversible: true
                    from: "go"
                    to: "wait"

                    ColorAnimation{//属性动画的处理
                        target: greenLight
                        properties: "color"
                        duration: 1000

                    }
                    ColorAnimation {
                        target: yellowLight
                        properties: "color"
                        duration: 1000
                    }

                },
                Transition {
                    reversible: true
                    from: "wait"
                    to: "go"

                    ColorAnimation{//属性动画的处理
                        target: yellowLight
                        properties: "color"
                        duration: 1000

                    }
                    ColorAnimation {
                        target: greenLight
                        properties: "color"
                        duration: 1000
                    }

                }


            ]
        }
    }



}

