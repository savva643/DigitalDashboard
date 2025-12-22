// Шаблон стиля для тахометра
// Обязательные свойства:
// - value: текущее значение оборотов (0-8)
// - minValue: минимальное значение (по умолчанию 0)
// - maxValue: максимальное значение (по умолчанию 8)
// - unit: единицы измерения (например, "x1000")

import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: root
    
    // Обязательные свойства
    property real value: 0
    property real minValue: 0
    property real maxValue: 8
    property string unit: "x1000"
    
    // Настраиваемые свойства
    property color primaryColor: "#FF5252"
    property color warningColor: "#FF9800"
    property color dangerColor: "#F44336"
    property color backgroundColor: "#1E1E1E"
    property color textColor: "white"
    property int fontSize: 24
    
    // Валидация значений
    onValueChanged: {
        if (isNaN(value)) {
            console.error("RpmGauge: value must be a number");
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
                
                // Расчет цветовых зон
                var progress = (value - minValue) / (maxValue - minValue);
                progress = Math.min(Math.max(progress, 0), 1);
                var progressAngle = startAngle + (endAngle - startAngle) * progress;
                var warningStart = 0.65; // 65% - начало оранжевой зоны
                var dangerStart = 0.85;  // 85% - начало красной зоны
                
                // Отрисовка активной части шкалы
                ctx.beginPath();
                
                if (progress <= warningStart) {
                    // Только зеленая зона
                    ctx.arc(centerX, centerY, radius, startAngle, 
                           startAngle + (endAngle - startAngle) * progress, false);
                    ctx.strokeStyle = primaryColor;
                } else if (progress <= dangerStart) {
                    // Зеленая + оранжевая зоны
                    // Зеленая часть
                    ctx.arc(centerX, centerY, radius, startAngle, 
                           startAngle + (endAngle - startAngle) * warningStart, false);
                    // Оранжевая часть
                    var orangeEnd = startAngle + (endAngle - startAngle) * progress;
                    ctx.arc(centerX, centerY, radius, 
                           startAngle + (endAngle - startAngle) * warningStart, 
                           orangeEnd, false);
                    ctx.strokeStyle = warningColor;
                } else {
                    // Зеленая + оранжевая + красная зоны
                    // Зеленая часть
                    ctx.arc(centerX, centerY, radius, startAngle, 
                           startAngle + (endAngle - startAngle) * warningStart, false);
                    // Оранжевая часть
                    ctx.arc(centerX, centerY, radius, 
                           startAngle + (endAngle - startAngle) * warningStart, 
                           startAngle + (endAngle - startAngle) * dangerStart, false);
                    // Красная часть
                    var redEnd = startAngle + (endAngle - startAngle) * progress;
                    ctx.arc(centerX, centerY, radius, 
                           startAngle + (endAngle - startAngle) * dangerStart, 
                           redEnd, false);
                    ctx.strokeStyle = dangerColor;
                }
                
                ctx.lineWidth = 10;
                ctx.stroke();
                
                // Отрисовка делений
                ctx.save();
                ctx.translate(centerX, centerY);
                ctx.rotate(-Math.PI/2); // Поворачиваем на 90 градусов влево
                
                var tickCount = 9; // Количество делений (0-8)
                var tickLength = 10;
                var tickWidth = 2;
                
                for (var i = 0; i <= tickCount; i++) {
                    var angle = (i / tickCount) * 270 * (Math.PI / 180);
                    var x1 = radius * Math.cos(angle);
                    var y1 = radius * Math.sin(angle);
                    var x2 = (radius - tickLength) * Math.cos(angle);
                    var y2 = (radius - tickLength) * Math.sin(angle);
                    
                    ctx.beginPath();
                    ctx.moveTo(x1, y1);
                    ctx.lineTo(x2, y2);
                    ctx.lineWidth = tickWidth;
                    
                    // Выбор цвета деления в зависимости от зоны
                    var tickProgress = i / tickCount;
                    if (tickProgress <= warningStart) {
                        ctx.strokeStyle = primaryColor;
                    } else if (tickProgress <= dangerStart) {
                        ctx.strokeStyle = warningColor;
                    } else {
                        ctx.strokeStyle = dangerColor;
                    }
                    
                    ctx.stroke();
                }
                
                ctx.restore();
            }
        }
        
        // Значение оборотов
        Text {
            id: rpmValue
            anchors.centerIn: parent
            text: value.toFixed(1)
            color: textColor
            font.pixelSize: fontSize * 1.5
            font.bold: true
        }
        
        // Единицы измерения
        Text {
            anchors {
                top: rpmValue.bottom
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
                console.error(`RpmGauge: Missing required property '${prop}' in style`);
                return false;
            }
        }
        return true;
    }
}
