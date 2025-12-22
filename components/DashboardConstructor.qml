import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt.labs.settings
import QtQuick.Window
import QtQml
import QtQuick.Dialogs

ApplicationWindow {
    id: constructorWindow
    width: 1200
    height: 800
    minimumWidth: 1000
    minimumHeight: 700
    title: qsTr("Dashboard Constructor")
    visible: true

    property var vehicleData: null
    property string statusMessage: ""

    // Шаблоны интерфейсов
    property var interfaceTemplates: ({
        "Стандартный": {
            speedGauge: {x: 100, y: 100, width: 200, height: 200},
            rpmGauge: {x: 100, y: 350, width: 200, height: 200},
            centerDisplay: {x: 400, y: 200, width: 400, height: 300}
        },
        "Компактный": {
            speedGauge: {x: 50, y: 50, width: 150, height: 150},
            rpmGauge: {x: 250, y: 50, width: 150, height: 150},
            centerDisplay: {x: 50, y: 250, width: 350, height: 200}
        }
    })

    // Текущий выбранный интерфейс
    property string selectedInterface: "Стандартный"
    property var currentInterface: interfaceTemplates[selectedInterface] || {}

    // Стили для виджетов
    property var widgetStyles: ({
        speedGauge: "",
        rpmGauge: "",
        centerDisplay: ""
    })

    // Виджеты в текущем интерфейсе
    property var interfaceWidgets: ({})

    // Выбранный виджет для настройки
    property string selectedWidget: ""
    property var widgetProperties: ({
        speedGauge: {
            minValue: 0,
            maxValue: 220,
            unit: "km/h",
            title: "Спидометр"
        },
        rpmGauge: {
            minValue: 0,
            maxValue: 8,
            unit: "x1000",
            title: "Тахометр"
        },
        centerDisplay: {
            title: "Информационный дисплей",
            showFuel: true,
            showTemp: true,
            showSpeed: true
        }
    })

    // Файловые диалоги
    FileDialog {
        id: styleFileDialog
        title: "Выберите файл стиля"
        currentFolder: StandardPaths.standardLocations(StandardPaths.HomeLocation)[0]
        nameFilters: ["QML files (*.qml)"]
        onAccepted: loadStyle(selectedWidget, selectedFile)
    }

    FileDialog {
        id: saveConfigDialog
        title: "Сохранить конфигурацию"
        fileMode: FileDialog.SaveFile
        nameFilters: ["JSON files (*.json)"]
        defaultSuffix: "json"
        onAccepted: saveConfiguration(selectedFile)
    }

    FileDialog {
        id: loadConfigDialog
        title: "Загрузить конфигурацию"
        fileMode: FileDialog.OpenFile
        nameFilters: ["JSON files (*.json)"]
        onAccepted: loadConfiguration(selectedFile)
    }

    // Вспомогательные функции
    function showStatus(message) {
        statusMessage = message
        statusTimer.start()
    }

    Timer {
        id: statusTimer
        interval: 3000
        onTriggered: statusMessage = ""
    }

    // Загрузка стиля с валидацией
    function loadStyle(widgetName, stylePath) {
        const component = Qt.createComponent(stylePath)
        if (component.status === Component.Ready) {
            const styleObj = component.createObject(null)
            if (styleObj && styleObj.validateStyle) {
                if (styleObj.validateStyle(styleObj)) {
                    widgetStyles[widgetName] = stylePath
                    showStatus("Стиль успешно загружен")
                } else {
                    showStatus("Ошибка: неверный формат стиля")
                }
            } else {
                showStatus("Ошибка: неверный формат стиля")
            }
            if (styleObj) styleObj.destroy()
        } else {
            showStatus("Ошибка загрузки стиля: " + component.errorString())
        }
    }

    // Добавление виджета в интерфейс
    function addWidgetToInterface(widgetName) {
        if (currentInterface[widgetName]) {
            const template = currentInterface[widgetName]
            interfaceWidgets[widgetName] = {
                x: template.x,
                y: template.y,
                width: template.width,
                height: template.height,
                visible: true,
                style: widgetStyles[widgetName] || "",
                properties: JSON.parse(JSON.stringify(widgetProperties[widgetName] || {}))
            }
            showStatus("Виджет " + widgetName + " добавлен в интерфейс")
        }
    }

    // Удаление виджета из интерфейса
    function removeWidgetFromInterface(widgetName) {
        if (interfaceWidgets[widgetName]) {
            delete interfaceWidgets[widgetName]
            showStatus("Виджет " + widgetName + " удален из интерфейса")
        }
    }

    // Сохранение конфигурации
    function saveConfiguration(filePath) {
        const config = {
            version: "1.0",
            interface: selectedInterface,
            widgets: JSON.parse(JSON.stringify(interfaceWidgets)),
            styles: JSON.parse(JSON.stringify(widgetStyles)),
            properties: JSON.parse(JSON.stringify(widgetProperties))
        }

        const doc = new XMLHttpRequest()
        doc.open("PUT", "file:///" + filePath)
        doc.onreadystatechange = function() {
            if (doc.readyState === XMLHttpRequest.DONE) {
                if (doc.status === 0) {
                    showStatus("Конфигурация сохранена")
                } else {
                    showStatus("Ошибка при сохранении: " + doc.status)
                }
            }
        }
        doc.send(JSON.stringify(config, null, 2))
    }

    // Загрузка конфигурации
    function loadConfiguration(filePath) {
        const doc = new XMLHttpRequest()
        doc.open("GET", "file:///" + filePath)
        doc.onreadystatechange = function() {
            if (doc.readyState === XMLHttpRequest.DONE) {
                if (doc.status === 200) {
                    try {
                        const config = JSON.parse(doc.responseText)
                        selectedInterface = config.interface || "Стандартный"
                        interfaceWidgets = config.widgets || {}
                        Object.assign(widgetStyles, config.styles || {})
                        Object.assign(widgetProperties, config.properties || {})

                        showStatus("Конфигурация загружена")
                    } catch (e) {
                        showStatus("Ошибка разбора файла конфигурации")
                    }
                } else {
                    showStatus("Ошибка при загрузке: " + doc.status)
                }
            }
        }
        doc.send()
    }

    // Создание шаблона стиля
    function downloadStyleTemplate(widgetName) {
        let template = ""

        switch(widgetName) {
        case "speedGauge":
            template = 'import QtQuick 2.15\n\nItem {\n    property real value: 0\n    property real minValue: 0\n    property real maxValue: 220\n    property string unit: "km/h"\n    property string title: "Спидометр"\n    \n    // Добавьте свои стили здесь\n    \n    function validateStyle(style) {\n        const requiredProps = ["value", "minValue", "maxValue", "unit", "title"]\n        for (const prop of requiredProps) {\n            if (style[prop] === undefined) {\n                console.error(`SpeedGauge: Missing required property ${prop}`)\n                return false\n            }\n        }\n        return true\n    }\n}'
            break

        case "rpmGauge":
            template = 'import QtQuick 2.15\n\nItem {\n    property real value: 0\n    property real minValue: 0\n    property real maxValue: 8\n    property string unit: "x1000"\n    property string title: "Тахометр"\n    \n    // Добавьте свои стили здесь\n    \n    function validateStyle(style) {\n        const requiredProps = ["value", "minValue", "maxValue", "unit", "title"]\n        for (const prop of requiredProps) {\n            if (style[prop] === undefined) {\n                console.error(`RpmGauge: Missing required property ${prop}`)\n                return false\n            }\n        }\n        return true\n    }\n}'
            break

        case "centerDisplay":
            template = 'import QtQuick 2.15\n\nItem {\n    // Пример свойств\n    property real speed: 0\n    property real rpm: 0\n    property real fuel: 100\n    property real engineTemp: 90\n    property string title: "Инфо дисплей"\n    property bool showFuel: true\n    property bool showTemp: true\n    property bool showSpeed: true\n    \n    // Добавьте свои стили здесь\n    \n    function validateStyle(style) {\n        // Проверка обязательных свойств\n        const requiredProps = ["speed", "rpm", "fuel", "engineTemp", "title"]\n        for (const prop of requiredProps) {\n            if (style[prop] === undefined) {\n                console.error(`CenterDisplay: Missing required property ${prop}`)\n                return false\n            }\n        }\n        return true\n    }\n}'
            break
        }

        // Сохраняем файл
        const fileName = widgetName + "Style.qml"
        const doc = new XMLHttpRequest()
        doc.open("PUT", "file:///" + fileName)
        doc.onreadystatechange = function() {
            if (doc.readyState === XMLHttpRequest.DONE) {
                if (doc.status === 0) {
                    showStatus("Шаблон сохранен как " + fileName)
                } else {
                    showStatus("Ошибка при сохранении шаблона")
                }
            }
        }
        doc.send(template)
    }

    // Основной интерфейс конструктора
    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        // Панель инструментов
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 50
            color: "#2c3e50"

            RowLayout {
                anchors.fill: parent
                anchors.margins: 5
                spacing: 10

                Button {
                    text: "💾 Сохранить"
                    onClicked: saveConfigDialog.open()
                    ToolTip.visible: hovered
                    ToolTip.text: "Сохранить текущую конфигурацию"
                    palette.button: "#3498db"
                    palette.buttonText: "white"
                }

                Button {
                    text: "📂 Загрузить"
                    onClicked: loadConfigDialog.open()
                    ToolTip.visible: hovered
                    ToolTip.text: "Загрузить сохраненную конфигурацию"
                    palette.button: "#2ecc71"
                    palette.buttonText: "white"
                }

                Item { Layout.fillWidth: true }

                Label {
                    text: statusMessage
                    color: "#f1c40f"
                    visible: statusMessage !== ""
                    font.bold: true
                }
            }
        }

        // TabView для переключения между конструкторами
        TabBar {
            id: tabBar
            Layout.fillWidth: true

            TabButton {
                text: "Конструктор интерфейса"
                width: implicitWidth
            }

            TabButton {
                text: "Конструктор виджетов"
                width: implicitWidth
            }
        }

        StackLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            currentIndex: tabBar.currentIndex

            // ВКЛАДКА 1: Конструктор интерфейса
            ColumnLayout {
                spacing: 0

                // Панель управления интерфейсом
                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 60
                    color: "#ecf0f1"
                    border.color: "#bdc3c7"

                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 10
                        spacing: 15

                        Label {
                            text: "Шаблон интерфейса:"
                            font.bold: true
                        }

                        ComboBox {
                            id: interfaceComboBox
                            model: Object.keys(interfaceTemplates)
                            currentIndex: model.indexOf(selectedInterface)
                            onActivated: {
                                selectedInterface = model[currentIndex]
                                interfaceWidgets = {}
                                showStatus("Выбран шаблон: " + selectedInterface)
                            }
                            Layout.preferredWidth: 200
                        }

                        Button {
                            text: "Очистить интерфейс"
                            onClicked: {
                                interfaceWidgets = {}
                                showStatus("Интерфейс очищен")
                            }
                        }

                        Item { Layout.fillWidth: true }
                    }
                }

                // Основная область конструктора интерфейса
                RowLayout {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    spacing: 0

                    // Панель доступных виджетов (слева)
                    Rectangle {
                        Layout.preferredWidth: 250
                        Layout.fillHeight: true
                        color: "#f8f9fa"
                        border.color: "#dee2e6"
                        border.width: 1

                        ColumnLayout {
                            anchors.fill: parent
                            anchors.margins: 10
                            spacing: 10

                            Label {
                                text: "Доступные виджеты"
                                font.bold: true
                                font.pixelSize: 16
                                Layout.alignment: Qt.AlignHCenter
                            }

                            ScrollView {
                                Layout.fillWidth: true
                                Layout.fillHeight: true

                                ColumnLayout {
                                    width: parent.width
                                    spacing: 10

                                    Repeater {
                                        model: ["speedGauge", "rpmGauge", "centerDisplay"]

                                        Rectangle {
                                            id: widgetItem
                                            Layout.fillWidth: true
                                            Layout.preferredHeight: 80
                                            color: interfaceWidgets[modelData] ? "#d4edda" : "#ffffff"
                                            border.color: interfaceWidgets[modelData] ? "#28a745" : "#ced4da"
                                            border.width: 2
                                            radius: 8

                                            ColumnLayout {
                                                anchors.fill: parent
                                                anchors.margins: 5
                                                spacing: 2

                                                Label {
                                                    text: widgetProperties[modelData]?.title || modelData
                                                    font.bold: true
                                                    Layout.alignment: Qt.AlignHCenter
                                                }

                                                Label {
                                                    text: interfaceWidgets[modelData] ? "✓ В интерфейсе" : "Добавить"
                                                    color: interfaceWidgets[modelData] ? "#28a745" : "#6c757d"
                                                    font.pixelSize: 11
                                                    Layout.alignment: Qt.AlignHCenter
                                                }
                                            }

                                            MouseArea {
                                                anchors.fill: parent
                                                hoverEnabled: true

                                                onClicked: {
                                                    if (interfaceWidgets[modelData]) {
                                                        removeWidgetFromInterface(modelData)
                                                    } else {
                                                        addWidgetToInterface(modelData)
                                                    }
                                                }

                                                onEntered: parent.border.color = "#007bff"
                                                onExited: parent.border.color = interfaceWidgets[modelData] ? "#28a745" : "#ced4da"
                                            }

                                            Drag.active: dragArea.drag.active
                                            Drag.keys: ["widget"]
                                            Drag.mimeData: { "widget": modelData }

                                            MouseArea {
                                                id: dragArea
                                                anchors.fill: parent
                                                drag.target: widgetItem

                                                onPressed: {
                                                    widgetItem.Drag.active = true
                                                    widgetItem.opacity = 0.7
                                                }

                                                onReleased: {
                                                    widgetItem.Drag.drop()
                                                    widgetItem.Drag.active = false
                                                    widgetItem.opacity = 1.0
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }

                    // Область предпросмотра интерфейса (центр)
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#f5f5f5"

                        DropArea {
                            id: interfaceDropArea
                            anchors.fill: parent
                            keys: ["widget"]

                            onDropped: {
                                const widgetName = drop.getDataAsString("widget")
                                if (widgetName && !interfaceWidgets[widgetName]) {
                                    addWidgetToInterface(widgetName)
                                }
                            }

                            Rectangle {
                                anchors.fill: parent
                                anchors.margins: 20
                                color: "transparent"
                                border.color: "#adb5bd"
                                border.width: 2
                                // Добавляем пунктирную линию через Canvas
                                    Canvas {
                                        anchors.fill: parent
                                        onPaint: {
                                            var ctx = getContext("2d")
                                            ctx.strokeStyle = "#adb5bd"
                                            ctx.lineWidth = 2
                                            ctx.setLineDash([5, 5]) // Пунктир: 5px черта, 5px пропуск

                                            ctx.beginPath()
                                            ctx.rect(0, 0, width, height)
                                            ctx.stroke()
                                        }
                                    }

                                Label {
                                    anchors.centerIn: parent
                                    text: "Перетащите виджеты сюда\nили нажмите на виджет для добавления"
                                    color: "#6c757d"
                                    font.italic: true
                                    horizontalAlignment: Text.AlignHCenter
                                    visible: Object.keys(interfaceWidgets).length === 0
                                }

                                // Отображение виджетов в интерфейсе
                                Repeater {
                                    model: Object.keys(interfaceWidgets)

                                    Rectangle {
                                        id: widgetPreview
                                        x: interfaceWidgets[modelData].x
                                        y: interfaceWidgets[modelData].y
                                        width: interfaceWidgets[modelData].width
                                        height: interfaceWidgets[modelData].height
                                        color: selectedWidget === modelData ? "#e3f2fd" : "#ffffff"
                                        border.color: selectedWidget === modelData ? "#2196f3" : "#b0bec5"
                                        border.width: selectedWidget === modelData ? 3 : 1
                                        radius: 5

                                        // Заголовок виджета
                                        Rectangle {
                                            width: parent.width
                                            height: 25
                                            color: selectedWidget === modelData ? "#2196f3" : "#607d8b"
                                            radius: 5

                                            Label {
                                                anchors.centerIn: parent
                                                text: widgetProperties[modelData]?.title || modelData
                                                color: "white"
                                                font.bold: true
                                            }

                                            MouseArea {
                                                anchors.fill: parent
                                                drag.target: widgetPreview
                                                drag.axis: Drag.XAndYAxis

                                                onClicked: selectedWidget = modelData

                                                onReleased: {
                                                    if (interfaceWidgets[modelData]) {
                                                        interfaceWidgets[modelData].x = widgetPreview.x
                                                        interfaceWidgets[modelData].y = widgetPreview.y
                                                    }
                                                }
                                            }
                                        }

                                        // Содержимое виджета (предпросмотр)
                                        Rectangle {
                                            anchors.fill: parent
                                            anchors.topMargin: 25
                                            color: "transparent"

                                            Label {
                                                anchors.centerIn: parent
                                                text: "Предпросмотр " + modelData
                                                color: "#78909c"
                                                font.italic: true
                                            }
                                        }

                                        // Угловые маркеры для изменения размера
                                        Rectangle {
                                            x: parent.width - 10
                                            y: parent.height - 10
                                            width: 10
                                            height: 10
                                            color: "#2196f3"
                                            radius: 2

                                            MouseArea {
                                                anchors.fill: parent
                                                cursorShape: Qt.SizeFDiagCursor

                                                drag.target: parent
                                                drag.axis: Drag.XAndYAxis
                                                drag.minimumX: 50
                                                drag.minimumY: 50

                                                onPositionChanged: {
                                                    if (drag.active) {
                                                        widgetPreview.width = Math.max(50, widgetPreview.width + mouse.x)
                                                        widgetPreview.height = Math.max(50, widgetPreview.height + mouse.y)
                                                    }
                                                }

                                                onReleased: {
                                                    if (interfaceWidgets[modelData]) {
                                                        interfaceWidgets[modelData].width = widgetPreview.width
                                                        interfaceWidgets[modelData].height = widgetPreview.height
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }

                    // Панель свойств виджета в интерфейсе (справа)
                    Rectangle {
                        Layout.preferredWidth: 300
                        Layout.fillHeight: true
                        color: "#f8f9fa"
                        border.color: "#dee2e6"
                        border.width: 1
                        visible: selectedWidget !== "" && interfaceWidgets[selectedWidget]

                        ColumnLayout {
                            anchors.fill: parent
                            anchors.margins: 10
                            spacing: 10

                            Label {
                                text: "Свойства виджета"
                                font.bold: true
                                font.pixelSize: 16
                                Layout.alignment: Qt.AlignHCenter
                            }

                            ScrollView {
                                Layout.fillWidth: true
                                Layout.fillHeight: true

                                ColumnLayout {
                                    width: parent.width
                                    spacing: 10

                                    GroupBox {
                                        title: "Позиция и размер"
                                        Layout.fillWidth: true

                                        GridLayout {
                                            columns: 2
                                            columnSpacing: 10
                                            rowSpacing: 5
                                            width: parent.width

                                            Label { text: "X:" }
                                            SpinBox {
                                                Layout.fillWidth: true
                                                value: interfaceWidgets[selectedWidget]?.x || 0
                                                onValueModified: if (interfaceWidgets[selectedWidget]) interfaceWidgets[selectedWidget].x = value
                                            }

                                            Label { text: "Y:" }
                                            SpinBox {
                                                Layout.fillWidth: true
                                                value: interfaceWidgets[selectedWidget]?.y || 0
                                                onValueModified: if (interfaceWidgets[selectedWidget]) interfaceWidgets[selectedWidget].y = value
                                            }

                                            Label { text: "Ширина:" }
                                            SpinBox {
                                                Layout.fillWidth: true
                                                value: interfaceWidgets[selectedWidget]?.width || 100
                                                onValueModified: if (interfaceWidgets[selectedWidget]) interfaceWidgets[selectedWidget].width = value
                                                from: 50
                                                to: 500
                                            }

                                            Label { text: "Высота:" }
                                            SpinBox {
                                                Layout.fillWidth: true
                                                value: interfaceWidgets[selectedWidget]?.height || 100
                                                onValueModified: if (interfaceWidgets[selectedWidget]) interfaceWidgets[selectedWidget].height = value
                                                from: 50
                                                to: 500
                                            }
                                        }
                                    }

                                    GroupBox {
                                        title: "Стиль"
                                        Layout.fillWidth: true

                                        ColumnLayout {
                                            width: parent.width
                                            spacing: 5

                                            Label {
                                                text: "Текущий стиль:"
                                                font.pixelSize: 11
                                                color: "#6c757d"
                                            }

                                            TextField {
                                                Layout.fillWidth: true
                                                text: widgetStyles[selectedWidget] || ""
                                                placeholderText: "Путь к файлу стиля"
                                                readOnly: true
                                            }

                                            Button {
                                                text: "Выбрать стиль"
                                                onClicked: styleFileDialog.open()
                                                Layout.fillWidth: true
                                            }

                                            Button {
                                                text: "Очистить стиль"
                                                onClicked: {
                                                    widgetStyles[selectedWidget] = ""
                                                    showStatus("Стиль очищен")
                                                }
                                                Layout.fillWidth: true
                                            }
                                        }
                                    }

                                    GroupBox {
                                        title: "Управление"
                                        Layout.fillWidth: true

                                        ColumnLayout {
                                            width: parent.width
                                            spacing: 5

                                            CheckBox {
                                                text: "Видимый"
                                                checked: interfaceWidgets[selectedWidget]?.visible || true
                                                onCheckedChanged: if (interfaceWidgets[selectedWidget]) interfaceWidgets[selectedWidget].visible = checked
                                            }

                                            Button {
                                                text: "Удалить из интерфейса"
                                                palette.button: "#dc3545"
                                                palette.buttonText: "white"
                                                onClicked: removeWidgetFromInterface(selectedWidget)
                                                Layout.fillWidth: true
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            // ВКЛАДКА 2: Конструктор виджетов
            ColumnLayout {
                spacing: 0

                // Основная область конструктора виджетов
                RowLayout {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    spacing: 0

                    // Список виджетов для редактирования (слева)
                    Rectangle {
                        Layout.preferredWidth: 250
                        Layout.fillHeight: true
                        color: "#f8f9fa"
                        border.color: "#dee2e6"
                        border.width: 1

                        ColumnLayout {
                            anchors.fill: parent
                            anchors.margins: 10
                            spacing: 10

                            Label {
                                text: "Редактировать виджет"
                                font.bold: true
                                font.pixelSize: 16
                                Layout.alignment: Qt.AlignHCenter
                            }

                            ListView {
                                id: widgetEditList
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                model: ["speedGauge", "rpmGauge", "centerDisplay"]
                                spacing: 5

                                delegate: Rectangle {
                                    id: editDelegate
                                    width: parent.width
                                    height: 60
                                    color: selectedWidget === modelData ? "#e3f2fd" : "#ffffff"
                                    border.color: selectedWidget === modelData ? "#2196f3" : "#ced4da"
                                    border.width: selectedWidget === modelData ? 2 : 1
                                    radius: 5

                                    ColumnLayout {
                                        anchors.fill: parent
                                        anchors.margins: 5
                                        spacing: 2

                                        Label {
                                            text: widgetProperties[modelData]?.title || modelData
                                            font.bold: true
                                            Layout.alignment: Qt.AlignHCenter
                                        }

                                        Label {
                                            text: "Нажмите для редактирования"
                                            color: "#6c757d"
                                            font.pixelSize: 10
                                            Layout.alignment: Qt.AlignHCenter
                                        }
                                    }

                                    MouseArea {
                                        anchors.fill: parent
                                        onClicked: selectedWidget = modelData
                                    }
                                }
                            }
                        }
                    }

                    // Область редактирования виджета (центр)
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#ffffff"

                        ColumnLayout {
                            anchors.fill: parent
                            anchors.margins: 20
                            spacing: 15

                            Label {
                                text: "Редактирование: " + (selectedWidget ? widgetProperties[selectedWidget]?.title || selectedWidget : "Выберите виджет")
                                font.bold: true
                                font.pixelSize: 18
                                color: "#2c3e50"
                                Layout.alignment: Qt.AlignHCenter
                            }

                            // Предпросмотр виджета
                            Rectangle {
                                Layout.fillWidth: true
                                Layout.preferredHeight: 250
                                color: "#f8f9fa"
                                border.color: "#dee2e6"
                                border.width: 2
                                radius: 8

                                Label {
                                    anchors.centerIn: parent
                                    text: "Предпросмотр виджета\n" + (selectedWidget || "")
                                    color: "#6c757d"
                                    font.italic: true
                                    horizontalAlignment: Text.AlignHCenter
                                    visible: !selectedWidget
                                }

                                // Здесь можно добавить реальный предпросмотр виджета
                                Rectangle {
                                    anchors.centerIn: parent
                                    width: 200
                                    height: 200
                                    color: "#e9ecef"
                                    radius: 100
                                    border.color: "#adb5bd"
                                    border.width: 3
                                    visible: selectedWidget && (selectedWidget === "speedGauge" || selectedWidget === "rpmGauge")

                                    Label {
                                        anchors.centerIn: parent
                                        text: (widgetProperties[selectedWidget]?.minValue || 0) + "-" +
                                              (widgetProperties[selectedWidget]?.maxValue || 100) + "\n" +
                                              (widgetProperties[selectedWidget]?.unit || "")
                                        font.bold: true
                                        horizontalAlignment: Text.AlignHCenter
                                    }
                                }

                                Rectangle {
                                    anchors.centerIn: parent
                                    width: 300
                                    height: 200
                                    color: "#e9ecef"
                                    radius: 10
                                    border.color: "#adb5bd"
                                    border.width: 2
                                    visible: selectedWidget && selectedWidget === "centerDisplay"

                                    ColumnLayout {
                                        anchors.fill: parent
                                        anchors.margins: 10
                                        spacing: 5

                                        Label {
                                            text: widgetProperties.centerDisplay?.title || "Инфо дисплей"
                                            font.bold: true
                                            Layout.alignment: Qt.AlignHCenter
                                        }

                                        Rectangle {
                                            Layout.fillWidth: true
                                            Layout.preferredHeight: 1
                                            color: "#adb5bd"
                                        }

                                        Label {
                                            text: "Скорость: 0 км/ч"
                                            visible: widgetProperties.centerDisplay?.showSpeed || true
                                        }

                                        Label {
                                            text: "Обороты: 0"
                                            visible: widgetProperties.centerDisplay?.showSpeed || true
                                        }

                                        Label {
                                            text: "Топливо: 100%"
                                            visible: widgetProperties.centerDisplay?.showFuel || true
                                        }

                                        Label {
                                            text: "Температура: 90°C"
                                            visible: widgetProperties.centerDisplay?.showTemp || true
                                        }
                                    }
                                }
                            }

                            // Редактирование свойств виджета
                            ScrollView {
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                visible: selectedWidget !== ""

                                ColumnLayout {
                                    width: parent.width
                                    spacing: 10

                                    GroupBox {
                                        title: "Основные свойства"
                                        Layout.fillWidth: true

                                        ColumnLayout {
                                            width: parent.width
                                            spacing: 10

                                            Repeater {
                                                model: widgetProperties[selectedWidget] ? Object.keys(widgetProperties[selectedWidget]) : []

                                                RowLayout {
                                                    width: parent.width
                                                    spacing: 10

                                                    Label {
                                                        text: modelData + ":"
                                                        Layout.preferredWidth: 150
                                                    }

                                                    Loader {
                                                        Layout.fillWidth: true
                                                        sourceComponent: {
                                                            const props = widgetProperties[selectedWidget]
                                                            const value = props[modelData]
                                                            if (typeof value === "number") return numberEditor
                                                            if (typeof value === "string") return textEditor
                                                            if (typeof value === "boolean") return boolEditor
                                                            return null
                                                        }
                                                        property string propName: modelData
                                                        property var propValue: widgetProperties[selectedWidget][modelData]
                                                        onPropValueChanged: {
                                                            if (propValue !== undefined) {
                                                                widgetProperties[selectedWidget][propName] = propValue
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }

                                    GroupBox {
                                        title: "Управление стилями"
                                        Layout.fillWidth: true

                                        ColumnLayout {
                                            width: parent.width
                                            spacing: 10

                                            Button {
                                                text: "📂 Загрузить стиль из файла"
                                                onClicked: styleFileDialog.open()
                                                Layout.fillWidth: true
                                            }

                                            Button {
                                                text: "📥 Скачать шаблон стиля"
                                                onClicked: downloadStyleTemplate(selectedWidget)
                                                Layout.fillWidth: true
                                            }

                                            Label {
                                                text: "Текущий стиль:"
                                                font.pixelSize: 11
                                                color: "#6c757d"
                                            }

                                            TextArea {
                                                Layout.fillWidth: true
                                                Layout.preferredHeight: 80
                                                text: widgetStyles[selectedWidget] || "Стиль не выбран"
                                                readOnly: true
                                                wrapMode: Text.WordWrap
                                                font.pixelSize: 10
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    // Компоненты для редакторов свойств
    Component {
        id: numberEditor

        SpinBox {
            value: propValue
            onValueModified: propValue = value
            from: -9999
            to: 9999
        }
    }

    Component {
        id: textEditor

        TextField {
            text: propValue
            onTextChanged: propValue = text
        }
    }

    Component {
        id: boolEditor

        CheckBox {
            checked: propValue
            onCheckedChanged: propValue = checked
        }
    }
}
