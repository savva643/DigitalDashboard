import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "./components" as Components

Item {
    id: dashboard

    // Splash screen properties
    property bool splashVisible: true
    property bool dashboardVisible: false

    // Original layout dimensions (reference sizes)
    property real refWidth: 1300  // Reference width for design
    property real refHeight: 700  // Reference height for design
    property real refGaugeSize: 400
    property real refCenterWidth: 400
    property real refCenterHeight: 440

    // Current scale factor
    property real dashboardScale: 1.0
    property real minScale: 0.5   // Minimum allowed scale

    property alias statusBarPosition: statusBar.position
    property alias warningsPosition: warningIcons.position

    property bool leftSignalActive: vehicleData.leftSignalActive
    property bool rightSignalActive: vehicleData.rightSignalActive


    // Splash Screen
    Rectangle {
        id: splashScreen
        anchors.fill: parent
        color: "#121212"
        visible: splashVisible
        z: 10

        Image {
            id: logo
            source: "qrc:/image/logo.png" // Замените на ваш логотип
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

            // Появление логотипа
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

            // Появление текста
            NumberAnimation {
                target: poweredByText
                property: "opacity"
                from: 0
                to: 1
                duration: 800
            }

            PauseAnimation { duration: 1500 }

            // Исчезновение splash-экрана
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

            // Активация dashboard
            ScriptAction {
                script: {
                    splashVisible = false
                    dashboardVisible = true
                }
            }
        }
    }

    // Status Bar
        Components.StatusBar {
            id: statusBar
            anchors {
                left: parent.left
                right: parent.right
                top: statusBar.position === "top" ? parent.top : undefined
                bottom: statusBar.position === "bottom" ? parent.bottom : undefined
            }
            position: "top"   // ← Или "bottom"
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


        // Центральный дисплей
        Components.CentralDisplay {
            id: centerDisplay
            width: refCenterWidth
            height: refCenterHeight
            anchors.centerIn: parent
            z: 1
        }

        // Датчики
        Components.CircularGauge {
            id: rpmGauge
            width: refGaugeSize
            height: refGaugeSize
            anchors {
                verticalCenter: parent.verticalCenter
                right: centerDisplay.left
                rightMargin: 20 * dashboardScale
            }
            z: 2
            minValue: 0
            maxValue: 8
            value: vehicleData.rpm
            unit: "x1000"
            label: "RPM"
            accentColor: "#00E0FF"
            dangerThreshold: 0.75
        }


        Components.CircularGauge {
            id: speedGauge
            width: refGaugeSize
            height: refGaugeSize
            anchors {
                verticalCenter: parent.verticalCenter
                left: centerDisplay.right
                leftMargin: 20 * dashboardScale
            }
            z: 2
            minValue: 0
            maxValue: 220
            value: vehicleData.speed
            unit: "km/h"
            label: "SPEED"
            accentColor: "#00E0FF"
            dangerThreshold: 0.9
        }

    }


    // Warning Icons (иконки ошибок)
        Components.WarningIcons {
            id: warningIcons
            position: "bottom"   // top / bottom / left / right
            width: parent.width  // ВАЖНО: ограничиваем ширину

            anchors {
                horizontalCenter: parent.horizontalCenter
                bottom: position === "bottom" ? dashboardContent.bottom : undefined
                top: position === "top" ? parent.top : undefined
                left: position === "left" ? parent.left : undefined
                right: position === "right" ? parent.right : undefined
            }
        }

    // Функция для обновления масштаба
    function updateScale() {
        // Вычисляем доступное пространство
        var widthRatio = width / refWidth
        var heightRatio = height / refHeight

        // Выбираем минимальный коэффициент, чтобы вписать по обоим измерениям
        var newScale = Math.min(widthRatio, heightRatio)

        // Применяем минимальный масштаб
        dashboardScale = Math.max(minScale, newScale)
    }

    onWidthChanged: updateScale()
    onHeightChanged: updateScale()
    Component.onCompleted: {
        updateScale()
        splashAnimation.start()
    }
}
