import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    id: gearWidget

    // Подключение данных

    Rectangle {
        anchors.fill: parent
        color: "#1A1D21"
        radius: 12

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 20
            spacing: 15

            // Gear Indicator
            Item {
                Layout.fillWidth: true
                Layout.preferredHeight: parent.height * 0.6

                Rectangle {
                    id: gearIndicator
                    width: Math.min(parent.width, parent.height) * 0.7
                    height: width
                    radius: width / 2
                    anchors.centerIn: parent

                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "#252A31" }
                        GradientStop { position: 1.0; color: "#1E2328" }
                    }

                    border {
                        width: 3
                        color: "#00E0FF"
                    }

                    Text {
                        anchors.centerIn: parent
                        text: vehicleData ? vehicleData.gear : "D"
                        font {
                            pixelSize: parent.width * 0.5
                            family: "Roboto"
                            weight: Font.Bold
                        }
                        color: "#00E0FF"
                    }

                    Rectangle {
                        anchors.fill: parent
                        anchors.margins: -5
                        radius: width / 2
                        color: "transparent"
                        border.color: "#00E0FF"
                        border.width: 1
                        opacity: 0.3
                    }
                }
            }

            // Bottom indicators
            ColumnLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true
                spacing: 15

                // Fuel Indicator
                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 5

                    RowLayout {
                        Layout.fillWidth: true

                        Text {
                            text: "FUEL"
                            font.pixelSize: 14
                            font.family: "Roboto"
                            font.weight: Font.Medium
                            color: "white"
                        }

                        Text {
                            Layout.alignment: Qt.AlignRight
                            text: (vehicleData ? Math.round(vehicleData.fuelLevel) : 75) + "%"
                            font.pixelSize: 14
                            font.family: "Roboto"
                            font.weight: Font.Bold
                            color: "#00E0FF"
                        }
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        height: 6
                        radius: 3
                        color: "#252A31"

                        Rectangle {
                            width: parent.width * (vehicleData ? vehicleData.fuelLevel / 100 : 0.75)
                            height: parent.height
                            radius: parent.radius
                            color: "#00E0FF"
                        }
                    }
                }

                // Temperature Indicator
                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 5

                    RowLayout {
                        Layout.fillWidth: true

                        Text {
                            text: "TEMP"
                            font.pixelSize: 14
                            font.family: "Roboto"
                            font.weight: Font.Medium
                            color: "white"
                        }

                        Text {
                            Layout.alignment: Qt.AlignRight
                            text: (vehicleData ? Math.round(vehicleData.temperature) : 90) + "°C"
                            font.pixelSize: 14
                            font.family: "Roboto"
                            font.weight: Font.Bold
                            color: "#00E0FF"
                        }
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        height: 6
                        radius: 3
                        color: "#252A31"

                        Rectangle {
                            width: parent.width * (vehicleData ? vehicleData.temperature / 120 : 0.65)
                            height: parent.height
                            radius: parent.radius
                            color: "#00E0FF"
                        }
                    }
                }

                // Range Indicator
                RowLayout {
                    Layout.fillWidth: true
                    Layout.topMargin: 5

                    Text {
                        text: "RANGE"
                        font.pixelSize: 14
                        font.family: "Roboto"
                        font.weight: Font.Medium
                        color: "white"
                    }

                    Text {
                        Layout.alignment: Qt.AlignRight
                        text: (vehicleData ? vehicleData.range : 450) + " KM"
                        font.pixelSize: 14
                        font.family: "Roboto"
                        font.weight: Font.Bold
                        color: "#00E0FF"
                    }
                }
            }
        }
    }
}
