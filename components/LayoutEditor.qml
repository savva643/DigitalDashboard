import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    id: layoutEditor
    
    property var currentLayout: ({})
    property var currentTheme: null
    
    signal layoutChanged(var layout)
    
    function applyLayout(layoutConfig) {
        currentLayout = layoutConfig || {}
        layoutChanged(currentLayout)
    }
    
    ColumnLayout {
        anchors.fill: parent
        spacing: 10
        
        // Заголовок
        Text {
            text: "📐 Layout Editor"
            font.pixelSize: 18
            font.bold: true
            color: "white"
        }
        
        // Выбор шаблона
        RowLayout {
            Layout.fillWidth: true
            
            Text {
                text: "Шаблон расположения:"
                color: "white"
            }
            
            ComboBox {
                id: layoutTemplateCombo
                Layout.fillWidth: true
                model: ["Default", "Compact", "Vertical", "Wide", "Custom"]
                currentIndex: 0
                
                onCurrentIndexChanged: {
                    if (currentIndex < 4) {
                        loadTemplate(model[currentIndex])
                    } else {
                        // Custom - переходим в режим редактирования
                        customLayoutMode = true
                    }
                }
            }
        }
        
        property bool customLayoutMode: false
        
        // Визуальный редактор (для кастомного режима)
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "#1A1A1A"
            border.color: "#00E0FF"
            border.width: 2
            radius: 8
            visible: parent.customLayoutMode
            
            Text {
                anchors.centerIn: parent
                text: "Перетащите элементы для настройки расположения"
                color: "#AAAAAA"
                font.pixelSize: 14
            }
            
            // Визуальное представление элементов
            Item {
                id: layoutCanvas
                anchors.fill: parent
                anchors.margins: 20
                
                // Status Bar
                Rectangle {
                    id: statusBarPreview
                    width: parent.width - 40
                    height: 40
                    color: "#4CAF50"
                    radius: 5
                    border.color: "#00E0FF"
                    border.width: 2
                    
                    Text {
                        anchors.centerIn: parent
                        text: "Status Bar"
                        color: "white"
                        font.pixelSize: 12
                    }
                    
                    Drag.active: statusBarDragArea.drag.active
                    Drag.hotSpot.x: width / 2
                    Drag.hotSpot.y: height / 2
                    
                    MouseArea {
                        id: statusBarDragArea
                        anchors.fill: parent
                        drag.target: statusBarPreview
                        drag.axis: Drag.YAxis
                        
                        onReleased: {
                            saveElementPosition("statusBar", statusBarPreview.x, statusBarPreview.y)
                        }
                    }
                }
                
                // Center Display
                Rectangle {
                    id: centerDisplayPreview
                    width: 200
                    height: 200
                    x: (parent.width - width) / 2
                    y: (parent.height - height) / 2
                    color: "#00E0FF"
                    radius: 5
                    border.color: "#FFFFFF"
                    border.width: 2
                    
                    Text {
                        anchors.centerIn: parent
                        text: "Center Display"
                        color: "white"
                        font.pixelSize: 12
                    }
                    
                    Drag.active: centerDisplayDragArea.drag.active
                    Drag.hotSpot.x: width / 2
                    Drag.hotSpot.y: height / 2
                    
                    MouseArea {
                        id: centerDisplayDragArea
                        anchors.fill: parent
                        drag.target: centerDisplayPreview
                        
                        onReleased: {
                            saveElementPosition("centerDisplay", centerDisplayPreview.x, centerDisplayPreview.y)
                        }
                    }
                }
                
                // Left Gauge
                Rectangle {
                    id: leftGaugePreview
                    width: 150
                    height: 150
                    x: centerDisplayPreview.x - width - 20
                    y: centerDisplayPreview.y + (centerDisplayPreview.height - height) / 2
                    color: "#FF3333"
                    radius: 75
                    border.color: "#FFFFFF"
                    border.width: 2
                    
                    Text {
                        anchors.centerIn: parent
                        text: "RPM"
                        color: "white"
                        font.pixelSize: 12
                    }
                    
                    Drag.active: leftGaugeDragArea.drag.active
                    Drag.hotSpot.x: width / 2
                    Drag.hotSpot.y: height / 2
                    
                    MouseArea {
                        id: leftGaugeDragArea
                        anchors.fill: parent
                        drag.target: leftGaugePreview
                        
                        onReleased: {
                            saveElementPosition("leftGauge", leftGaugePreview.x, leftGaugePreview.y)
                        }
                    }
                }
                
                // Right Gauge
                Rectangle {
                    id: rightGaugePreview
                    width: 150
                    height: 150
                    x: centerDisplayPreview.x + centerDisplayPreview.width + 20
                    y: centerDisplayPreview.y + (centerDisplayPreview.height - height) / 2
                    color: "#33FF33"
                    radius: 75
                    border.color: "#FFFFFF"
                    border.width: 2
                    
                    Text {
                        anchors.centerIn: parent
                        text: "Speed"
                        color: "white"
                        font.pixelSize: 12
                    }
                    
                    Drag.active: rightGaugeDragArea.drag.active
                    Drag.hotSpot.x: width / 2
                    Drag.hotSpot.y: height / 2
                    
                    MouseArea {
                        id: rightGaugeDragArea
                        anchors.fill: parent
                        drag.target: rightGaugePreview
                        
                        onReleased: {
                            saveElementPosition("rightGauge", rightGaugePreview.x, rightGaugePreview.y)
                        }
                    }
                }
                
                // Warning Icons
                Rectangle {
                    id: warningIconsPreview
                    width: parent.width - 40
                    height: 30
                    x: 20
                    y: parent.height - height - 20
                    color: "#FF9800"
                    radius: 5
                    border.color: "#FFFFFF"
                    border.width: 2
                    
                    Text {
                        anchors.centerIn: parent
                        text: "Warning Icons"
                        color: "white"
                        font.pixelSize: 12
                    }
                    
                    Drag.active: warningIconsDragArea.drag.active
                    Drag.hotSpot.x: width / 2
                    Drag.hotSpot.y: height / 2
                    
                    MouseArea {
                        id: warningIconsDragArea
                        anchors.fill: parent
                        drag.target: warningIconsPreview
                        drag.axis: Drag.YAxis
                        
                        onReleased: {
                            saveElementPosition("warningIcons", warningIconsPreview.x, warningIconsPreview.y)
                        }
                    }
                }
            }
        }
        
        // Предпросмотр шаблонов (для не-кастомных режимов)
        ScrollView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            visible: !parent.customLayoutMode
            clip: true
            
            Column {
                width: parent.width
                spacing: 10
                
                // Default Layout
                Rectangle {
                    width: parent.width
                    height: 200
                    color: layoutTemplateCombo.currentIndex === 0 ? "#4CAF50" : "#3D3D3D"
                    radius: 5
                    border.color: "#00E0FF"
                    border.width: layoutTemplateCombo.currentIndex === 0 ? 2 : 1
                    
                    Text {
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.margins: 10
                        text: "Default Layout"
                        color: "white"
                        font.bold: true
                    }
                    
                    // Визуализация расположения
                    Item {
                        anchors.centerIn: parent
                        width: parent.width - 40
                        height: 150
                        
                        Rectangle {
                            anchors.top: parent.top
                            anchors.horizontalCenter: parent.horizontalCenter
                            width: parent.width
                            height: 20
                            color: "#4CAF50"
                            radius: 3
                        }
                        
                        Row {
                            anchors.centerIn: parent
                            spacing: 10
                            
                            Rectangle {
                                width: 60
                                height: 60
                                radius: 30
                                color: "#FF3333"
                            }
                            
                            Rectangle {
                                width: 80
                                height: 80
                                color: "#00E0FF"
                            }
                            
                            Rectangle {
                                width: 60
                                height: 60
                                radius: 30
                                color: "#33FF33"
                            }
                        }
                        
                        Rectangle {
                            anchors.bottom: parent.bottom
                            anchors.horizontalCenter: parent.horizontalCenter
                            width: parent.width
                            height: 15
                            color: "#FF9800"
                            radius: 3
                        }
                    }
                    
                    MouseArea {
                        anchors.fill: parent
                        onClicked: loadTemplate("Default")
                    }
                }
                
                // Compact Layout
                Rectangle {
                    width: parent.width
                    height: 200
                    color: layoutTemplateCombo.currentIndex === 1 ? "#4CAF50" : "#3D3D3D"
                    radius: 5
                    border.color: "#00E0FF"
                    border.width: layoutTemplateCombo.currentIndex === 1 ? 2 : 1
                    
                    Text {
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.margins: 10
                        text: "Compact Layout"
                        color: "white"
                        font.bold: true
                    }
                    
                    Item {
                        anchors.centerIn: parent
                        width: parent.width - 40
                        height: 150
                        
                        Rectangle {
                            anchors.top: parent.top
                            anchors.horizontalCenter: parent.horizontalCenter
                            width: parent.width
                            height: 15
                            color: "#4CAF50"
                            radius: 3
                        }
                        
                        Row {
                            anchors.centerIn: parent
                            spacing: 5
                            
                            Rectangle {
                                width: 50
                                height: 50
                                radius: 25
                                color: "#FF3333"
                            }
                            
                            Rectangle {
                                width: 70
                                height: 70
                                color: "#00E0FF"
                            }
                            
                            Rectangle {
                                width: 50
                                height: 50
                                radius: 25
                                color: "#33FF33"
                            }
                        }
                        
                        Rectangle {
                            anchors.bottom: parent.bottom
                            anchors.horizontalCenter: parent.horizontalCenter
                            width: parent.width
                            height: 15
                            color: "#FF9800"
                            radius: 3
                        }
                    }
                    
                    MouseArea {
                        anchors.fill: parent
                        onClicked: loadTemplate("Compact")
                    }
                }
                
                // Vertical Layout
                Rectangle {
                    width: parent.width
                    height: 200
                    color: layoutTemplateCombo.currentIndex === 2 ? "#4CAF50" : "#3D3D3D"
                    radius: 5
                    border.color: "#00E0FF"
                    border.width: layoutTemplateCombo.currentIndex === 2 ? 2 : 1
                    
                    Text {
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.margins: 10
                        text: "Vertical Layout"
                        color: "white"
                        font.bold: true
                    }
                    
                    Item {
                        anchors.centerIn: parent
                        width: parent.width - 40
                        height: 150
                        
                        Rectangle {
                            anchors.top: parent.top
                            anchors.horizontalCenter: parent.horizontalCenter
                            width: parent.width
                            height: 15
                            color: "#4CAF50"
                            radius: 3
                        }
                        
                        Column {
                            anchors.centerIn: parent
                            spacing: 5
                            
                            Rectangle {
                                width: 50
                                height: 50
                                radius: 25
                                color: "#FF3333"
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            
                            Rectangle {
                                width: 80
                                height: 80
                                color: "#00E0FF"
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            
                            Rectangle {
                                width: 50
                                height: 50
                                radius: 25
                                color: "#33FF33"
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                        }
                        
                        Rectangle {
                            anchors.bottom: parent.bottom
                            anchors.horizontalCenter: parent.horizontalCenter
                            width: parent.width
                            height: 15
                            color: "#FF9800"
                            radius: 3
                        }
                    }
                    
                    MouseArea {
                        anchors.fill: parent
                        onClicked: loadTemplate("Vertical")
                    }
                }
                
                // Wide Layout
                Rectangle {
                    width: parent.width
                    height: 200
                    color: layoutTemplateCombo.currentIndex === 3 ? "#4CAF50" : "#3D3D3D"
                    radius: 5
                    border.color: "#00E0FF"
                    border.width: layoutTemplateCombo.currentIndex === 3 ? 2 : 1
                    
                    Text {
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.margins: 10
                        text: "Wide Layout"
                        color: "white"
                        font.bold: true
                    }
                    
                    Item {
                        anchors.centerIn: parent
                        width: parent.width - 40
                        height: 150
                        
                        Rectangle {
                            anchors.top: parent.top
                            anchors.horizontalCenter: parent.horizontalCenter
                            width: parent.width
                            height: 15
                            color: "#4CAF50"
                            radius: 3
                        }
                        
                        Row {
                            anchors.centerIn: parent
                            spacing: 30
                            
                            Rectangle {
                                width: 50
                                height: 50
                                radius: 25
                                color: "#FF3333"
                            }
                            
                            Rectangle {
                                width: 80
                                height: 80
                                color: "#00E0FF"
                            }
                            
                            Rectangle {
                                width: 50
                                height: 50
                                radius: 25
                                color: "#33FF33"
                            }
                        }
                        
                        Rectangle {
                            anchors.bottom: parent.bottom
                            anchors.horizontalCenter: parent.horizontalCenter
                            width: parent.width
                            height: 15
                            color: "#FF9800"
                            radius: 3
                        }
                    }
                    
                    MouseArea {
                        anchors.fill: parent
                        onClicked: loadTemplate("Wide")
                    }
                }
            }
        }
    }
    
    function loadTemplate(templateName) {
        customLayoutMode = false
        
        // Применяем предустановленные шаблоны
        if (templateName === "Default") {
            applyDefaultLayout()
        } else if (templateName === "Compact") {
            currentLayout = {
                "statusBar": {
                    "position": "top",
                    "anchors": {"top": true, "left": true, "right": true, "margins": 10}
                },
                "centerDisplay": {
                    "position": "center",
                    "anchors": {"centerIn": "parent"}
                },
                "leftGauge": {
                    "position": "left",
                    "anchors": {"verticalCenter": true, "right": "centerDisplay", "rightMargin": 10}
                },
                "rightGauge": {
                    "position": "right",
                    "anchors": {"verticalCenter": true, "left": "centerDisplay", "leftMargin": 10}
                },
                "warningIcons": {
                    "position": "bottom",
                    "anchors": {"bottom": true, "horizontalCenter": true}
                }
            }
            layoutChanged(currentLayout)
        } else if (templateName === "Vertical") {
            currentLayout = {
                "statusBar": {
                    "position": "top",
                    "anchors": {"top": true, "left": true, "right": true, "margins": 15}
                },
                "centerDisplay": {
                    "position": "center",
                    "anchors": {"centerIn": "parent"}
                },
                "leftGauge": {
                    "position": "top",
                    "anchors": {"horizontalCenter": true, "bottom": "centerDisplay", "bottomMargin": 20}
                },
                "rightGauge": {
                    "position": "bottom",
                    "anchors": {"horizontalCenter": true, "top": "centerDisplay", "topMargin": 20}
                },
                "warningIcons": {
                    "position": "bottom",
                    "anchors": {"bottom": true, "horizontalCenter": true}
                }
            }
            layoutChanged(currentLayout)
        } else if (templateName === "Wide") {
            currentLayout = {
                "statusBar": {
                    "position": "top",
                    "anchors": {"top": true, "left": true, "right": true, "margins": 15}
                },
                "centerDisplay": {
                    "position": "center",
                    "anchors": {"centerIn": "parent"}
                },
                "leftGauge": {
                    "position": "left",
                    "anchors": {"verticalCenter": true, "left": true, "leftMargin": 50}
                },
                "rightGauge": {
                    "position": "right",
                    "anchors": {"verticalCenter": true, "right": true, "rightMargin": 50}
                },
                "warningIcons": {
                    "position": "bottom",
                    "anchors": {"bottom": true, "horizontalCenter": true}
                }
            }
            layoutChanged(currentLayout)
        }
    }
    
    function applyDefaultLayout() {
        currentLayout = {
            "statusBar": {
                "position": "top",
                "anchors": {"top": true, "left": true, "right": true, "margins": 15}
            },
            "centerDisplay": {
                "position": "center",
                "anchors": {"centerIn": "parent"}
            },
            "leftGauge": {
                "position": "left",
                "anchors": {"verticalCenter": true, "right": "centerDisplay", "rightMargin": 20}
            },
            "rightGauge": {
                "position": "right",
                "anchors": {"verticalCenter": true, "left": "centerDisplay", "leftMargin": 20}
            },
            "warningIcons": {
                "position": "bottom",
                "anchors": {"bottom": true, "horizontalCenter": true}
            }
        }
        layoutChanged(currentLayout)
    }
    
    function saveElementPosition(elementName, x, y) {
        if (!currentLayout[elementName]) {
            currentLayout[elementName] = {}
        }
        if (!currentLayout[elementName].customPosition) {
            currentLayout[elementName].customPosition = {}
        }
        currentLayout[elementName].customPosition.x = x
        currentLayout[elementName].customPosition.y = y
        
        layoutChanged(currentLayout)
    }
    
    Component.onCompleted: {
        // Загружаем layoutConfig из текущей темы если есть
        if (currentTheme && currentTheme.layoutConfig) {
            currentLayout = currentTheme.layoutConfig
            layoutChanged(currentLayout)
        } else {
            applyDefaultLayout()
        }
    }
    
    onCurrentThemeChanged: {
        if (currentTheme && currentTheme.layoutConfig) {
            currentLayout = currentTheme.layoutConfig
            layoutChanged(currentLayout)
        }
    }
}

