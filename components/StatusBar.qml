import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: statusBar

    property string position: "top" // "top" или "bottom"
    property int iconSize: 28
    property bool gpsEnabled: true
    property bool bluetoothConnected: true
    property bool wifiConnected: true
    property int batteryLevel: 85
    property int temperature: 22
    property string gear: vehicleData ? vehicleData.gear : "D"

    width: Math.min(parent ? parent.width * 0.9 : 1080, 1200)
    height: 60
    radius: 16

    anchors {
        top: position === "top" ? parent.top : undefined
        bottom: position === "bottom" ? parent.bottom : undefined
        horizontalCenter: parent.horizontalCenter
        margins: 15
    }

    gradient: Gradient {
        GradientStop { position: 0.0; color: "#1E2328" }
        GradientStop { position: 1.0; color: "#0F1419" }
    }

    border.color: "#3A4147"
    border.width: 1.5
    opacity: 0.98

    Rectangle {
        anchors.fill: parent
        radius: 16
        color: "black"
        opacity: 0.4
        anchors.verticalCenterOffset: 4
        anchors.horizontalCenterOffset: 1
        z: -1
    }

    RowLayout {
        anchors.fill: parent
        anchors.margins: 16
        spacing: 25

        //-------------------------------------------------------
        // Левая часть — Connectivity
        //-------------------------------------------------------
        Row {
            spacing: 15
            anchors.verticalCenter: parent.verticalCenter

            // WiFi
            Rectangle {
                width: iconSize + 8
                height: iconSize + 8
                radius: 6
                color: wifiConnected ? "#00C851" : "#FF4444"
                opacity: 1

                Image {
                    anchors.centerIn: parent
                    source: wifiConnected ? "qrc:/image/wifion.png" : "qrc:/image/wifioff.png"
                    width: iconSize
                    height: iconSize
                    fillMode: Image.PreserveAspectFit
                }
            }

            // Bluetooth
            Rectangle {
                width: iconSize + 8
                height: iconSize + 8
                radius: 6
                color: bluetoothConnected ? "#007BFF" : "#6C757D"
                opacity: 1

                Image {
                    anchors.centerIn: parent
                    source: bluetoothConnected ? "qrc:/image/bluetooth.png" : "qrc:/image/bluetoothoff.png"
                    width: iconSize
                    height: iconSize
                    fillMode: Image.PreserveAspectFit
                }
            }

            // GPS
            Rectangle {
                width: iconSize + 8
                height: iconSize + 8
                radius: 6
                color: gpsEnabled ? "#28A745" : "#6C757D"
                opacity: 1

                Image {
                    anchors.centerIn: parent
                    source: gpsEnabled ? "qrc:/image/gpson.png" : "qrc:/image/gpsoff.png"
                    width: iconSize
                    height: iconSize
                    fillMode: Image.PreserveAspectFit
                }
            }
        }

        //-------------------------------------------------------
        // Центр
        //-------------------------------------------------------
        Item { Layout.fillWidth: true }
        // Левый поворотник



        Row {
            id: dashboardContent
            spacing: 20
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter

            TurnSignal {
                anchors {
                    verticalCenter: dashboardContent.verticalCenter
                }
                direction: "qrc:/image/arrow_left.png"
                active: leftSignalActive
            }

            // Температура
            Row {
                id: ds
                spacing: 6
                anchors.verticalCenter: parent.verticalCenter

                Image {
                    source: "qrc:/image/temperature.png"
                    width: iconSize - 6
                    height: iconSize - 6
                    fillMode: Image.PreserveAspectFit
                }

                Text {
                    text: temperature + "°C"
                    color: "#E0E6ED"
                    font.pixelSize: 16
                    font.weight: Font.Medium
                }
            }

            // Передача
            Rectangle {
                width: 40
                height: 32
                radius: 8
                color: "#FF6B35"
                opacity: 0.9
                anchors.verticalCenter: parent.verticalCenter

                Text {
                    anchors.centerIn: parent
                    text: gear
                    color: "white"
                    font.pixelSize: 18
                    font.weight: Font.Bold
                }
            }

            // Батарея
            Row {
                spacing: 6
                anchors.verticalCenter: parent.verticalCenter

                Rectangle {
                    width: 32
                    height: 16
                    radius: 3
                    border.color: "#E0E6ED"
                    border.width: 1.5
                    color: "transparent"

                    Rectangle {
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.margins: 2
                        width: (parent.width - 4) * (batteryLevel / 100)
                        height: parent.height - 4
                        radius: 2
                        color: batteryLevel > 20 ? "#28A745" : "#FF4444"
                    }

                    // Контакт батареи
                    Rectangle {
                        anchors.left: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        width: 3
                        height: 8
                        radius: 1
                        color: "#E0E6ED"
                    }
                }

                Text {
                    id: battar
                    text: batteryLevel + "%"
                    color: "#E0E6ED"
                    font.pixelSize: 14
                    font.weight: Font.Medium
                }
            }

            // Правый поворотник
            TurnSignal {
                anchors {
                    verticalCenter: dashboardContent.verticalCenter
                }
                direction: "qrc:/image/arrow_right.png"
                active: rightSignalActive
            }
        }

        Item { Layout.fillWidth: true }

        //-------------------------------------------------------
        // Правая часть — Время и дата
        //-------------------------------------------------------
        Column {
            spacing: 2
            anchors.verticalCenter: parent.verticalCenter

            Text {
                id: clock
                text: Qt.formatDateTime(new Date(), "hh:mm")
                color: "#FFFFFF"
                font.pixelSize: 24
                font.weight: Font.Bold
                horizontalAlignment: Text.AlignRight
            }

            Text {
                id: dateText
                text: Qt.formatDateTime(new Date(), "ddd dd MMM")
                color: "#B0BEC5"
                font.pixelSize: 12
                font.weight: Font.Medium
                horizontalAlignment: Text.AlignRight
            }
        }
    }

    //-------------------------------------------------------
    // Таймер на обновление времени
    //-------------------------------------------------------
    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            var currentTime = new Date()
            clock.text = Qt.formatDateTime(currentTime, "hh:mm")
            dateText.text = Qt.formatDateTime(currentTime, "ddd dd MMM")
        }
    }

    //-------------------------------------------------------
    // Анимация появления
    //-------------------------------------------------------
    NumberAnimation on opacity {
        from: 0
        to: 0.98
        duration: 500
        easing.type: Easing.OutCubic
    }
}
