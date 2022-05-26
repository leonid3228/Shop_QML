import QtQuick 2.15
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.15

Rectangle {
    property alias txt: textInput.text
    id:seracher
    //ПОИСК
    color: "#FBCEB1"
    width: mainWindow.width * 0.85
    height: mainWindow.height * 0.05
    Rectangle{
        id:mainrec
        anchors.margins: 20
        width: mainWindow.width * 0.85-20
        height: mainWindow.height * 0.05-15
        anchors.centerIn: parent
        color: "white"
        radius: 40
        TextInput {
            id:textInput
            onEditingFinished: {
                catalogModel.dataForUpdateModelWithSearcher(textInput.text)
                textInput.clear()
                textInput.text = "Введите название товара или его категорию"
            }
            wrapMode: Text.WordWrap
            //validator: IntValidator{bottom: 11; top: 31;}
            focus: true
            font.pointSize : (mainWindow.width+mainWindow.height)/240

            anchors.leftMargin: 14
            text : "Введите название товара или его категорию"
            bottomPadding : 10
            leftPadding : 12
            topPadding : 10
            rightPadding : 12
            width: parent.width
            height: parent.height
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    textInput.clear()
                }
            }
        }
    }
}
