import QtQuick 2.0

ListView {

    orientation: ListView.Horizontal
    width: mainWindow.width
    height: mainWindow.height * 0.05
    delegate: Rectangle {
        border.color: "black"

        width: mainWindow.width/15
        height: mainWindow.height * 0.05
        MouseArea {

            anchors.fill: parent
            onClicked: {
                catalogModel.dataForUpdateModel(model.category)
            }
        }
        Text {
            anchors.centerIn: parent
            text: model.category
        }
    }
}
