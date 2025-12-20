import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import QtQuick.Dialogs 1.3

ApplicationWindow {
    id: constructorWindow
    width: 1200
    height: 800
    title: "Dashboard Constructor"
    visible: false
    
    Material.theme: Material.Dark
    Material.accent: Material.Cyan
    
    property var currentTheme: ({})
    property string currentThemePath: ""
    
    // Загружаем текущую тему при открытии
    onVisibleChanged: {
        if (visible) {
            loadCurrentTheme()
        }
    }
    
    function loadCurrentTheme() {
        if (themeManager.currentThemePath) {
            currentThemePath = themeManager.currentThemePath
            currentTheme = themeManager.currentTheme
        } else {
            // Загружаем тему по умолчанию
            if (themeManager.loadTheme("default.json")) {
                currentThemePath = "default.json"
                currentTheme = themeManager.currentTheme
            }
        }
    }
    
    function saveCurrentTheme() {
        if (currentThemePath) {
            themeManager.saveTheme(currentThemePath, currentTheme)
            themeManager.loadTheme(currentThemePath)
        }
    }
    
    Rectangle {
        anchors.fill: parent
        color: "#1E1E1E"
        
        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 10
            spacing: 10
            
            // Заголовок
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 60
                color: "#2D2D2D"
                radius: 8
                
                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 15
                    
                    Text {
                        text: "🎨 Dashboard Constructor"
                        font.pixelSize: 20
                        font.bold: true
                        color: "white"
                    }
                    
                    Item { Layout.fillWidth: true }
                    
                    Button {
                        text: "Сохранить"
                        onClicked: saveCurrentTheme()
                    }
                    
                    Button {
                        text: "Закрыть"
                        onClicked: constructorWindow.close()
                    }
                }
            }
            
            // Вкладки
            TabBar {
                id: tabBar
                Layout.fillWidth: true
                Layout.preferredHeight: 40
                
                TabButton {
                    text: "Элементы"
                    width: implicitWidth
                }
                TabButton {
                    text: "Расположение"
                    width: implicitWidth
                }
            }
            
            // Основной контент
            StackLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true
                currentIndex: tabBar.currentIndex
                
                // Вкладка 1: Элементы
                RowLayout {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    spacing: 10
                    
                    // Левая панель - список элементов
                    Rectangle {
                        Layout.preferredWidth: 300
                        Layout.fillHeight: true
                        color: "#2D2D2D"
                        radius: 8
                    
                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 10
                        spacing: 10
                        
                        Text {
                            text: "Элементы панели"
                            font.pixelSize: 16
                            font.bold: true
                            color: "white"
                        }
                        
                        ScrollView {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            clip: true
                            
                            Column {
                                width: parent.width
                                spacing: 5
                                
                                // Статус бар
                                Rectangle {
                                    width: parent.width
                                    height: 50
                                    color: currentTheme.statusBar && currentTheme.statusBar.enabled ? "#4CAF50" : "#666666"
                                    radius: 5
                                    
                                    RowLayout {
                                        anchors.fill: parent
                                        anchors.margins: 10
                                        
                                        Text {
                                            text: "Status Bar"
                                            color: "white"
                                            Layout.fillWidth: true
                                        }
                                        
                                        Switch {
                                            checked: currentTheme.statusBar && currentTheme.statusBar.enabled
                                            onToggled: {
                                                if (!currentTheme.statusBar) currentTheme.statusBar = {}
                                                currentTheme.statusBar.enabled = checked
                                            }
                                        }
                                    }
                                    
                                    MouseArea {
                                        anchors.fill: parent
                                        onClicked: elementDetails.item = statusBarDetails
                                    }
                                }
                                
                                // Центральный дисплей
                                Rectangle {
                                    width: parent.width
                                    height: 50
                                    color: currentTheme.centerDisplay && currentTheme.centerDisplay.enabled ? "#4CAF50" : "#666666"
                                    radius: 5
                                    
                                    RowLayout {
                                        anchors.fill: parent
                                        anchors.margins: 10
                                        
                                        Text {
                                            text: "Center Display"
                                            color: "white"
                                            Layout.fillWidth: true
                                        }
                                        
                                        Switch {
                                            checked: currentTheme.centerDisplay && currentTheme.centerDisplay.enabled
                                            onToggled: {
                                                if (!currentTheme.centerDisplay) currentTheme.centerDisplay = {}
                                                currentTheme.centerDisplay.enabled = checked
                                            }
                                        }
                                    }
                                    
                                    MouseArea {
                                        anchors.fill: parent
                                        onClicked: elementDetails.item = centerDisplayDetails
                                    }
                                }
                                
                                // Левый датчик
                                Rectangle {
                                    width: parent.width
                                    height: 50
                                    color: currentTheme.sideGauges && currentTheme.sideGauges.left && currentTheme.sideGauges.left.enabled ? "#4CAF50" : "#666666"
                                    radius: 5
                                    
                                    RowLayout {
                                        anchors.fill: parent
                                        anchors.margins: 10
                                        
                                        Text {
                                            text: "Left Gauge (RPM)"
                                            color: "white"
                                            Layout.fillWidth: true
                                        }
                                        
                                        Switch {
                                            checked: currentTheme.sideGauges && currentTheme.sideGauges.left && currentTheme.sideGauges.left.enabled
                                            onToggled: {
                                                if (!currentTheme.sideGauges) currentTheme.sideGauges = {}
                                                if (!currentTheme.sideGauges.left) currentTheme.sideGauges.left = {}
                                                currentTheme.sideGauges.left.enabled = checked
                                            }
                                        }
                                    }
                                    
                                    MouseArea {
                                        anchors.fill: parent
                                        onClicked: elementDetails.item = leftGaugeDetails
                                    }
                                }
                                
                                // Правый датчик
                                Rectangle {
                                    width: parent.width
                                    height: 50
                                    color: currentTheme.sideGauges && currentTheme.sideGauges.right && currentTheme.sideGauges.right.enabled ? "#4CAF50" : "#666666"
                                    radius: 5
                                    
                                    RowLayout {
                                        anchors.fill: parent
                                        anchors.margins: 10
                                        
                                        Text {
                                            text: "Right Gauge (Speed)"
                                            color: "white"
                                            Layout.fillWidth: true
                                        }
                                        
                                        Switch {
                                            checked: currentTheme.sideGauges && currentTheme.sideGauges.right && currentTheme.sideGauges.right.enabled
                                            onToggled: {
                                                if (!currentTheme.sideGauges) currentTheme.sideGauges = {}
                                                if (!currentTheme.sideGauges.right) currentTheme.sideGauges.right = {}
                                                currentTheme.sideGauges.right.enabled = checked
                                            }
                                        }
                                    }
                                    
                                    MouseArea {
                                        anchors.fill: parent
                                        onClicked: elementDetails.item = rightGaugeDetails
                                    }
                                }
                                
                                // Warning Icons
                                Rectangle {
                                    width: parent.width
                                    height: 50
                                    color: currentTheme.warningIcons && currentTheme.warningIcons.enabled ? "#4CAF50" : "#666666"
                                    radius: 5
                                    
                                    RowLayout {
                                        anchors.fill: parent
                                        anchors.margins: 10
                                        
                                        Text {
                                            text: "Warning Icons"
                                            color: "white"
                                            Layout.fillWidth: true
                                        }
                                        
                                        Switch {
                                            checked: currentTheme.warningIcons && currentTheme.warningIcons.enabled
                                            onToggled: {
                                                if (!currentTheme.warningIcons) currentTheme.warningIcons = {}
                                                currentTheme.warningIcons.enabled = checked
                                            }
                                        }
                                    }
                                    
                                    MouseArea {
                                        anchors.fill: parent
                                        onClicked: elementDetails.item = warningIconsDetails
                                    }
                                }
                            }
                        }
                    }
                }
                
                // Центральная панель - детали элемента
                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    color: "#2D2D2D"
                    radius: 8
                    
                    Loader {
                        id: elementDetails
                        anchors.fill: parent
                        anchors.margins: 10
                    }
                }
                
                // Правая панель - управление темами
                Rectangle {
                    Layout.preferredWidth: 250
                    Layout.fillHeight: true
                    color: "#2D2D2D"
                    radius: 8
                    
                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 10
                        spacing: 10
                        
                        Text {
                            text: "Темы"
                            font.pixelSize: 16
                            font.bold: true
                            color: "white"
                        }
                        
                        ScrollView {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            clip: true
                            
                            Column {
                                width: parent.width
                                spacing: 5
                                
                                Repeater {
                                    model: themeManager.getAvailableThemes()
                                    
                                    Rectangle {
                                        width: parent.width
                                        height: 40
                                        color: currentThemePath === modelData ? "#4CAF50" : "#3D3D3D"
                                        radius: 5
                                        
                                        Text {
                                            anchors.centerIn: parent
                                            text: modelData.replace(".json", "")
                                            color: "white"
                                        }
                                        
                                        MouseArea {
                                            anchors.fill: parent
                                            onClicked: {
                                                if (themeManager.loadTheme(modelData)) {
                                                    currentThemePath = modelData
                                                    currentTheme = themeManager.currentTheme
                                                    // Обновляем layoutEditor с новой темой
                                                    if (layoutEditor) {
                                                        layoutEditor.currentTheme = currentTheme
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        
                        Button {
                            Layout.fillWidth: true
                            text: "Создать новую тему"
                            onClicked: {
                                // Создание новой темы
                                var newThemeName = "theme_" + Date.now() + ".json"
                                currentThemePath = newThemeName
                                currentTheme = JSON.parse(JSON.stringify(themeManager.currentTheme))
                                currentTheme.name = "New Theme"
                            }
                        }
                    }
                }
                }
                
                // Вкладка 2: Расположение
                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    color: "#2D2D2D"
                    radius: 8
                    
                    Components.LayoutEditor {
                        id: layoutEditor
                        anchors.fill: parent
                        anchors.margins: 10
                        
                        onLayoutChanged: {
                            if (!currentTheme.layoutConfig) {
                                currentTheme.layoutConfig = {}
                            }
                            currentTheme.layoutConfig = layout
                        }
                    }
                }
            }
        }
    }
    
    // Детали для Status Bar
    Component {
        id: statusBarDetails
        
        Column {
            spacing: 10
            
            Text {
                text: "Status Bar Settings"
                font.pixelSize: 18
                font.bold: true
                color: "white"
            }
            
            RowLayout {
                width: parent.width
                
                Text {
                    text: "Position:"
                    color: "white"
                }
                
                ComboBox {
                    model: ["top", "bottom"]
                    currentIndex: currentTheme.statusBar && currentTheme.statusBar.position === "bottom" ? 1 : 0
                    onCurrentIndexChanged: {
                        if (!currentTheme.statusBar) currentTheme.statusBar = {}
                        currentTheme.statusBar.position = model[currentIndex]
                    }
                }
            }
            
            Button {
                text: "Изменить QML файл"
                onClicked: {
                    fileDialog.selectExisting = true
                    fileDialog.nameFilters = ["QML files (*.qml)"]
                    fileDialog.onAccepted = function() {
                        if (!currentTheme.statusBar) currentTheme.statusBar = {}
                        currentTheme.statusBar.qmlPath = fileDialog.fileUrl.toString().replace("file:///", "")
                        if (themeManager.validateWidget("statusBar", currentTheme.statusBar.qmlPath)) {
                            console.log("Widget validated successfully")
                        } else {
                            console.warn("Widget validation failed")
                        }
                    }
                    fileDialog.open()
                }
            }
        }
    }
    
    // Детали для Center Display
    Component {
        id: centerDisplayDetails
        
        Column {
            spacing: 10
            
            Text {
                text: "Center Display Settings"
                font.pixelSize: 18
                font.bold: true
                color: "white"
            }
            
            RowLayout {
                width: parent.width
                
                Text {
                    text: "Width:"
                    color: "white"
                }
                
                SpinBox {
                    from: 200
                    to: 800
                    value: currentTheme.centerDisplay ? currentTheme.centerDisplay.width : 400
                    onValueChanged: {
                        if (!currentTheme.centerDisplay) currentTheme.centerDisplay = {}
                        currentTheme.centerDisplay.width = value
                    }
                }
            }
            
            RowLayout {
                width: parent.width
                
                Text {
                    text: "Height:"
                    color: "white"
                }
                
                SpinBox {
                    from: 200
                    to: 600
                    value: currentTheme.centerDisplay ? currentTheme.centerDisplay.height : 440
                    onValueChanged: {
                        if (!currentTheme.centerDisplay) currentTheme.centerDisplay = {}
                        currentTheme.centerDisplay.height = value
                    }
                }
            }
            
            Button {
                text: "Изменить QML файл"
                onClicked: {
                    fileDialog.selectExisting = true
                    fileDialog.nameFilters = ["QML files (*.qml)"]
                    fileDialog.onAccepted = function() {
                        if (!currentTheme.centerDisplay) currentTheme.centerDisplay = {}
                        currentTheme.centerDisplay.qmlPath = fileDialog.fileUrl.toString().replace("file:///", "")
                        if (themeManager.validateWidget("centerDisplay", currentTheme.centerDisplay.qmlPath)) {
                            console.log("Widget validated successfully")
                        } else {
                            console.warn("Widget validation failed")
                        }
                    }
                    fileDialog.open()
                }
            }
        }
    }
    
    // Детали для Left Gauge
    Component {
        id: leftGaugeDetails
        
        Column {
            spacing: 10
            
            Text {
                text: "Left Gauge (RPM) Settings"
                font.pixelSize: 18
                font.bold: true
                color: "white"
            }
            
            RowLayout {
                width: parent.width
                
                Text {
                    text: "Width:"
                    color: "white"
                }
                
                SpinBox {
                    from: 200
                    to: 600
                    value: currentTheme.sideGauges && currentTheme.sideGauges.left ? currentTheme.sideGauges.left.width : 400
                    onValueChanged: {
                        if (!currentTheme.sideGauges) currentTheme.sideGauges = {}
                        if (!currentTheme.sideGauges.left) currentTheme.sideGauges.left = {}
                        currentTheme.sideGauges.left.width = value
                    }
                }
            }
            
            RowLayout {
                width: parent.width
                
                Text {
                    text: "Height:"
                    color: "white"
                }
                
                SpinBox {
                    from: 200
                    to: 600
                    value: currentTheme.sideGauges && currentTheme.sideGauges.left ? currentTheme.sideGauges.left.height : 400
                    onValueChanged: {
                        if (!currentTheme.sideGauges) currentTheme.sideGauges = {}
                        if (!currentTheme.sideGauges.left) currentTheme.sideGauges.left = {}
                        currentTheme.sideGauges.left.height = value
                    }
                }
            }
            
            RowLayout {
                width: parent.width
                
                Text {
                    text: "Accent Color:"
                    color: "white"
                }
                
                TextField {
                    text: currentTheme.sideGauges && currentTheme.sideGauges.left && currentTheme.sideGauges.left.properties ? currentTheme.sideGauges.left.properties.accentColor : "#00E0FF"
                    onEditingFinished: {
                        if (!currentTheme.sideGauges) currentTheme.sideGauges = {}
                        if (!currentTheme.sideGauges.left) currentTheme.sideGauges.left = {}
                        if (!currentTheme.sideGauges.left.properties) currentTheme.sideGauges.left.properties = {}
                        currentTheme.sideGauges.left.properties.accentColor = text
                    }
                }
            }
            
            Button {
                text: "Изменить QML файл"
                onClicked: {
                    fileDialog.selectExisting = true
                    fileDialog.nameFilters = ["QML files (*.qml)"]
                    fileDialog.onAccepted = function() {
                        if (!currentTheme.sideGauges) currentTheme.sideGauges = {}
                        if (!currentTheme.sideGauges.left) currentTheme.sideGauges.left = {}
                        currentTheme.sideGauges.left.qmlPath = fileDialog.fileUrl.toString().replace("file:///", "")
                        if (themeManager.validateWidget("rpm", currentTheme.sideGauges.left.qmlPath)) {
                            console.log("Widget validated successfully")
                        } else {
                            console.warn("Widget validation failed")
                        }
                    }
                    fileDialog.open()
                }
            }
        }
    }
    
    // Детали для Right Gauge
    Component {
        id: rightGaugeDetails
        
        Column {
            spacing: 10
            
            Text {
                text: "Right Gauge (Speed) Settings"
                font.pixelSize: 18
                font.bold: true
                color: "white"
            }
            
            RowLayout {
                width: parent.width
                
                Text {
                    text: "Width:"
                    color: "white"
                }
                
                SpinBox {
                    from: 200
                    to: 600
                    value: currentTheme.sideGauges && currentTheme.sideGauges.right ? currentTheme.sideGauges.right.width : 400
                    onValueChanged: {
                        if (!currentTheme.sideGauges) currentTheme.sideGauges = {}
                        if (!currentTheme.sideGauges.right) currentTheme.sideGauges.right = {}
                        currentTheme.sideGauges.right.width = value
                    }
                }
            }
            
            RowLayout {
                width: parent.width
                
                Text {
                    text: "Height:"
                    color: "white"
                }
                
                SpinBox {
                    from: 200
                    to: 600
                    value: currentTheme.sideGauges && currentTheme.sideGauges.right ? currentTheme.sideGauges.right.height : 400
                    onValueChanged: {
                        if (!currentTheme.sideGauges) currentTheme.sideGauges = {}
                        if (!currentTheme.sideGauges.right) currentTheme.sideGauges.right = {}
                        currentTheme.sideGauges.right.height = value
                    }
                }
            }
            
            RowLayout {
                width: parent.width
                
                Text {
                    text: "Accent Color:"
                    color: "white"
                }
                
                TextField {
                    text: currentTheme.sideGauges && currentTheme.sideGauges.right && currentTheme.sideGauges.right.properties ? currentTheme.sideGauges.right.properties.accentColor : "#00E0FF"
                    onEditingFinished: {
                        if (!currentTheme.sideGauges) currentTheme.sideGauges = {}
                        if (!currentTheme.sideGauges.right) currentTheme.sideGauges.right = {}
                        if (!currentTheme.sideGauges.right.properties) currentTheme.sideGauges.right.properties = {}
                        currentTheme.sideGauges.right.properties.accentColor = text
                    }
                }
            }
            
            Button {
                text: "Изменить QML файл"
                onClicked: {
                    fileDialog.selectExisting = true
                    fileDialog.nameFilters = ["QML files (*.qml)"]
                    fileDialog.onAccepted = function() {
                        if (!currentTheme.sideGauges) currentTheme.sideGauges = {}
                        if (!currentTheme.sideGauges.right) currentTheme.sideGauges.right = {}
                        currentTheme.sideGauges.right.qmlPath = fileDialog.fileUrl.toString().replace("file:///", "")
                        if (themeManager.validateWidget("speed", currentTheme.sideGauges.right.qmlPath)) {
                            console.log("Widget validated successfully")
                        } else {
                            console.warn("Widget validation failed")
                        }
                    }
                    fileDialog.open()
                }
            }
        }
    }
    
    // Детали для Warning Icons
    Component {
        id: warningIconsDetails
        
        Column {
            spacing: 10
            
            Text {
                text: "Warning Icons Settings"
                font.pixelSize: 18
                font.bold: true
                color: "white"
            }
            
            RowLayout {
                width: parent.width
                
                Text {
                    text: "Position:"
                    color: "white"
                }
                
                ComboBox {
                    model: ["top", "bottom", "left", "right"]
                    currentIndex: {
                        if (!currentTheme.warningIcons) return 1
                        var pos = currentTheme.warningIcons.position
                        if (pos === "top") return 0
                        if (pos === "bottom") return 1
                        if (pos === "left") return 2
                        return 3
                    }
                    onCurrentIndexChanged: {
                        if (!currentTheme.warningIcons) currentTheme.warningIcons = {}
                        currentTheme.warningIcons.position = model[currentIndex]
                    }
                }
            }
            
            Button {
                text: "Изменить QML файл"
                onClicked: {
                    fileDialog.selectExisting = true
                    fileDialog.nameFilters = ["QML files (*.qml)"]
                    fileDialog.onAccepted = function() {
                        if (!currentTheme.warningIcons) currentTheme.warningIcons = {}
                        currentTheme.warningIcons.qmlPath = fileDialog.fileUrl.toString().replace("file:///", "")
                        if (themeManager.validateWidget("warningIcons", currentTheme.warningIcons.qmlPath)) {
                            console.log("Widget validated successfully")
                        } else {
                            console.warn("Widget validation failed")
                        }
                    }
                    fileDialog.open()
                }
            }
        }
    }
    
    FileDialog {
        id: fileDialog
        title: "Выберите QML файл"
    }
}

