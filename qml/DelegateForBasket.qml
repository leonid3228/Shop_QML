import QtQuick 2.0
import QtQuick.Controls 2.12

Row {
    id:currentItem
    state: "nodelete"
    opacity: 1
    width: basketview.width
    height: basketview.height / 2 + 1
    Column {
        width: parent.width * 0.45
        height: parent.height
        Rectangle {
            width: parent.width - 1
            height: parent.height - 1
            Image {
                width: parent.width
                height: parent.height * 0.7
                source: "/picture/"+model.picture
                anchors.centerIn: parent
            }
        }
        Rectangle {
            //Это для прчоерка под итемом
            width: parent.width * 0.7
            height: 1
            color: "#dce3e5"
            radius: 3
            anchors.right: parent.right
        }
    }
    Rectangle {
        //правая часть корзины
        width: parent.width * 0.55
        height: parent.height

        Column {
            width: parent.width
            height: parent.height
            Rectangle {
                //Строка с ценой и делетером
                width: parent.width
                height: parent.height * 0.3
                Row {
                    width: parent.width
                    height: parent.height
                    Rectangle {
                        Text {
                            anchors.left: parent.left
                            anchors.verticalCenter: parent.verticalCenter
                            text: model.cost + " руб."
                        }
                        anchors.margins: 15

                        width: parent.width * 0.7
                        height: parent.height
                    }
                    Rectangle {
                        id:deleterImage
                        width: parent.width * 0.3
                        height: parent.height
                        Image {
                            width: parent.width * 0.3
                            height: parent.height * 0.3
                            anchors.centerIn: parent
                            source: "/resources/delete"

                            Timer {
                                id: timer
                                interval: 1400
                                running: false
                                repeat: false
                                onTriggered: model.number = -model.number
                            }
                            MouseArea {
                                anchors.fill: parent

                                onClicked:{
                                    currentItem.state = "delete"

                                    timer.running = true



                                }
                                onPressed: {
                                    deleterImage.color = "#ABA3A3"
                                }
                                onReleased: {
                                    deleterImage.color = "white"
                                }
                            }
                        }


                    }
                }
            }
            Rectangle {
                //Строка с именем
                width: parent.width
                height: parent.height * 0.35
                Text {
                    anchors.fill: parent
                    text: model.name
                    clip: true
                    wrapMode: Text.WordWrap
                }
            }
            Rectangle {
                //Строка с кол-вом + количество -
                width: parent.width
                height: parent.height * 0.35 - 1

                Row {
                    width: parent.width
                    height: parent.height

                    Rectangle {
                        //простойотступ
                        width: parent.width * 0.3
                        height: parent.height
                    }
                    Rectangle {
                        radius: 50
                        id:minusimage
                        //минус
                        width: parent.width * 0.25
                        height: parent.height

                        Image {


                            width: parent.width * 0.75
                            height: parent.height * 0.45
                            anchors.centerIn: parent
                            source: "/resources/minus"
                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    model.number=-1
                                }
                                onPressed: {
                                    minusimage.color = "#ABA3A3"
                                }
                                onReleased: {
                                    minusimage.color = "white"
                                }
                            }
                        }
                    }
                    Rectangle {
                        //сюда количество с модели
                        width: parent.width * 0.2
                        height: parent.height

                        Text {
                            anchors.centerIn: parent
                            text: model.number
                        }
                    }
                    Rectangle {
                        id:plusimage
                        //плюс
                        radius: 50
                        width: parent.width * 0.25
                        height: parent.height
                        Image {
                            width: parent.width * 0.75
                            height: parent.height * 0.45
                            anchors.centerIn: parent
                            source: "/resources/plus"
                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    model.number=1

                                }
                                onPressed: {
                                    plusimage.color = "#ABA3A3"
                                }
                                onReleased: {
                                    plusimage.color = "white"
                                }
                            }

                        }
                    }
                }
            }
            Rectangle {
                //Это для прчоерка под итемом
                width: parent.width * 0.7
                height: 1
                color: "#dce3e5"
                radius: 3
                anchors.left: parent.left
            }
        }
    }
    states: [
        State {
            id: stateshow
            name: "delete"

            PropertyChanges {
                target: currentItem
                opacity:0
            }
        },
        State {
            id: stateshow2
            name: "nodelete"
            PropertyChanges {
                target: currentItem
                opacity:1
            }
        }

    ]
    transitions: [

        Transition {
            from:"nodelete"
            to: "delete"
            PropertyAnimation {
                target: currentItem
                properties: "opacity"
                duration: 1300
            }
        }
    ]
}
