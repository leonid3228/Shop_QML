import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Rectangle {
    //Сортировка
    color: "black"
    width: mainWindow.width * 0.1
    height: mainWindow.height * 0.05
    ComboBox {
        width: mainWindow.width * 0.1
        height: mainWindow.height * 0.05
        id: control
        model: ["Цена", "Сначала дороже"]

        delegate: ItemDelegate {

            width: control.width
            contentItem: Text {
                text: modelData
                color: "black"
                font: control.font
                anchors.centerIn: parent
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                         catalogModel.dataForUpdateAllItem()
                        control.currentIndex = index
                        control.popup.close()
                        catalogModel.returnShowingModel().sorting(index)
                    }
                }
            }
            highlighted: control.highlightedIndex === index
        }
        contentItem: Text {
            leftPadding: 0
            rightPadding: control.indicator.width + control.spacing
            text: control.displayText
            font: control.font
            color: control.pressed ? "black" : "black"
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
        background: Rectangle {
            border.color: control.pressed ? "black" : "black"
            border.width: control.visualFocus ? 2 : 1
            radius: 2
        }
    }
}
