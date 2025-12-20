import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15

Item {
    id: musicPlayerWidget
    width: 440
    height: 600

    // Функция форматирования времени
    function formatTime(seconds) {
        if (seconds < 0) seconds = 0
        var mins = Math.floor(seconds / 60)
        var secs = seconds % 60
        return mins + ":" + (secs < 10 ? "0" + secs : secs)
    }

    // Вычисляем прогресс (0.0 - 1.0)
    property real progress: {
        if (!vehicleData || vehicleData.trackTotalTime <= 0) return 0.0
        return Math.min(vehicleData.trackCurrentTime / vehicleData.trackTotalTime, 1.0)
    }

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

                // Обложка альбома (закругленная)
                Item {
                    Layout.preferredWidth: 120
                    Layout.preferredHeight: 120

                    Rectangle {
                        id: albumBorder
                        anchors.fill: parent
                        radius: 12
                        color: "transparent"
                        border.color: "#00E0FF"
                        border.width: 2
                    }

                    Rectangle {
                        id: albumMask
                        anchors.fill: parent
                        anchors.margins: 2
                        radius: 10
                        color: "#252A31"
                        clip: true

                        Image {
                            id: albumCover
                            anchors.fill: parent
                            source: vehicleData && vehicleData.albumArt ? vehicleData.albumArt : "qrc:/image/music.jpg"
                            fillMode: Image.PreserveAspectCrop
                            asynchronous: true
                            
                            onStatusChanged: {
                                if (status === Image.Error || status === Image.Null) {
                                    source = "qrc:/image/music.jpg" // Запасное изображение
                                }
                            }
                        }

                        // Плейсхолдер при загрузке
                        Rectangle {
                            anchors.fill: parent
                            color: "#252A31"
                            visible: albumCover.status === Image.Loading
                            
                            Text {
                                anchors.centerIn: parent
                                text: "♪"
                                font.pixelSize: 40
                                color: "#00E0FF"
                                opacity: 0.5
                            }
                        }
                    }
                }

                // Информация о треке и индикатор статуса
                ColumnLayout {
                    spacing: 8
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignVCenter

                    // Индикатор статуса воспроизведения (вынесен наружу)
                    Row {
                        spacing: 8
                        Layout.alignment: Qt.AlignLeft

                        Rectangle {
                            width: 24
                            height: 24
                            radius: 12
                            color: vehicleData && vehicleData.isPlaying ? "#4CAF50" : "#FF9800"
                            border.color: "white"
                            border.width: 1.5

                            Image {
                                anchors.centerIn: parent
                                width: 14
                                height: 14
                                source: vehicleData && vehicleData.isPlaying ? "qrc:/image/Pause.png" : "qrc:/image/Play.png"
                                fillMode: Image.PreserveAspectFit
                            }

                            SequentialAnimation on opacity {
                                running: vehicleData && vehicleData.isPlaying
                                loops: Animation.Infinite
                                NumberAnimation { to: 0.6; duration: 1000 }
                                NumberAnimation { to: 1.0; duration: 1000 }
                            }
                        }

                        Text {
                            anchors.verticalCenter: parent.verticalCenter
                            text: vehicleData && vehicleData.isPlaying ? "Воспроизведение" : "Пауза"
                            font.pixelSize: 12
                            color: vehicleData && vehicleData.isPlaying ? "#4CAF50" : "#FF9800"
                        }
                    }

                    Text {
                        text: vehicleData && vehicleData.currentTrack ? vehicleData.currentTrack : "No Track"
                        font.pixelSize: 22
                        font.bold: true
                        color: "white"
                        Layout.fillWidth: true
                        elide: Text.ElideRight
                        maximumLineCount: 2
                        wrapMode: Text.WordWrap
                    }

                    Text {
                        text: vehicleData && vehicleData.currentArtist ? vehicleData.currentArtist : "Unknown Artist"
                        font.pixelSize: 16
                        color: "#00E0FF"
                        Layout.fillWidth: true
                        elide: Text.ElideRight
                    }

                    Text {
                        text: vehicleData && vehicleData.currentAlbum ? vehicleData.currentAlbum : ""
                        font.pixelSize: 14
                        color: "#AAAAAA"
                        Layout.fillWidth: true
                        elide: Text.ElideRight
                        visible: vehicleData && vehicleData.currentAlbum && vehicleData.currentAlbum.length > 0
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
                        width: parent.width * progress
                        height: parent.height
                        radius: 3
                        color: "#00E0FF"
                        
                        Behavior on width {
                            NumberAnimation { duration: 200 }
                        }
                    }
                }

                RowLayout {
                    Layout.fillWidth: true

                    Text {
                        text: formatTime(vehicleData ? vehicleData.trackCurrentTime : 0)
                        font.pixelSize: 12
                        color: "#AAAAAA"
                    }
                    Item { Layout.fillWidth: true }
                    Text {
                        text: formatTime(vehicleData ? vehicleData.trackTotalTime : 0)
                        font.pixelSize: 12
                        color: "#AAAAAA"
                    }
                }
            }
        }
    }
}
