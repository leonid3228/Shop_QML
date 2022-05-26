import QtQuick 2.15
import QtQuick.Window 2.15
import Model 1.0
//import Basket 1.0
import Selector 1.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0

Window {

    SelectorModel {
        id: catalogModel
    }
    id: mainWindow

    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight
    visible: true

    Column {

        Row {
            Rectangle {
                //ЛОГО
                color: "#FBCEB1"
                width: mainWindow.width * 0.1
                height: mainWindow.height * 0.05

                Image {
                    width: parent.width * 0.5
                    height: parent.height * 0.5
                    anchors.centerIn: parent
                    source: "/resources/logo"}
            }
            Searcher{id:seracher}
            Rectangle {
                //КОРИЗНА
                id:basketPicture
                color: "#FBCEB1"
                width: mainWindow.width * 0.05
                height: mainWindow.height * 0.05
                Image {
                    width: parent.width /3
                    height: parent.height /2

                    anchors.centerIn: parent
                    source: "/resources/basket"
                    MouseArea{
                        anchors.fill: parent

                        onClicked: {

                            basketview.state == "show" ? basketview.state = "notshow" : basketview.state = "show"
                        }
                        onDoubleClicked: {
                            basketview.state = "notshow"
                        }
                    }
                }
            }
        }
        Row {
            ComboBoxVariant{}
            Rectangle {

                border.color: "black"
                width: mainWindow.width * 0.1
                height: mainWindow.height * 0.05
                anchors.margins: 12
                Text {
                    text: "ВСе Товары"
                    anchors.centerIn: parent
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        seracher.txt = "Введите название товара или его категорию"
                        catalogModel.dataForUpdateAllItem()

                    }
                }
            }

            Catalog {
                clip: true
                model: catalogModel
            }
        }

        Rectangle {
            id:rectry
            width: mainWindow.width
            height: mainWindow.height/1.1
            GridView {
                anchors.margins: 30
                id: gridview
                anchors.fill: parent
                model: catalogModel.returnShowingModel()
                cellWidth: 250
                cellHeight: 365
                clip: true

                delegate: DelegateItem {id:mainrecdelegate}
            }
        }

    }

    Basket {
        id:basketview
        state: "show"
        states: [
            State {
                id: stateshow
                name: "show"
                PropertyChanges {
                    target: basketview
                    opacity:0
                }
            },
            State {

                name: "notshow"
                PropertyChanges {
                    target: basketview
                    opacity:1
                }
            }
        ]
        transitions: [
            Transition {
                from: "notshow"
                to: "show"
                PropertyAnimation {
                    target: basketview
                    properties: "opacity"
                    duration: 700
                }
            },
            Transition {
                from: "show"
                to: "notshow"
                PropertyAnimation {
                    target: basketview
                    properties: "opacity"
                    duration: 1100
                }
            }
        ]

    }
    Rectangle{
        id:hidingAllItem
        anchors.fill: parent
        visible: false
        color: "black"
        opacity: 0.7
        border.color: Qt.rgba(0, 0, 0, 0.01)
        border.width: 1
        layer.enabled: true
        layer.effect: InnerShadow {
            color: "black"
            samples: 32
            radius: 250
            spread: 0.1
            source: hidingAllItem
            cached:true
        }
        BrightnessContrast {
            id:bright
            anchors.fill: hidingAllItem
            source: hidingAllItem
            brightness:0.4
        }
        MouseArea{
            anchors.fill: parent
            propagateComposedEvents :false
        }
    }
    ShowOneItem{id:centerItem}
}
