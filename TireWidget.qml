import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    property int tireIndex: 0
    property real pressure: 2.3
    property real temperature: 25

    //signal pressureChanged(real pressure)
    //signal temperatureChanged(real temperature)

    width: 180
    height: 120
    radius: 8
    color: "#3A3A3A"
    border.color: pressure < 2.0 ? "#F44336" : "#4CAF50"
    border.width: 2

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 12
        spacing: 8

        Text {
            text: "Tire " + (tireIndex + 1)
            font.pixelSize: 12
            font.weight: Font.Bold
            color: "#E0E0E0"
            Layout.alignment: Qt.AlignHCenter
        }

        Row {
            Layout.alignment: Qt.AlignHCenter
            spacing: 16

            Column {
                spacing: 4

                Text {
                    text: pressure.toFixed(2) + " bar"
                    font.pixelSize: 14
                    font.weight: Font.Bold
                    color: pressure < 2.0 ? "#F44336" : "#4CAF50"
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Slider {
                    width: 60
                    from: 0
                    to: 5
                    value: pressure
                    onMoved: pressureChanged(value)
                }
            }

            Column {
                spacing: 4

                Text {
                    text: temperature.toFixed(0) + "°C"
                    font.pixelSize: 14
                    font.weight: Font.Bold
                    color: temperature > 60 ? "#F44336" : "#4CAF50"
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Slider {
                    width: 60
                    from: -20
                    to: 120
                    value: temperature
                    onMoved: temperatureChanged(value)
                }
            }
        }
    }
}
