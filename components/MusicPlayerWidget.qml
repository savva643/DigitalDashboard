import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15

Item {
    id: musicPlayerWidget
    width: 440
    height: 600

    Rectangle {
        id: background
        anchors.fill: parent
        color: "#1A1D21"
        radius: 16

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 20
            spacing: 20

            // Заголовок "Сейчас играет"
            Text {
                text: "СЕЙЧАС ИГРАЕТ"
                font.pixelSize: 14
                color: "#AAAAAA"
                Layout.alignment: Qt.AlignLeft
                Layout.leftMargin: 10
            }

            // Основной контент (изображение + информация)
            RowLayout {
                Layout.fillWidth: true
                spacing: 20

                // Обложка альбома
                Rectangle {
                    Layout.preferredWidth: 80
                    Layout.preferredHeight: 80
                    radius: 12
                    color: "#252A31"
                    clip: true

                    Image {
                        id: albumCover
                        anchors.fill: parent
                        source: "qrc:/image/music.jpg"
                        fillMode: Image.PreserveAspectCrop
                        onStatusChanged: {
                            if (status === Image.Error) {
                                console.log("Ошибка загрузки изображения");
                                source = "qrc:/image/music.jpg" // Запасное изображение
                            }
                        }
                    }
                }

                // Информация о треке
                ColumnLayout {
                    spacing: 10
                    Layout.alignment: Qt.AlignVCenter

                    Text {
                        text: vehicleData.currentTrack
                        font.pixelSize: 24
                        font.bold: true
                        color: "white"
                        Layout.fillWidth: true
                        elide: Text.ElideRight
                    }

                    Text {
                        text: vehicleData.currentArtist
                        font.pixelSize: 18
                        color: "#00E0FF"
                        Layout.fillWidth: true
                    }
                }
            }

            // Прогрессбар
            ColumnLayout {
                Layout.fillWidth: true
                spacing: 8

                Rectangle {
                    Layout.fillWidth: true
                    height: 6
                    radius: 3
                    color: "#252A31"

                    Rectangle {
                        width: parent.width * 0.4
                        height: parent.height
                        radius: 3
                        color: "#00E0FF"
                    }
                }

                RowLayout {
                    Layout.fillWidth: true

                    Text {
                        text: "1:15"
                        font.pixelSize: 12
                        color: "#AAAAAA"
                    }
                    Item { Layout.fillWidth: true }
                    Text {
                        text: "3:20"
                        font.pixelSize: 12
                        color: "#AAAAAA"
                    }
                }
            }

            // Кнопки управления
            RowLayout {
                Layout.alignment: Qt.AlignHCenter
                spacing: 30

                // Кнопка перемотки назад
                Button {
                    background: Rectangle {
                        color: "transparent"
                        radius: width/2
                    }
                    contentItem: Image {
                        source: "qrc:/image/Rewind.png"
                        width: 64
                        height: 64
                        fillMode: Image.PreserveAspectFit
                        anchors.centerIn: parent
                    }
                    Layout.preferredWidth: 64
                    Layout.preferredHeight: 64
                }

                // Кнопка воспроизведения
                Button {
                    background: Rectangle {
                        color: "transparent"
                        radius: width/2
                    }
                    contentItem: Image {
                        source: vehicleData.isPlaying ? "qrc:/image/Pause.png" : "qrc:/image/Play.png"
                        width: 68
                        height: 68
                        fillMode: Image.PreserveAspectFit
                        anchors.centerIn: parent
                    }
                    Layout.preferredWidth: 68
                    Layout.preferredHeight: 68
                }

                // Кнопка перемотки вперед
                Button {
                    background: Rectangle {
                        color: "transparent"
                        radius: width/2
                    }
                    contentItem: Image {
                        source: "qrc:/image/FastFwd.png"
                        width: 64
                        height: 64
                        fillMode: Image.PreserveAspectFit
                        anchors.centerIn: parent
                    }
                    Layout.preferredWidth: 64
                    Layout.preferredHeight: 64
                }
            }
        }
    }
}
