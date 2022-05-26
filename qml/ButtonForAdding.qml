import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.0

Rectangle {
    id:buttonDeleagte
    //button for adding item to basket
    radius: 10
    color: "#E0E0E0"
    anchors.margins: parent.height * 0.01
    width: parent.width * 0.7
    height: parent.height * 0.1
    anchors.left: parent.left
    anchors.top: textweidght.bottom
    Text {
        anchors.margins: parent.height * 0.01
        anchors.leftMargin: parent.height * 0.5
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        id: pricetxt
        text: model.cost + "руб."
        color: "#EB5252"
    }
    Image {

        source: "/resources/add"
        anchors.right: parent.right
        anchors.margins: parent.height * 0.01
        anchors.rightMargin: parent.height * 0.3
        anchors.verticalCenter: parent.verticalCenter
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            catalogModel.returnShowingModel().addToCheckout(model.index)

        }
        onPressed: {
            buttonDeleagte.color = "#ABA3A3"
        }
        onReleased: {
            buttonDeleagte.color = "#E0E0E0"
        }
    }
}
