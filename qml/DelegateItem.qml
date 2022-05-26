import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.0
Item{
    Rectangle {
        id:delegateRectangle
        // radius: 10
        width: 200
        height: 300
        // clip: true
        Rectangle {
            //Shoiwng picture in delegate
            id:delrec
            anchors.horizontalCenter: parent.horizontalCenter
            radius: 10

            anchors.margins: 10
            anchors.top: parent.top
            width: parent.width * 0.95
            height: parent.height * 0.6

            Image {
                id: root
                source: "/picture/"+model.picture
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        centerItem.visible = true
                        hidingAllItem.visible = true
                        catalogModel.returnShowingModel().getText(index)
                        catalogModel.returnShowingModel().itemChanged()
                    }
                }
                anchors.fill: parent
                layer.enabled: true
                layer.effect: OpacityMask {
                    maskSource: Item {
                        width: root.width
                        height: root.height
                        Rectangle {
                            anchors.centerIn: parent
                            width: root.width
                            height: root.height
                            radius: 10
                        }
                    }
                }
            }
        }

        Text {
            width: parent.width * 0.9
            height: parent.height * 0.1
            id: textName
            anchors.margins: parent.height * 0.01
            text: model.name
            anchors.top: delrec.bottom
            anchors.left: parent.left
            clip: true
            wrapMode: Text.WordWrap
            color: "black"
            // font.weight: Font.ExtraBold
            // font.italic: true с фотнами в файйл общий стиля через {}
        }
        Text {
            width: parent.width * 0.3
            height: parent.height * 0.1
            id: textweidght
            anchors.margins: parent.height * 0.01
            text: model.weidht + " ,грамм"
            anchors.top: textName.bottom
            anchors.left: parent.left
            color: "#C0C0C0"
        }
        ButtonForAdding{}
    }
}
