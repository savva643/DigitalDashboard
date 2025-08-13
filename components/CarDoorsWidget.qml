import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: doorsWidget

    // Состояния дверей
    readonly property bool flOpen: vehicleData && vehicleData.doorsOpen[0]
    readonly property bool frOpen: vehicleData && vehicleData.doorsOpen[1]
    readonly property bool rlOpen: vehicleData && vehicleData.doorsOpen[2]
    readonly property bool rrOpen: vehicleData && vehicleData.doorsOpen[3]
    readonly property bool hoodOpen: vehicleData && vehicleData.hoodOpen
    readonly property bool trunkOpen: vehicleData && vehicleData.trunkOpen

    Rectangle {
        anchors.fill: parent
        color: "#1A1D21"
        radius: 12

        Column {
            anchors.fill: parent
            anchors.margins: 15
            spacing: 10

            // Заголовок с индикаторами капота/багажника
            Row {
                width: parent.width
                spacing: 10

                Text {
                    text: "DOORS STATUS"
                    color: "#00E0FF"
                    font { pixelSize: 16; bold: true }
                    anchors.verticalCenter: parent.verticalCenter
                }

                // Индикатор капота
                Rectangle {
                    visible: hoodOpen
                    width: 24; height: 24
                    radius: 12
                    color: "#FF5555"
                    border.color: Qt.darker(color, 1.2)
                    anchors.verticalCenter: parent.verticalCenter

                    Text {
                        text: "!"
                        color: "white"
                        font { pixelSize: 16; bold: true }
                        anchors.centerIn: parent
                    }

                    Rectangle {
                        anchors.fill: parent
                        anchors.margins: -3
                        radius: width/2
                        color: "transparent"
                        border.color: "#FF5555"
                        border.width: 2
                        opacity: 0.6
                    }
                }

                // Индикатор багажника
                Rectangle {
                    visible: trunkOpen
                    width: 24; height: 24
                    radius: 12
                    color: "#FF5555"
                    border.color: Qt.darker(color, 1.2)
                    anchors.verticalCenter: parent.verticalCenter

                    Text {
                        text: "!"
                        color: "white"
                        font { pixelSize: 16; bold: true }
                        anchors.centerIn: parent
                    }

                    Rectangle {
                        anchors.fill: parent
                        anchors.margins: -3
                        radius: width/2
                        color: "transparent"
                        border.color: "#FF5555"
                        border.width: 2
                        opacity: 0.6
                    }
                }
            }

            // Основное изображение с дверьми
            Item {
                width: parent.width
                height: width * 0.5

                // Базовая иконка автомобиля (все двери закрыты)
                Image {
                    id: baseCar
                    source: "qrc:/image/car_base.png"
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                    visible: !flOpen && !frOpen && !rlOpen && !rrOpen
                }

                // Иконки для разных комбинаций открытых дверей
                Image {
                    source: "qrc:/image/car_doors_fl.png"
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                    visible: flOpen
                }
                Image {
                    source: "qrc:/image/car_doors_fr.png"
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                    visible: frOpen
                }
                Image {
                    source: "qrc:/image/car_doors_rl.png"
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                    visible: rlOpen
                }
                Image {
                    source: "qrc:/image/car_doors_rr.png"
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                    visible: rrOpen
                }

                // Индикаторы капота и багажника на изображении
                Rectangle {
                    visible: hoodOpen
                    x: parent.width * 0.5 - width/2
                    y: parent.height * 0.1
                    width: 20; height: 20
                    radius: 10
                    color: "#FF5555"

                    Text {
                        text: "!"
                        color: "white"
                        font { pixelSize: 14; bold: true }
                        anchors.centerIn: parent
                    }

                    SequentialAnimation on scale {
                        running: true
                        loops: Animation.Infinite
                        NumberAnimation { to: 1.2; duration: 500 }
                        NumberAnimation { to: 1.0; duration: 500 }
                    }
                }

                Rectangle {
                    visible: trunkOpen
                    x: parent.width * 0.5 - width/2
                    y: parent.height * 0.9 - height
                    width: 20; height: 20
                    radius: 10
                    color: "#FF5555"

                    Text {
                        text: "!"
                        color: "white"
                        font { pixelSize: 14; bold: true }
                        anchors.centerIn: parent
                    }

                    SequentialAnimation on scale {
                        running: true
                        loops: Animation.Infinite
                        NumberAnimation { to: 1.2; duration: 500 }
                        NumberAnimation { to: 1.0; duration: 500 }
                    }
                }
            }

            // Текстовый статус
            Grid {
                columns: 2
                spacing: 5
                width: parent.width

                Text { text: "Front Left:"; color: "white" }
                Text {
                    text: flOpen ? "OPEN" : "CLOSED";
                    color: flOpen ? "#FF5555" : "#00E0FF";
                    font.bold: true
                }

                Text { text: "Front Right:"; color: "white" }
                Text {
                    text: frOpen ? "OPEN" : "CLOSED";
                    color: frOpen ? "#FF5555" : "#00E0FF";
                    font.bold: true
                }

                Text { text: "Rear Left:"; color: "white" }
                Text {
                    text: rlOpen ? "OPEN" : "CLOSED";
                    color: rlOpen ? "#FF5555" : "#00E0FF";
                    font.bold: true
                }

                Text { text: "Rear Right:"; color: "white" }
                Text {
                    text: rrOpen ? "OPEN" : "CLOSED";
                    color: rrOpen ? "#FF5555" : "#00E0FF";
                    font.bold: true
                }

                Text { text: "Hood:"; color: "white" }
                Text {
                    text: hoodOpen ? "OPEN" : "CLOSED";
                    color: hoodOpen ? "#FF5555" : "#00E0FF";
                    font.bold: true
                }

                Text { text: "Trunk:"; color: "white" }
                Text {
                    text: trunkOpen ? "OPEN" : "CLOSED";
                    color: trunkOpen ? "#FF5555" : "#00E0FF";
                    font.bold: true
                }
            }
        }
    }
}
