import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ColumnLayout {
    property string title: ""
    property real value: 0
    property real from: 0
    property real to: 100
    property string suffix: ""
    property color color: "#00BCD4"
    property int decimals: 0

    //signal valueChanged(real value)

    spacing: 8

    RowLayout {
        Text {
            text: title
            font.pixelSize: 12
            color: "#E0E0E0"
            Layout.fillWidth: true
        }

        Text {
            text: value.toFixed(decimals) + suffix
            font.pixelSize: 14
            font.weight: Font.Bold
            color: color
        }
    }

    Slider {
        Layout.fillWidth: true
        from: parent.from
        to: parent.to
        value: parent.value

        onMoved: parent.valueChanged(value)

        background: Rectangle {
            x: parent.leftPadding
            y: parent.topPadding + parent.availableHeight / 2 - height / 2
            implicitWidth: 200
            implicitHeight: 4
            width: parent.availableWidth
            height: implicitHeight
            radius: 2
            color: "#404040"

            Rectangle {
                width: parent.parent.visualPosition * parent.width
                height: parent.height
                color: parent.parent.parent.color
                radius: 2
            }
        }

        handle: Rectangle {
            x: parent.leftPadding + parent.visualPosition * (parent.availableWidth - width)
            y: parent.topPadding + parent.availableHeight / 2 - height / 2
            implicitWidth: 20
            implicitHeight: 20
            radius: 10
            color: parent.pressed ? Qt.darker(parent.parent.color, 1.2) : parent.parent.color
            border.color: "#FFFFFF"
            border.width: 2
        }
    }
}
