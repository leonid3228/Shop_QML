import QtQuick 2.0

Column {

    id:basketview
    anchors.rightMargin: 12
    anchors.right: parent.right
    y:basketPicture.y+basketPicture.height
    width: mainWindow.width*0.15
    height: mainWindow.height * 0.35
    Rectangle {

        width: basketview.width
        height: basketview.height * 0.1
        color: "#dce3e5"
        Text {
            font {
                pointSize: 12
            }
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            text: "КОРЗИНА"
            anchors.margins: 15
        }
    }
    Rectangle{
        width: basketview.width
        height: basketview.height
        color: "white"
        ListView {
            //для текста добавь итем
            clip: true
            model: 2
            width: basketview.width
            height: basketview.height
            delegate: Rectangle{
                width: basketview.width
                height: basketview.height/2
                color: "white"
                Text {
                    anchors.centerIn: parent
                    text: "Пусто"
                }
            }
        }
        ListView {
            clip: true
            model: catalogModel.returnShowingModel().returnBasketModel()
            width: basketview.width
            height: basketview.height
            delegate: DelegateForBasket {}
        }
    }
    Rectangle {
        id:rect

        width: basketview.width
        height: basketview.height * 0.1
        color: "#dce3e5"
        Text {
            id:txt

            anchors.margins: 15
            anchors.right: parent.right

            anchors.verticalCenter: parent.verticalCenter
            text: catalogModel.returnShowingModel().returnBasketModel().total + " руб."
        }
        Text {
            anchors.margins: 15
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            text: "Итог"
        }

    }
    Rectangle {

        width: basketview.width
        height: basketview.height * 0.1

        Rectangle {
            anchors.centerIn: parent
            width: parent.width
            height: parent.height
            color: "green"

            Text {
                anchors.centerIn: parent
                text: "ОФОРМИТЬ ЗАКАЗ"
                color: "white"
            }
        }
    }
}
