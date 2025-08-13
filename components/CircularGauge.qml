import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.15

Item {
    id: gauge

    // Properties
    property real minValue: 0
    property real maxValue: 100
    property real value: 0
    property string unit: ""
    property string label: ""
    property color accentColor: "#00E0FF"
    property color dangerColor: "#FF3B30"
    property real dangerThreshold: 0.8 // 80% of max value

    // Internal properties
    property real normalizedValue: Math.min(Math.max((value - minValue) / (maxValue - minValue), 0), 1)
    property bool inDangerZone: normalizedValue > dangerThreshold
    property color currentColor: inDangerZone ? dangerColor : accentColor

    Rectangle {
        id: outerRing
        anchors.fill: parent
        radius: width / 2
        color: "transparent"
        border.color: "#2A2A2A"
        border.width: 2
    }

    Shape {
        id: backgroundArc
        anchors.fill: parent
        anchors.margins: parent.width * 0.1

        ShapePath {
            id: bgPath
            strokeColor: "#333333"
            strokeWidth: Math.min(parent.width, parent.height) * 0.05
            fillColor: "transparent"
            capStyle: ShapePath.RoundCap

            PathAngleArc {
                centerX: backgroundArc.width / 2
                centerY: backgroundArc.height / 2
                radiusX: backgroundArc.width / 2 - bgPath.strokeWidth / 2
                radiusY: backgroundArc.height / 2 - bgPath.strokeWidth / 2
                startAngle: -225
                sweepAngle: 270
            }
        }
    }

    Shape {
        id: valueArc
        anchors.fill: parent
        anchors.margins: parent.width * 0.1

        ShapePath {
            id: valuePath
            strokeColor: gauge.currentColor
            strokeWidth: Math.min(parent.width, parent.height) * 0.05
            fillColor: "transparent"
            capStyle: ShapePath.RoundCap

            PathAngleArc {
                centerX: valueArc.width / 2
                centerY: valueArc.height / 2
                radiusX: valueArc.width / 2 - valuePath.strokeWidth / 2
                radiusY: valueArc.height / 2 - valuePath.strokeWidth / 2
                startAngle: -225
                sweepAngle: 270 * gauge.normalizedValue
            }
        }
    }

    // Tick marks
    Repeater {
        model: 11 // 0 to 10 ticks

        Rectangle {
            width: gauge.width * 0.01
            height: gauge.height * 0.05
            radius: width / 2
            color: "#666666"
            visible: index % 2 === 0 // Только через одну для аккуратности

            property real angle: (-225 + (270 / 10) * index) * Math.PI / 180 // в радианах
            property real radiusFactor: 0.85 // 85% от половины размера
            property real centerX: gauge.width / 2
            property real centerY: gauge.height / 2
            x: centerX + (centerX * radiusFactor) * Math.cos(angle) - width / 2
            y: centerY + (centerY * radiusFactor) * Math.sin(angle) - height / 2

            rotation: (angle * 180 / Math.PI) + 90
            transformOrigin: Item.Center
        }
    }


    // Value text
    Text {
        id: valueText
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -parent.height * 0.05
        text: Math.round(gauge.value)
        font {
            pixelSize: parent.width * 0.25
            family: "Roboto"
            weight: Font.DemiBold
        }
        color: "white"
    }

    // Unit text
    Text {
        id: unitText
        anchors.top: valueText.bottom
        anchors.topMargin: parent.height * 0.02
        anchors.horizontalCenter: parent.horizontalCenter
        text: gauge.unit
        font {
            pixelSize: parent.width * 0.08
            family: "Roboto"
        }
        color: "#AAAAAA"
    }

    // Label text
    Text {
        id: labelText
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height * 0.15
        anchors.horizontalCenter: parent.horizontalCenter
        text: gauge.label
        font {
            pixelSize: parent.width * 0.08
            family: "Roboto"
            weight: Font.Medium
        }
        color: "#AAAAAA"
    }

    // Animated glow effect when in danger zone
    Rectangle {
        visible: gauge.inDangerZone
        anchors.fill: parent
        radius: width / 2
        color: "transparent"
        border.color: gauge.dangerColor
        border.width: 2
        opacity: 0.5

        SequentialAnimation on opacity {
            running: gauge.inDangerZone
            loops: Animation.Infinite
            NumberAnimation { to: 0.2; duration: 700; easing.type: Easing.InOutQuad }
            NumberAnimation { to: 0.5; duration: 700; easing.type: Easing.InOutQuad }
        }
    }
}
