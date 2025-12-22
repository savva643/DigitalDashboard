// Шаблон стиля для спидометра
// Обязательные свойства:
// - value: текущее значение скорости (0-220)
// - minValue: минимальное значение (по умолчанию 0)
// - maxValue: максимальное значение (по умолчанию 220)
// - unit: единицы измерения (например, "km/h")

import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: root
    
    // Обязательные свойства
    property real value: 0
    property real minValue: 0
    property real maxValue: 220
    property string unit: "km/h"
    
    // Настраиваемые свойства
    property color primaryColor: "#00E0FF"
    property color backgroundColor: "#1E1E1E"
    property color textColor: "white"
    property int fontSize: 30
    
    // Валидация значений
    onValueChanged: {
        if (isNaN(value)) {
            console.error("SpeedGauge: value must be a number");
            value = 0;
        }
    }
    
    Rectangle {
        id: background
        anchors.fill: parent
        color: backgroundColor
        radius: width / 2
        border.color: Qt.darker(primaryColor, 1.5)
        border.width: 2
        
        // Шкала
        Canvas {
            id: gaugeArc
            anchors.fill: parent
            rotation: -135
            
            onPaint: {
                var ctx = getContext("2d");
                var centerX = width / 2;
                var centerY = height / 2;
                var radius = Math.min(centerX, centerY) * 0.8;
                var startAngle = 0;
                var endAngle = 270 * (Math.PI / 180);
                
                // Очистка
                ctx.reset();
                
                // Отрисовка фона шкалы
                ctx.beginPath();
                ctx.arc(centerX, centerY, radius, startAngle, endAngle, false);
                ctx.lineWidth = 10;
                ctx.strokeStyle = Qt.darker(primaryColor, 3);
                ctx.stroke();
                
                // Отрисовка активной части шкалы
                var progress = (value - minValue) / (maxValue - minValue);
                progress = Math.min(Math.max(progress, 0), 1);
                var progressAngle = startAngle + (endAngle - startAngle) * progress;
                
                ctx.beginPath();
                ctx.arc(centerX, centerY, radius, startAngle, progressAngle, false);
                ctx.lineWidth = 10;
                ctx.strokeStyle = primaryColor;
                ctx.stroke();
            }
        }
        
        // Значение скорости
        Text {
            id: speedText
            anchors.centerIn: parent
            text: Math.round(value)
            color: textColor
            font.pixelSize: fontSize * 1.5
            font.bold: true
        }
        
        // Единицы измерения
        Text {
            anchors {
                top: speedText.bottom
                horizontalCenter: parent.horizontalCenter
            }
            text: unit
            color: textColor
            font.pixelSize: fontSize * 0.5
            opacity: 0.8
        }
    }
    
    // Обновление при изменении свойств
    onPrimaryColorChanged: gaugeArc.requestPaint()
    onValueChanged: gaugeArc.requestPaint()
    onMinValueChanged: gaugeArc.requestPaint()
    onMaxValueChanged: gaugeArc.requestPaint()
    
    // Функция для проверки валидности стиля
    function validateStyle(style) {
        const requiredProps = ['value', 'minValue', 'maxValue', 'unit'];
        for (const prop of requiredProps) {
            if (style[prop] === undefined) {
                console.error(`SpeedGauge: Missing required property '${prop}' in style`);
                return false;
            }
        }
        return true;
    }
}
