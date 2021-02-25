import QtQuick 2.0

Item {

    id:btnPage
    anchors.top: parent.top
    anchors.topMargin: 30
    Rectangle {
        anchors.fill: parent
        id:leftRect
        color: "#363636"
        Column {
            anchors.fill: parent
            anchors.topMargin: 10
            spacing: 15
            MyButton {
                id:btn1
                source:"qrc:/images/images/14.png"
                text: "信息"

                onMyclicked: {

                    if(flag == false)
                    {
                        btn1.flag = true
                        btn2.flag = false
                        btn3.flag = false
                        btn4.flag = false
                        btn5.flag = false
                        btn6.flag = false
                        loadPage(text);

                    }                    
                }
            }
            MyButton {
                id:btn2
                source:"qrc:/images/images/9.png"
                text: "布局"
                onMyclicked: {

                    btn1.flag = false
                    btn2.flag = true
                    btn3.flag = false
                    btn4.flag = false
                    btn5.flag = false
                    btn6.flag = false
                    loadPage(text);

                }
            }
            MyButton {
                id:btn3
                source:"qrc:/images/images/11.png"
                text: "自动"
                onMyclicked: {

                    if(flag == false)
                    {
                        btn1.flag = false
                        btn2.flag = false
                        btn3.flag = true
                        btn4.flag = false
                        btn5.flag = false
                        btn6.flag = false
                        loadPage(text);

                    }
                }
            }

            MyButton {
                id:btn4
                source:"qrc:/images/images/10.png"
                text: "算法"
                onMyclicked: {

                    if(flag == false)
                    {
                        btn1.flag = false
                        btn2.flag = false
                        btn3.flag = false
                        btn4.flag = true
                        btn5.flag = false
                        btn6.flag = false
                        loadPage(text);

                    }
                }
            }

            MyButton {
                id:btn5
                source:"qrc:/images/images/12.png"
                text: "列表"
                onMyclicked: {

                    if(flag == false)
                    {
                        btn1.flag = false
                        btn2.flag = false
                        btn3.flag = false
                        btn4.flag = false
                        btn5.flag = true
                        btn6.flag = false
                        loadPage(text);

                    }
                }
            }

            MyButton {
                id:btn6
                source:"qrc:/images/images/13.png"
                text: "变换"
                onMyclicked: {

                    if(flag == false)
                    {
                        btn1.flag = false
                        btn2.flag = false
                        btn3.flag = false
                        btn4.flag = false
                        btn5.flag = false
                        btn6.flag = true
                        loadPage(text);

                    }
                }
            }
        }
    }


}

