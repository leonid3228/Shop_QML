import QtQuick 2.0
Rectangle{

    id:mainShowItem
    width: mainWindow.width/2.5
    color: "white"
    anchors.centerIn: parent
    height:mainWindow.height/2
    visible:false

    Column {
        Row{
            Rectangle{
                height: mainShowItem.height*0.15
                width:mainShowItem.width*0.9
                Text {
                    height: parent.height
                    width:parent.width
                    anchors.leftMargin: mainShowItem.width/50
                    anchors.topMargin:  mainShowItem.width/50
                    anchors.top: parent.top
                    anchors.left:parent.left
                    text: catalogModel.returnShowingModel().name
                    wrapMode: Text.WordWrap
                    font.bold: true
                    font.pointSize: mainShowItem.width/50
                }
            }
            Rectangle{
                height: mainShowItem.height*0.15
                width:mainShowItem.width*0.1
                Image {
                    anchors.topMargin:  mainShowItem.width/50
                    anchors.rightMargin:  mainShowItem.width/50
                    anchors.top: parent.top
                    anchors.right:parent.right
                    height: parent.height/2
                    width:parent.width/2
                    source: "/resources/close"
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            centerItem.visible = false
                            hidingAllItem.visible = false
                            catalogModel.returnShowingModel().itemChanged()
                        }
                    }
                }

            }
        }
        Row{
            Rectangle{
                height: mainShowItem.height*0.85
                width:mainShowItem.width*0.5
                Image {
                    height: parent.height/1.2
                    width:parent.width
                    anchors.margins: mainShowItem.width/50
                    anchors.centerIn:  parent
                    source: "/picture/"+catalogModel.returnShowingModel().picture
                    smooth: true
                }
            }
            Rectangle{
                border.color: "black"
                anchors.margins: 30
                id:rightPartOfOpeningItem
                clip: true
                height: mainShowItem.height*0.85
                width:mainShowItem.width*0.5
                Column{
                    Rectangle{
                        height: rightPartOfOpeningItem.height*0.1
                        width:rightPartOfOpeningItem.width
                        Text {
                            font.pointSize: mainShowItem.width/40
                            text: "Описание:"
                            anchors.left:parent.left
                            font.weight:"Thin"
                            font.bold: true
                        }
                    }
                    Rectangle{
                        height: rightPartOfOpeningItem.height*0.6
                        width:rightPartOfOpeningItem.width
                        Text {
                            anchors.fill: parent
                            //height: parent.height
                            //width:parent.width
                            anchors.leftMargin: mainShowItem.width/50
                            anchors.topMargin:  mainShowItem.width/50
                            anchors.rightMargin:  mainShowItem.width/10

                            font.pointSize: mainShowItem.width/65
                            text: catalogModel.returnShowingModel().description
                            wrapMode: Text.WordWrap
                            font.weight:"Medium"
                        }
                    }
                    Rectangle{
                        height: rightPartOfOpeningItem.height*0.1
                        width:rightPartOfOpeningItem.width
                        Text {
                            font.pointSize: mainShowItem.width/70
                            text: "Вес:"
                            anchors.left:parent.left
                            font.weight:"Medium"
                        }
                        Text {
                            font.pointSize: mainShowItem.width/70
                            text: catalogModel.returnShowingModel().weidht  + " г."
                            anchors.left:parent.left
                            anchors.leftMargin: 50
                            font.weight:"Thin"
                            color: "gray"


                        }
                    }
                    Rectangle{
                        anchors.margins: 30

                        height: rightPartOfOpeningItem.height*0.2
                        width:rightPartOfOpeningItem.width
                        Text {
                            font.pointSize: mainShowItem.width/70
                            text: "Цена:"
                            anchors.left:parent.left
                            font.weight:"Medium"

                        }
                        Text {
                            font.pointSize: mainShowItem.width/70
                            text: catalogModel.returnShowingModel().cost  + " руб."
                            anchors.left:parent.left
                            anchors.leftMargin: 50
                            font.weight:"Thin"
                            color: "gray"

                        }
                    }

                }
            }
        }
    }
}
