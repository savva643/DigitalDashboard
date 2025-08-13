import QtQuick 2.15
import QtQuick.Controls 2.15

Column {
    property string title: ""
    property real value: 0
    property string suffix: ""
    property real maxValue: 100
    property color color: "#00BCD4"

    spacing: 4

    Text {
        text: title
        font.pixelSize: 10
        color: "#B0B0B0"
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Text {
        text: value.toFixed(0) + suffix
        font.pixelSize: 18
        font.weight: Font.Bold
        color: color
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Rectangle {
        width: 60
        height: 4
        radius: 2
        color: "#404040"
        anchors.horizontalCenter: parent.horizontalCenter

        Rectangle {
            width: parent.width * (value / maxValue)
            height: parent.height
            radius: 2
            color: parent.parent.color
        }
    }
}
