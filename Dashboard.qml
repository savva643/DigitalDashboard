import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "./components" as Components

Item {
    id: dashboard

    // Splash screen properties
    property bool splashVisible: true
    property bool dashboardVisible: false

    // Theme configuration
    property var themeConfig: themeManager.currentTheme
    
    // Layout properties from theme
    property real refWidth: themeConfig.layout ? themeConfig.layout.refWidth : 1300
    property real refHeight: themeConfig.layout ? themeConfig.layout.refHeight : 700
    property real refGaugeSize: themeConfig.layout ? themeConfig.layout.refGaugeSize : 400
    property real refCenterWidth: themeConfig.layout ? themeConfig.layout.refCenterWidth : 400
    property real refCenterHeight: themeConfig.layout ? themeConfig.layout.refCenterHeight : 440

    // Current scale factor
    property real dashboardScale: 1.0
    property real minScale: themeConfig.layout ? themeConfig.layout.minScale : 0.5

    property bool leftSignalActive: vehicleData.leftSignalActive
    property bool rightSignalActive: vehicleData.rightSignalActive

    // Loader для динамической загрузки виджетов
    property Component constructorComponent: null
    property var layoutConfig: themeConfig.layoutConfig || {}

    // Обновление конфигурации при изменении темы
    Connections {
        target: themeManager
        function onCurrentThemeChanged() {
            themeConfig = themeManager.currentTheme
            layoutConfig = themeConfig.layoutConfig || {}
            applyTheme()
        }
    }

    function applyTheme() {
        // Обновляем размеры
        refWidth = themeConfig.layout ? themeConfig.layout.refWidth : 1300
        refHeight = themeConfig.layout ? themeConfig.layout.refHeight : 700
        refGaugeSize = themeConfig.layout ? themeConfig.layout.refGaugeSize : 400
        refCenterWidth = themeConfig.layout ? themeConfig.layout.refCenterWidth : 400
        refCenterHeight = themeConfig.layout ? themeConfig.layout.refCenterHeight : 440
        minScale = themeConfig.layout ? themeConfig.layout.minScale : 0.5
        
        // Пересоздаем виджеты
        recreateWidgets()
    }

    function recreateWidgets() {
        // Удаляем старые виджеты
        if (statusBarLoader.item) statusBarLoader.item.destroy()
        if (centerDisplayLoader.item) centerDisplayLoader.item.destroy()
        if (leftGaugeLoader.item) leftGaugeLoader.item.destroy()
        if (rightGaugeLoader.item) rightGaugeLoader.item.destroy()
        if (warningIconsLoader.item) warningIconsLoader.item.destroy()
        
        // Создаем новые виджеты из темы
        statusBarLoader.source = themeConfig.statusBar && themeConfig.statusBar.enabled ? 
            themeConfig.statusBar.qmlPath : ""
        centerDisplayLoader.source = themeConfig.centerDisplay && themeConfig.centerDisplay.enabled ? 
            themeConfig.centerDisplay.qmlPath : ""
        leftGaugeLoader.source = themeConfig.sideGauges && themeConfig.sideGauges.left && themeConfig.sideGauges.left.enabled ? 
            themeConfig.sideGauges.left.qmlPath : ""
        rightGaugeLoader.source = themeConfig.sideGauges && themeConfig.sideGauges.right && themeConfig.sideGauges.right.enabled ? 
            themeConfig.sideGauges.right.qmlPath : ""
        warningIconsLoader.source = themeConfig.warningIcons && themeConfig.warningIcons.enabled ? 
            themeConfig.warningIcons.qmlPath : ""
    }

    function openConstructor() {
        if (!constructorComponent) {
            constructorComponent = Qt.createComponent("components/DashboardConstructor.qml")
        }
        if (constructorComponent.status === Component.Ready) {
            var constructor = constructorComponent.createObject(dashboard, {
                vehicleData: vehicleData
            })
            constructor.show()
        } else {
            console.error("Failed to load constructor:", constructorComponent.errorString())
        }
    }

    Component.onCompleted: {
        // Загружаем тему по умолчанию
        if (themeManager.currentThemePath === "") {
            themeManager.loadTheme("default.json")
        }
        themeConfig = themeManager.currentTheme
        layoutConfig = themeConfig.layoutConfig || {}
        applyTheme()
        updateScale()
        splashAnimation.start()
    }

    // Splash Screen
    Rectangle {
        id: splashScreen
        anchors.fill: parent
        color: "#121212"
        visible: splashVisible
        z: 10

        Image {
            id: logo
            source: "qrc:/image/logo.png"
            anchors.centerIn: parent
            fillMode: Image.PreserveAspectFit
            width: 300
            height: 300
            opacity: 0
        }

        Text {
            id: poweredByText
            text: "Powered by Keep Pixel"
            color: "white"
            anchors {
                bottom: parent.bottom
                bottomMargin: 50
                horizontalCenter: parent.horizontalCenter
            }
            font.pixelSize: 24
            opacity: 0
        }

        SequentialAnimation {
            id: splashAnimation
            running: splashVisible

            ParallelAnimation {
                NumberAnimation {
                    target: logo
                    property: "opacity"
                    from: 0
                    to: 1
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }
                NumberAnimation {
                    target: logo
                    property: "scale"
                    from: 0.8
                    to: 1
                    duration: 1000
                }
            }

            PauseAnimation { duration: 500 }

            NumberAnimation {
                target: poweredByText
                property: "opacity"
                from: 0
                to: 1
                duration: 800
            }

            PauseAnimation { duration: 1500 }

            ParallelAnimation {
                NumberAnimation {
                    target: splashScreen
                    property: "opacity"
                    from: 1
                    to: 0
                    duration: 800
                }
                NumberAnimation {
                    target: logo
                    property: "scale"
                    from: 1
                    to: 1.2
                    duration: 800
                }
            }

            ScriptAction {
                script: {
                    splashVisible = false
                    dashboardVisible = true
                }
            }
        }
    }

    // Menu Button
    Components.MenuButton {
        id: menuButton
        anchors {
            top: parent.top
            right: parent.right
            margins: 20
        }
        z: 100
        onClicked: dashboard.openConstructor()
    }

    // Status Bar Loader
    Loader {
        id: statusBarLoader
        anchors {
            left: layoutConfig.statusBar && layoutConfig.statusBar.anchors && layoutConfig.statusBar.anchors.left ? parent.left : undefined
            right: layoutConfig.statusBar && layoutConfig.statusBar.anchors && layoutConfig.statusBar.anchors.right ? parent.right : undefined
            top: (layoutConfig.statusBar && layoutConfig.statusBar.anchors && layoutConfig.statusBar.anchors.top) || 
                 (themeConfig.statusBar && themeConfig.statusBar.position === "top") ? parent.top : undefined
            bottom: (layoutConfig.statusBar && layoutConfig.statusBar.anchors && layoutConfig.statusBar.anchors.bottom) || 
                    (themeConfig.statusBar && themeConfig.statusBar.position === "bottom") ? parent.bottom : undefined
            horizontalCenter: layoutConfig.statusBar && layoutConfig.statusBar.anchors && layoutConfig.statusBar.anchors.horizontalCenter ? parent.horizontalCenter : undefined
            margins: layoutConfig.statusBar && layoutConfig.statusBar.anchors && layoutConfig.statusBar.anchors.margins ? layoutConfig.statusBar.anchors.margins : 15
        }
        x: layoutConfig.statusBar && layoutConfig.statusBar.customPosition ? layoutConfig.statusBar.customPosition.x : undefined
        y: layoutConfig.statusBar && layoutConfig.statusBar.customPosition ? layoutConfig.statusBar.customPosition.y : undefined
        onLoaded: {
            if (item && item.hasOwnProperty("position")) {
                var pos = layoutConfig.statusBar && layoutConfig.statusBar.position ? 
                         layoutConfig.statusBar.position : 
                         (themeConfig.statusBar ? themeConfig.statusBar.position : "top")
                item.position = pos
            }
        }
    }

    // Основной интерфейс dashboard с масштабированием
    Item {
        id: dashboardContent
        anchors.centerIn: parent
        width: refWidth * dashboardScale
        height: refHeight * dashboardScale
        scale: dashboardScale
        transformOrigin: Item.Center
        visible: dashboardVisible
        opacity: dashboardVisible ? 1 : 0

        // Center Display Loader
        Loader {
            id: centerDisplayLoader
            width: themeConfig.centerDisplay && themeConfig.centerDisplay.width ? themeConfig.centerDisplay.width : refCenterWidth
            height: themeConfig.centerDisplay && themeConfig.centerDisplay.height ? themeConfig.centerDisplay.height : refCenterHeight
            anchors.centerIn: (layoutConfig.centerDisplay && layoutConfig.centerDisplay.anchors && layoutConfig.centerDisplay.anchors.centerIn) ? parent : undefined
            anchors.horizontalCenter: layoutConfig.centerDisplay && layoutConfig.centerDisplay.anchors && layoutConfig.centerDisplay.anchors.horizontalCenter ? parent.horizontalCenter : undefined
            anchors.verticalCenter: layoutConfig.centerDisplay && layoutConfig.centerDisplay.anchors && layoutConfig.centerDisplay.anchors.verticalCenter ? parent.verticalCenter : undefined
            x: layoutConfig.centerDisplay && layoutConfig.centerDisplay.customPosition ? layoutConfig.centerDisplay.customPosition.x : undefined
            y: layoutConfig.centerDisplay && layoutConfig.centerDisplay.customPosition ? layoutConfig.centerDisplay.customPosition.y : undefined
            z: 1
            onLoaded: {
                if (item && themeConfig.centerDisplay) {
                    if (themeConfig.centerDisplay.width) item.width = themeConfig.centerDisplay.width
                    if (themeConfig.centerDisplay.height) item.height = themeConfig.centerDisplay.height
                }
            }
        }

        // Left Gauge Loader
        Loader {
            id: leftGaugeLoader
            anchors {
                verticalCenter: (layoutConfig.leftGauge && layoutConfig.leftGauge.anchors && layoutConfig.leftGauge.anchors.verticalCenter) ? parent.verticalCenter : undefined
                horizontalCenter: layoutConfig.leftGauge && layoutConfig.leftGauge.anchors && layoutConfig.leftGauge.anchors.horizontalCenter ? parent.horizontalCenter : undefined
                right: (layoutConfig.leftGauge && layoutConfig.leftGauge.anchors && layoutConfig.leftGauge.anchors.right === "centerDisplay") ? centerDisplayLoader.left : 
                       (layoutConfig.leftGauge && layoutConfig.leftGauge.anchors && layoutConfig.leftGauge.anchors.right === true) ? parent.right : undefined
                left: layoutConfig.leftGauge && layoutConfig.leftGauge.anchors && layoutConfig.leftGauge.anchors.left ? parent.left : undefined
                top: layoutConfig.leftGauge && layoutConfig.leftGauge.anchors && layoutConfig.leftGauge.anchors.top === "centerDisplay" ? centerDisplayLoader.bottom :
                     layoutConfig.leftGauge && layoutConfig.leftGauge.anchors && layoutConfig.leftGauge.anchors.top ? parent.top : undefined
                bottom: layoutConfig.leftGauge && layoutConfig.leftGauge.anchors && layoutConfig.leftGauge.anchors.bottom === "centerDisplay" ? centerDisplayLoader.top :
                        layoutConfig.leftGauge && layoutConfig.leftGauge.anchors && layoutConfig.leftGauge.anchors.bottom ? parent.bottom : undefined
                rightMargin: layoutConfig.leftGauge && layoutConfig.leftGauge.anchors && layoutConfig.leftGauge.anchors.rightMargin ? 
                            layoutConfig.leftGauge.anchors.rightMargin : 20 * dashboardScale
                leftMargin: layoutConfig.leftGauge && layoutConfig.leftGauge.anchors && layoutConfig.leftGauge.anchors.leftMargin ? 
                           layoutConfig.leftGauge.anchors.leftMargin : undefined
                topMargin: layoutConfig.leftGauge && layoutConfig.leftGauge.anchors && layoutConfig.leftGauge.anchors.topMargin ? 
                           layoutConfig.leftGauge.anchors.topMargin : undefined
                bottomMargin: layoutConfig.leftGauge && layoutConfig.leftGauge.anchors && layoutConfig.leftGauge.anchors.bottomMargin ? 
                             layoutConfig.leftGauge.anchors.bottomMargin : undefined
            }
            x: layoutConfig.leftGauge && layoutConfig.leftGauge.customPosition ? layoutConfig.leftGauge.customPosition.x : undefined
            y: layoutConfig.leftGauge && layoutConfig.leftGauge.customPosition ? layoutConfig.leftGauge.customPosition.y : undefined
            z: 2
            onLoaded: {
                if (item && themeConfig.sideGauges && themeConfig.sideGauges.left) {
                    var props = themeConfig.sideGauges.left.properties || {}
                    var gaugeConfig = themeConfig.sideGauges.left
                    
                    if (gaugeConfig.width) item.width = gaugeConfig.width
                    if (gaugeConfig.height) item.height = gaugeConfig.height
                    if (props.minValue !== undefined) item.minValue = props.minValue
                    if (props.maxValue !== undefined) item.maxValue = props.maxValue
                    if (props.unit) item.unit = props.unit
                    if (props.label) item.label = props.label
                    if (props.accentColor) item.accentColor = props.accentColor
                    if (props.dangerThreshold !== undefined) item.dangerThreshold = props.dangerThreshold
                    
                    // Привязка данных
                    if (gaugeConfig.dataBinding) {
                        var binding = gaugeConfig.dataBinding
                        if (binding === "vehicleData.rpm") item.value = vehicleData.rpm
                        else if (binding === "vehicleData.speed") item.value = vehicleData.speed
                    }
                }
            }
        }

        // Right Gauge Loader
        Loader {
            id: rightGaugeLoader
            anchors {
                verticalCenter: (layoutConfig.rightGauge && layoutConfig.rightGauge.anchors && layoutConfig.rightGauge.anchors.verticalCenter) ? parent.verticalCenter : undefined
                horizontalCenter: layoutConfig.rightGauge && layoutConfig.rightGauge.anchors && layoutConfig.rightGauge.anchors.horizontalCenter ? parent.horizontalCenter : undefined
                left: (layoutConfig.rightGauge && layoutConfig.rightGauge.anchors && layoutConfig.rightGauge.anchors.left === "centerDisplay") ? centerDisplayLoader.right : 
                      (layoutConfig.rightGauge && layoutConfig.rightGauge.anchors && layoutConfig.rightGauge.anchors.left === true) ? parent.left : undefined
                right: layoutConfig.rightGauge && layoutConfig.rightGauge.anchors && layoutConfig.rightGauge.anchors.right ? parent.right : undefined
                top: layoutConfig.rightGauge && layoutConfig.rightGauge.anchors && layoutConfig.rightGauge.anchors.top === "centerDisplay" ? centerDisplayLoader.bottom :
                     layoutConfig.rightGauge && layoutConfig.rightGauge.anchors && layoutConfig.rightGauge.anchors.top ? parent.top : undefined
                bottom: layoutConfig.rightGauge && layoutConfig.rightGauge.anchors && layoutConfig.rightGauge.anchors.bottom === "centerDisplay" ? centerDisplayLoader.top :
                        layoutConfig.rightGauge && layoutConfig.rightGauge.anchors && layoutConfig.rightGauge.anchors.bottom ? parent.bottom : undefined
                leftMargin: layoutConfig.rightGauge && layoutConfig.rightGauge.anchors && layoutConfig.rightGauge.anchors.leftMargin ? 
                           layoutConfig.rightGauge.anchors.leftMargin : 20 * dashboardScale
                rightMargin: layoutConfig.rightGauge && layoutConfig.rightGauge.anchors && layoutConfig.rightGauge.anchors.rightMargin ? 
                            layoutConfig.rightGauge.anchors.rightMargin : undefined
                topMargin: layoutConfig.rightGauge && layoutConfig.rightGauge.anchors && layoutConfig.rightGauge.anchors.topMargin ? 
                          layoutConfig.rightGauge.anchors.topMargin : undefined
                bottomMargin: layoutConfig.rightGauge && layoutConfig.rightGauge.anchors && layoutConfig.rightGauge.anchors.bottomMargin ? 
                             layoutConfig.rightGauge.anchors.bottomMargin : undefined
            }
            x: layoutConfig.rightGauge && layoutConfig.rightGauge.customPosition ? layoutConfig.rightGauge.customPosition.x : undefined
            y: layoutConfig.rightGauge && layoutConfig.rightGauge.customPosition ? layoutConfig.rightGauge.customPosition.y : undefined
            z: 2
            onLoaded: {
                if (item && themeConfig.sideGauges && themeConfig.sideGauges.right) {
                    var props = themeConfig.sideGauges.right.properties || {}
                    var gaugeConfig = themeConfig.sideGauges.right
                    
                    if (gaugeConfig.width) item.width = gaugeConfig.width
                    if (gaugeConfig.height) item.height = gaugeConfig.height
                    if (props.minValue !== undefined) item.minValue = props.minValue
                    if (props.maxValue !== undefined) item.maxValue = props.maxValue
                    if (props.unit) item.unit = props.unit
                    if (props.label) item.label = props.label
                    if (props.accentColor) item.accentColor = props.accentColor
                    if (props.dangerThreshold !== undefined) item.dangerThreshold = props.dangerThreshold
                    
                    // Привязка данных
                    if (gaugeConfig.dataBinding) {
                        var binding = gaugeConfig.dataBinding
                        if (binding === "vehicleData.rpm") item.value = vehicleData.rpm
                        else if (binding === "vehicleData.speed") item.value = vehicleData.speed
                    }
                }
            }
        }
    }

    // Warning Icons Loader
    Loader {
        id: warningIconsLoader
        width: parent.width
        anchors {
            horizontalCenter: (layoutConfig.warningIcons && layoutConfig.warningIcons.anchors && layoutConfig.warningIcons.anchors.horizontalCenter) ? parent.horizontalCenter : undefined
            verticalCenter: layoutConfig.warningIcons && layoutConfig.warningIcons.anchors && layoutConfig.warningIcons.anchors.verticalCenter ? parent.verticalCenter : undefined
            bottom: (layoutConfig.warningIcons && layoutConfig.warningIcons.anchors && layoutConfig.warningIcons.anchors.bottom) || 
                   (themeConfig.warningIcons && themeConfig.warningIcons.position === "bottom") ? dashboardContent.bottom : undefined
            top: (layoutConfig.warningIcons && layoutConfig.warningIcons.anchors && layoutConfig.warningIcons.anchors.top) || 
                 (themeConfig.warningIcons && themeConfig.warningIcons.position === "top") ? parent.top : undefined
            left: (layoutConfig.warningIcons && layoutConfig.warningIcons.anchors && layoutConfig.warningIcons.anchors.left) || 
                  (themeConfig.warningIcons && themeConfig.warningIcons.position === "left") ? parent.left : undefined
            right: (layoutConfig.warningIcons && layoutConfig.warningIcons.anchors && layoutConfig.warningIcons.anchors.right) || 
                   (themeConfig.warningIcons && themeConfig.warningIcons.position === "right") ? parent.right : undefined
        }
        x: layoutConfig.warningIcons && layoutConfig.warningIcons.customPosition ? layoutConfig.warningIcons.customPosition.x : undefined
        y: layoutConfig.warningIcons && layoutConfig.warningIcons.customPosition ? layoutConfig.warningIcons.customPosition.y : undefined
        onLoaded: {
            if (item && item.hasOwnProperty("position")) {
                var pos = layoutConfig.warningIcons && layoutConfig.warningIcons.position ? 
                         layoutConfig.warningIcons.position : 
                         (themeConfig.warningIcons ? themeConfig.warningIcons.position : "bottom")
                item.position = pos
            }
        }
    }

    // Функция для обновления масштаба
    function updateScale() {
        var widthRatio = width / refWidth
        var heightRatio = height / refHeight
        var newScale = Math.min(widthRatio, heightRatio)
        dashboardScale = Math.max(minScale, newScale)
    }

    onWidthChanged: updateScale()
    onHeightChanged: updateScale()
}
