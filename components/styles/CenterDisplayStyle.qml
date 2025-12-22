// Шаблон стиля для центрального дисплея
// Обязательные свойства:
// - vehicleData: объект с данными о транспортном средстве

import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: root
    
    // Обязательные свойства
    property var vehicleData: ({
        speed: 0,
        rpm: 0,
        fuelLevel: 0,
        engineTemp: 0,
        odometer: 0,
        tripA: 0,
        tripB: 0,
        currentTime: "",
        currentDate: "",
        gear: "P",
        leftSignal: false,
        rightSignal: false
    })
    
    // Настраиваемые свойства
    property color primaryColor: "#4CAF50"
    property color backgroundColor: "#1E1E1E"
    property color textColor: "white"
    property color warningColor: "#FF9800"
    property color dangerColor: "#F44336"
    property int titleSize: 16
    property int valueSize: 24
    property int largeValueSize: 32
    
    // Валидация данных
    function validateData(data) {
        const requiredProps = [
            'speed', 'rpm', 'fuelLevel', 'engineTemp', 
            'odometer', 'tripA', 'tripB', 'currentTime', 
            'currentDate', 'gear', 'leftSignal', 'rightSignal'
        ];
        
        for (const prop of requiredProps) {
            if (data[prop] === undefined) {
                console.error(`CenterDisplay: Missing required property '${prop}' in vehicleData`);
                return false;
            }
        }
        return true;
    }
    
    Rectangle {
        id: background
        anchors.fill: parent
        color: backgroundColor
        radius: 10
        border.color: Qt.darker(primaryColor, 1.5)
        border.width: 2
        
        // Основной контейнер
        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 10
            spacing: 5
            
            // Верхняя строка: передача и показания
            RowLayout {
                Layout.fillWidth: true
                
                // Передача
                Rectangle {
                    Layout.preferredWidth: 60
                    Layout.preferredHeight: 60
                    color: "transparent"
                    border.color: primaryColor
                    border.width: 2
                    radius: 5
                    
                    Text {
                        anchors.centerIn: parent
                        text: vehicleData.gear || "P"
                        color: textColor
                        font.pixelSize: largeValueSize
                        font.bold: true
                    }
                }
                
                // Пробег
                Column {
                    Layout.fillWidth: true
                    spacing: 2
                    
                    Text {
                        text: "Пробег"
                        color: textColor
                        font.pixelSize: titleSize
                        opacity: 0.7
                    }
                    
                    Text {
                        text: (vehicleData.odometer || 0).toFixed(1) + " км"
                        color: textColor
                        font.pixelSize: valueSize
                        font.bold: true
                    }
                }
                
                // Время и дата
                Column {
                    Layout.alignment: Qt.AlignRight
                    spacing: 2
                    
                    Text {
                        text: vehicleData.currentTime || "--:--"
                        color: primaryColor
                        font.pixelSize: valueSize
                        font.bold: true
                    }
                    
                    Text {
                        text: vehicleData.currentDate || "--.--.----"
                        color: textColor
                        font.pixelSize: titleSize
                        opacity: 0.7
                    }
                }
            }
            
            // Средняя строка: показания датчиков
            RowLayout {
                Layout.fillWidth: true
                Layout.topMargin: 10
                spacing: 10
                
                // Уровень топлива
                Column {
                    Layout.fillWidth: true
                    spacing: 2
                    
                    Text {
                        text: "Топливо"
                        color: textColor
                        font.pixelSize: titleSize
                        opacity: 0.7
                    }
                    
                    Text {
                        property bool lowFuel: (vehicleData.fuelLevel || 0) < 15
                        text: (vehicleData.fuelLevel || 0) + "%"
                        color: lowFuel ? dangerColor : textColor
                        font.pixelSize: valueSize
                        font.bold: true
                    }
                    
                    // Индикатор уровня топлива
                    Rectangle {
                        width: parent.width
                        height: 5
                        radius: 2.5
                        color: "#333333"
                        
                        Rectangle {
                            width: parent.width * Math.min(1, (vehicleData.fuelLevel || 0) / 100)
                            height: parent.height
                            radius: parent.radius
                            color: parent.parent.children[1].color
                        }
                    }
                }
                
                // Температура двигателя
                Column {
                    Layout.fillWidth: true
                    spacing: 2
                    
                    Text {
                        text: "Температура"
                        color: textColor
                        font.pixelSize: titleSize
                        opacity: 0.7
                    }
                    
                    Text {
                        property bool highTemp: (vehicleData.engineTemp || 0) > 95
                        text: (vehicleData.engineTemp || 0) + "°C"
                        color: highTemp ? dangerColor : textColor
                        font.pixelSize: valueSize
                        font.bold: true
                    }
                    
                    // Индикатор температуры
                    Rectangle {
                        width: parent.width
                        height: 5
                        radius: 2.5
                        color: "#333333"
                        
                        Rectangle {
                            width: parent.width * Math.min(1, (vehicleData.engineTemp || 0) / 120)
                            height: parent.height
                            radius: parent.radius
                            color: parent.parent.children[1].color
                        }
                    }
                }
            }
            
            // Нижняя строка: поездки A и B
            RowLayout {
                Layout.fillWidth: true
                Layout.topMargin: 10
                spacing: 10
                
                // Поездка A
                Column {
                    Layout.fillWidth: true
                    spacing: 2
                    
                    Text {
                        text: "Поездка A"
                        color: textColor
                        font.pixelSize: titleSize
                        opacity: 0.7
                    }
                    
                    Text {
                        text: (vehicleData.tripA || 0).toFixed(1) + " км"
                        color: textColor
                        font.pixelSize: valueSize
                        font.bold: true
                    }
                }
                
                // Поездка B
                Column {
                    Layout.fillWidth: true
                    spacing: 2
                    
                    Text {
                        text: "Поездка B"
                        color: textColor
                        font.pixelSize: titleSize
                        opacity: 0.7
                    }
                    
                    Text {
                        text: (vehicleData.tripB || 0).toFixed(1) + " км"
                        color: textColor
                        font.pixelSize: valueSize
                        font.bold: true
                    }
                }
            }
            
            // Поворотники
            RowLayout {
                Layout.fillWidth: true
                Layout.topMargin: 10
                spacing: 10
                visible: vehicleData.leftSignal || vehicleData.rightSignal
                
                Item { Layout.fillWidth: true }
                
                // Левый поворотник
                Rectangle {
                    visible: vehicleData.leftSignal
                    width: 30
                    height: 30
                    radius: 5
                    color: warningColor
                    opacity: leftSignalTimer.running ? 1.0 : 0.3
                    
                    Text {
                        anchors.centerIn: parent
                        text: "←"
                        color: "black"
                        font.pixelSize: 20
                        font.bold: true
                    }
                }
                
                // Правый поворотник
                Rectangle {
                    visible: vehicleData.rightSignal
                    width: 30
                    height: 30
                    radius: 5
                    color: warningColor
                    opacity: rightSignalTimer.running ? 1.0 : 0.3
                    
                    Text {
                        anchors.centerIn: parent
                        text: "→"
                        color: "black"
                        font.pixelSize: 20
                        font.bold: true
                    }
                }
                
                Item { Layout.fillWidth: true }
                
                // Таймеры для мигания поворотников
                Timer {
                    id: leftSignalTimer
                    interval: 500
                    running: vehicleData.leftSignal
                    repeat: true
                    onTriggered: {}
                }
                
                Timer {
                    id: rightSignalTimer
                    interval: 500
                    running: vehicleData.rightSignal
                    repeat: true
                    onTriggered: {}
                }
            }
        }
    }
    
    // Функция для проверки валидности стиля
    function validateStyle(style) {
        if (!style.vehicleData) {
            console.error("CenterDisplay: Missing required property 'vehicleData' in style");
            return false;
        }
        
        return validateData(style.vehicleData);
    }
}
