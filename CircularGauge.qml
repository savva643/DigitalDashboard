import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    property string title: ""
    property real value: 0
    property real maxValue: 100
    property string suffix: ""
    property color color: "#00BCD4"
    property int decimals: 0

    //signal valueChanged(real value)

    width: 120
    height: 140

    Column {
        anchors.centerIn: parent
        spacing: 8

        Item {
            width: 80
            height: 80
            anchors.horizontalCenter: parent.horizontalCenter

            // Background circle
            Rectangle {
                anchors.centerIn: parent
                width: 80
                height: 80
                radius: 40
                color: "transparent"
                border.color: "#404040"
                border.width: 6
            }

            // Progress arc
            Canvas {
                anchors.fill: parent

                onPaint: {
                    var ctx = getContext("2d")
                    ctx.clearRect(0, 0, width, height)

                    var centerX = width / 2
                    var centerY = height / 2
                    var radius = 34
                    var startAngle = -Math.PI / 2
                    var endAngle = startAngle + (value / maxValue) * 2 * Math.PI

                    ctx.beginPath()
                    ctx.arc(centerX, centerY, radius, startAngle, endAngle)
                    ctx.lineWidth = 6
                    ctx.strokeStyle = color
                    ctx.lineCap = "round"
                    ctx.stroke()
                }

                Connections {
                    target: parent.parent.parent
                    function onValueChanged() { parent.requestPaint() }
                }
            }

            // Center value
            Text {
                anchors.centerIn: parent
                text: value.toFixed(decimals)
                font.pixelSize: 16
                font.weight: Font.Bold
                color: color
            }
        }

        Text {
            text: title
            font.pixelSize: 10
            color: "#E0E0E0"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Slider {
            width: 100
            anchors.horizontalCenter: parent.horizontalCenter
            from: 0
            to: maxValue
            value: parent.parent.value
            onMoved: parent.parent.valueChanged(value)

            background: Rectangle {
                x: parent.leftPadding
                y: parent.topPadding + parent.availableHeight / 2 - height / 2
                width: parent.availableWidth
                height: 2
                radius: 1
                color: "#404040"
            }

            handle: Rectangle {
                x: parent.leftPadding + parent.visualPosition * (parent.availableWidth - width)
                y: parent.topPadding + parent.availableHeight / 2 - height / 2
                width: 12
                height: 12
                radius: 6
                color: parent.parent.parent.color
            }
        }
    }
}
