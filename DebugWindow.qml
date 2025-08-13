import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

ApplicationWindow {
    id: debugWindow
    width: 420
    height: 800
    title: qsTr("Vehicle Debug Panel")

    Material.theme: Material.Dark
    Material.primary: Material.Blue
    Material.accent: Material.Cyan

    property var vehicleData

    // Custom colors
    readonly property color primaryColor: "#0D47A1"
    readonly property color accentColor: "#00BCD4"
    readonly property color surfaceColor: "#1E1E1E"
    readonly property color cardColor: "#2D2D2D"
    readonly property color successColor: "#4CAF50"
    readonly property color warningColor: "#FF9800"
    readonly property color errorColor: "#F44336"

    // Safe property access functions
    function safeValue(value, defaultValue) {
        return (value !== undefined && value !== null) ? value : defaultValue
    }

    // Basic vehicle parameters
    function safeSpeed() { return safeValue(vehicleData?.speed, 0) }
    function safeRpm() { return safeValue(vehicleData?.rpm, 0) }
    function safeGear() { return safeValue(vehicleData?.gear, "P") }
    function safeTemperature() { return safeValue(vehicleData?.temperature, 20) }
    function safeOilPressure() { return safeValue(vehicleData?.oilPressure, 3) }
    function safeFuelLevel() { return safeValue(vehicleData?.fuelLevel, 50) }
    function safeBatteryVoltage() { return safeValue(vehicleData?.batteryVoltage, 12) }
    function safeRange() { return safeValue(vehicleData?.range, 400) }
    function safeOdometer() { return safeValue(vehicleData?.odometer, 50000) }
    function safeTripDistance() { return safeValue(vehicleData?.tripDistance, 125) }
    function safeOutsideTemperature() { return safeValue(vehicleData?.outsideTemperature, 22) }

    // Warning lights
    function safeCheckEngine() { return safeValue(vehicleData?.checkEngine, false) }
    function safeAbsFault() { return safeValue(vehicleData?.absFault, false) }
    function safeEspFault() { return safeValue(vehicleData?.espFault, false) }
    function safeLowFuelWarning() { return safeValue(vehicleData?.lowFuelWarning, false) }
    function safeLowOilPressureWarning() { return safeValue(vehicleData?.lowOilPressureWarning, false) }
    function safeHighEngineTempWarning() { return safeValue(vehicleData?.highEngineTempWarning, false) }
    function safeSeatbeltUnfastened() { return safeValue(vehicleData?.seatbeltUnfastened, false) }
    function safeAirbagFault() { return safeValue(vehicleData?.airbagFault, false) }
    function safeBatteryFault() { return safeValue(vehicleData?.batteryFault, false) }
    function safeParkingBrake() { return safeValue(vehicleData?.parkingBrake, false) }

    // Doors and openings
    function safeDoorsOpen() { return safeValue(vehicleData?.doorsOpen, [false, false, false, false]) }
    function safeHoodOpen() { return safeValue(vehicleData?.hoodOpen, false) }
    function safeTrunkOpen() { return safeValue(vehicleData?.trunkOpen, false) }

    // Lights
    function safeLowBeam() { return safeValue(vehicleData?.lowBeam, false) }
    function safeHighBeam() { return safeValue(vehicleData?.highBeam, false) }
    function safeFogLightsFront() { return safeValue(vehicleData?.fogLightsFront, false) }
    function safeFogLightsRear() { return safeValue(vehicleData?.fogLightsRear, false) }
    function safeHazardLights() { return safeValue(vehicleData?.hazardLights, false) }
    function safeLeftSignalActive() { return safeValue(vehicleData?.leftSignalActive, false) }
    function safeRightSignalActive() { return safeValue(vehicleData?.rightSignalActive, false) }

    // TPMS
    function safeTpmsTemps() { return safeValue(vehicleData?.tpmsTemps, [25, 25, 25, 25]) }
    function safeTpmsPressures() { return safeValue(vehicleData?.tpmsPressures, [2.3, 2.3, 2.3, 2.3]) }

    // Navigation
    function safeNavigationDistance() { return safeValue(vehicleData?.navigationDistance, 5.2) }
    function safeNavigationAngle() { return safeValue(vehicleData?.navigationAngle, 45) }

    // Media & Phone
    function safeCurrentTrack() { return safeValue(vehicleData?.currentTrack, "No Track") }
    function safeConnectedPhoneName() { return safeValue(vehicleData?.connectedPhoneName, "No Phone") }
    function safeSignalStrength() { return safeValue(vehicleData?.signalStrength, 3) }

    // System
    function safeCpuLoad() { return safeValue(vehicleData?.cpuLoad, 25) }
    function safeFps() { return safeValue(vehicleData?.fps, 60) }
    function safeCanError() { return safeValue(vehicleData?.canError, false) }
    function safeEngineHours() { return safeValue(vehicleData?.engineHours, 1250.5) }
    function safeCruiseControlActive() { return safeValue(vehicleData?.cruiseControlActive, false) }

    function safeCurrentArtist() { return safeValue(vehicleData?.currentArtist, "Unknown Artist") }
    function safeCurrentAlbum() { return safeValue(vehicleData?.currentAlbum, "Unknown Album") }
    function safeAlbumArt() { return safeValue(vehicleData?.albumArt, "") }
    function safeIsPlaying() { return safeValue(vehicleData?.isPlaying, false) }

    // Call status
    function safeCallStatus() { return safeValue(vehicleData?.callStatus, 0) } // 0: NoCall, 1: Incoming, 2: Outgoing, 3: Active
    function safeCallerName() { return safeValue(vehicleData?.callerName, "") }
    function safeCallerNumber() { return safeValue(vehicleData?.callerNumber, "") }
    function safeCallDuration() { return safeValue(vehicleData?.callDuration, 0) }

    // New warning lights (добавьте все новые предупреждения из VehicleData.h)
    function safeFogLightsFrontActive() { return safeValue(vehicleData?.fogLightsFrontActive, false) }
    function safeFogLightsRearActive() { return safeValue(vehicleData?.fogLightsRearActive, false) }
    function safeSteeringFault() { return safeValue(vehicleData?.steeringFault, false) }

    // Background with gradient
    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#0A0A0A" }
            GradientStop { position: 1.0; color: "#1A1A1A" }
        }
    }

    ScrollView {
        anchors.fill: parent
        clip: true

        // Custom scrollbar styling
        ScrollBar.vertical: ScrollBar {
            id: verticalScrollBar
            active: true
            orientation: Qt.Vertical
            size: 0
            width: 0
            policy: ScrollBar.AsNeeded

            contentItem: Rectangle {
                implicitWidth: 8
                implicitHeight: 100
                radius: 4
                color: parent.pressed ? accentColor : (parent.hovered ? "#00BCD4" : "#4A5568")
                opacity: parent.pressed ? 1.0 : (parent.hovered ? 0.8 : 0.5)

                Behavior on color { ColorAnimation { duration: 200 } }
                Behavior on opacity { NumberAnimation { duration: 200 } }

                // Glowing effect when active
                Rectangle {
                    anchors.fill: parent
                    radius: 4
                    color: accentColor
                    opacity: parent.parent.pressed ? 0.3 : 0

                    Behavior on opacity { NumberAnimation { duration: 200 } }
                }
            }

            background: Rectangle {
                implicitWidth: 8
                implicitHeight: 100
                color: "#2D3748"
                radius: 4
                opacity: 0

                Behavior on opacity { NumberAnimation { duration: 200 } }
            }
        }

        ScrollBar.horizontal: ScrollBar {
            policy: ScrollBar.AlwaysOff
        }
        Column {

         width: debugWindow.width

        Column {
            width:  parent.width - 24
            spacing: 16
            anchors.horizontalCenter: parent.horizontalCenter // Добавляем это

            Rectangle {
                width: parent.width
                height: 4
                color: "transparent"
            }
            // Header
            Rectangle {
                width: parent.width
                height: 80
                radius: 12
                gradient: Gradient {
                    GradientStop { position: 0.0; color: primaryColor }
                    GradientStop { position: 1.0; color: accentColor }
                }

                Row {
                    anchors.fill: parent
                    anchors.margins: 16
                    spacing: 12

                    Text {
                        text: "🔧"
                        font.pixelSize: 32
                        color: "white"
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    Column {
                        anchors.verticalCenter: parent.verticalCenter
                        spacing: 4
                        width: parent.width - 100

                        Text {
                            text: "Vehicle Debug Panel"
                            font.pixelSize: 20
                            font.weight: Font.Bold
                            color: "white"
                        }

                        Text {
                            text: "Real-time diagnostics & control"
                            font.pixelSize: 12
                            color: "#E0E0E0"
                            opacity: 0.8
                        }
                    }

                    Rectangle {
                        width: 12
                        height: 12
                        radius: 6
                        color: successColor
                        anchors.verticalCenter: parent.verticalCenter

                        SequentialAnimation on opacity {
                            running: true
                            loops: Animation.Infinite
                            NumberAnimation { to: 0.3; duration: 1000 }
                            NumberAnimation { to: 1.0; duration: 1000 }
                        }
                    }
                }
            }

            // Performance Metrics Card
            Rectangle {
                width: parent.width
                height: performanceColumn.height + 32
                color: cardColor
                radius: 12

                Column {
                    id: performanceColumn
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.margins: 16
                    spacing: 12

                    Text {
                        text: "⚡ Performance Metrics"
                        font.pixelSize: 16
                        font.weight: Font.Bold
                        color: accentColor
                    }

                    Rectangle {
                        width: parent.width
                        height: 1
                        color: "#404040"
                    }

                    // Speed Slider
                    Column {
                        width: parent.width
                        spacing: 8

                        Row {
                            width: parent.width

                            Text {
                                text: "Speed"
                                font.pixelSize: 12
                                color: "#E0E0E0"
                                width: parent.width - 80
                            }

                            Text {
                                text: safeSpeed().toFixed(1) + " km/h"
                                font.pixelSize: 14
                                font.weight: Font.Bold
                                color: safeSpeed() > 120 ? errorColor : (safeSpeed() > 80 ? warningColor : successColor)
                                width: 80
                                horizontalAlignment: Text.AlignRight
                            }
                        }

                        Slider {
                            width: parent.width
                            from: 0
                            to: 300
                            value: safeSpeed()
                            onMoved: if (vehicleData) vehicleData.speed = value

                            background: Rectangle {
                                x: parent.leftPadding
                                y: parent.topPadding + parent.availableHeight / 2 - height / 2
                                width: parent.availableWidth
                                height: 4
                                radius: 2
                                color: "#404040"

                                Rectangle {
                                    width: parent.parent.visualPosition * parent.width
                                    height: parent.height
                                    color: safeSpeed() > 120 ? errorColor : (safeSpeed() > 80 ? warningColor : successColor)
                                    radius: 2
                                }
                            }

                            handle: Rectangle {
                                x: parent.leftPadding + parent.visualPosition * (parent.availableWidth - width)
                                y: parent.topPadding + parent.availableHeight / 2 - height / 2
                                width: 20
                                height: 20
                                radius: 10
                                color: safeSpeed() > 120 ? errorColor : (safeSpeed() > 80 ? warningColor : successColor)
                                border.color: "#FFFFFF"
                                border.width: 2
                            }
                        }
                    }

                    // RPM Slider
                    Column {
                        width: parent.width
                        spacing: 8

                        Row {
                            width: parent.width

                            Text {
                                text: "RPM"
                                font.pixelSize: 12
                                color: "#E0E0E0"
                                width: parent.width - 60
                            }

                            Text {
                                text: safeRpm().toFixed(1) + "k"
                                font.pixelSize: 14
                                font.weight: Font.Bold
                                color: safeRpm() > 7 ? errorColor : (safeRpm() > 5 ? warningColor : successColor)
                                width: 60
                                horizontalAlignment: Text.AlignRight
                            }
                        }

                        Slider {
                            width: parent.width
                            from: 0
                            to: 10
                            value: safeRpm()
                            onMoved: if (vehicleData) vehicleData.rpm = value

                            background: Rectangle {
                                x: parent.leftPadding
                                y: parent.topPadding + parent.availableHeight / 2 - height / 2
                                width: parent.availableWidth
                                height: 4
                                radius: 2
                                color: "#404040"

                                Rectangle {
                                    width: parent.parent.visualPosition * parent.width
                                    height: parent.height
                                    color: safeRpm() > 7 ? errorColor : (safeRpm() > 5 ? warningColor : successColor)
                                    radius: 2
                                }
                            }

                            handle: Rectangle {
                                x: parent.leftPadding + parent.visualPosition * (parent.availableWidth - width)
                                y: parent.topPadding + parent.availableHeight / 2 - height / 2
                                width: 20
                                height: 20
                                radius: 10
                                color: safeRpm() > 7 ? errorColor : (safeRpm() > 5 ? warningColor : successColor)
                                border.color: "#FFFFFF"
                                border.width: 2
                            }
                        }
                    }

                    // Odometer Slider
                    Column {
                        width: parent.width
                        spacing: 8

                        Row {
                            width: parent.width

                            Text {
                                text: "Odometer"
                                font.pixelSize: 12
                                color: "#E0E0E0"
                                width: parent.width - 80
                            }

                            Text {
                                text: safeOdometer().toFixed(1) + " km"
                                font.pixelSize: 14
                                font.weight: Font.Bold
                                color: successColor
                                width: 80
                                horizontalAlignment: Text.AlignRight
                            }
                        }

                        Slider {
                            width: parent.width
                            from: 0
                            to: 200000
                            value: safeOdometer()
                            onMoved: if (vehicleData) vehicleData.odometer = value

                            background: Rectangle {
                                x: parent.leftPadding
                                y: parent.topPadding + parent.availableHeight / 2 - height / 2
                                width: parent.availableWidth
                                height: 4
                                radius: 2
                                color: "#404040"

                                Rectangle {
                                    width: parent.parent.visualPosition * parent.width
                                    height: parent.height
                                    color: successColor
                                    radius: 2
                                }
                            }

                            handle: Rectangle {
                                x: parent.leftPadding + parent.visualPosition * (parent.availableWidth - width)
                                y: parent.topPadding + parent.availableHeight / 2 - height / 2
                                width: 20
                                height: 20
                                radius: 10
                                color: successColor
                                border.color: "#FFFFFF"
                                border.width: 2
                            }
                        }
                    }

                    // Trip Distance Slider
                    Column {
                        width: parent.width
                        spacing: 8

                        Row {
                            width: parent.width

                            Text {
                                text: "Trip Distance"
                                font.pixelSize: 12
                                color: "#E0E0E0"
                                width: parent.width - 80
                            }

                            Text {
                                text: safeTripDistance().toFixed(1) + " km"
                                font.pixelSize: 14
                                font.weight: Font.Bold
                                color: successColor
                                width: 80
                                horizontalAlignment: Text.AlignRight
                            }
                        }

                        Slider {
                            width: parent.width
                            from: 0
                            to: 2000
                            value: safeTripDistance()
                            onMoved: if (vehicleData) vehicleData.tripDistance = value

                            background: Rectangle {
                                x: parent.leftPadding
                                y: parent.topPadding + parent.availableHeight / 2 - height / 2
                                width: parent.availableWidth
                                height: 4
                                radius: 2
                                color: "#404040"

                                Rectangle {
                                    width: parent.parent.visualPosition * parent.width
                                    height: parent.height
                                    color: successColor
                                    radius: 2
                                }
                            }

                            handle: Rectangle {
                                x: parent.leftPadding + parent.visualPosition * (parent.availableWidth - width)
                                y: parent.topPadding + parent.availableHeight / 2 - height / 2
                                width: 20
                                height: 20
                                radius: 10
                                color: successColor
                                border.color: "#FFFFFF"
                                border.width: 2
                            }
                        }
                    }

                    // Temperature Slider
                    Column {
                        width: parent.width
                        spacing: 8

                        Row {
                            width: parent.width

                            Text {
                                text: "Engine Temp"
                                font.pixelSize: 12
                                color: "#E0E0E0"
                                width: parent.width - 60
                            }

                            Text {
                                text: safeTemperature().toFixed(1) + "°C"
                                font.pixelSize: 14
                                font.weight: Font.Bold
                                color: safeTemperature() > 100 ? errorColor : (safeTemperature() > 80 ? warningColor : successColor)
                                width: 60
                                horizontalAlignment: Text.AlignRight
                            }
                        }

                        Slider {
                            width: parent.width
                            from: -40
                            to: 150
                            value: safeTemperature()
                            onMoved: if (vehicleData) vehicleData.temperature = value

                            background: Rectangle {
                                x: parent.leftPadding
                                y: parent.topPadding + parent.availableHeight / 2 - height / 2
                                width: parent.availableWidth
                                height: 4
                                radius: 2
                                color: "#404040"

                                Rectangle {
                                    width: parent.parent.visualPosition * parent.width
                                    height: parent.height
                                    color: safeTemperature() > 100 ? errorColor : (safeTemperature() > 80 ? warningColor : successColor)
                                    radius: 2
                                }
                            }

                            handle: Rectangle {
                                x: parent.leftPadding + parent.visualPosition * (parent.availableWidth - width)
                                y: parent.topPadding + parent.availableHeight / 2 - height / 2
                                width: 20
                                height: 20
                                radius: 10
                                color: safeTemperature() > 100 ? errorColor : (safeTemperature() > 80 ? warningColor : successColor)
                                border.color: "#FFFFFF"
                                border.width: 2
                            }
                        }
                    }

                    // Oil Pressure Slider
                    Column {
                        width: parent.width
                        spacing: 8

                        Row {
                            width: parent.width

                            Text {
                                text: "Oil Pressure"
                                font.pixelSize: 12
                                color: "#E0E0E0"
                                width: parent.width - 70
                            }

                            Text {
                                text: safeOilPressure().toFixed(2) + " bar"
                                font.pixelSize: 14
                                font.weight: Font.Bold
                                color: safeOilPressure() < 2 ? errorColor : (safeOilPressure() < 3 ? warningColor : successColor)
                                width: 70
                                horizontalAlignment: Text.AlignRight
                            }
                        }

                        Slider {
                            width: parent.width
                            from: 0
                            to: 10
                            value: safeOilPressure()
                            onMoved: if (vehicleData) vehicleData.oilPressure = value

                            background: Rectangle {
                                x: parent.leftPadding
                                y: parent.topPadding + parent.availableHeight / 2 - height / 2
                                width: parent.availableWidth
                                height: 4
                                radius: 2
                                color: "#404040"

                                Rectangle {
                                    width: parent.parent.visualPosition * parent.width
                                    height: parent.height
                                    color: safeOilPressure() < 2 ? errorColor : (safeOilPressure() < 3 ? warningColor : successColor)
                                    radius: 2
                                }
                            }

                            handle: Rectangle {
                                x: parent.leftPadding + parent.visualPosition * (parent.availableWidth - width)
                                y: parent.topPadding + parent.availableHeight / 2 - height / 2
                                width: 20
                                height: 20
                                radius: 10
                                color: safeOilPressure() < 2 ? errorColor : (safeOilPressure() < 3 ? warningColor : successColor)
                                border.color: "#FFFFFF"
                                border.width: 2
                            }
                        }
                    }

                    // Outside Temperature Slider
                    Column {
                        width: parent.width
                        spacing: 8

                        Row {
                            width: parent.width

                            Text {
                                text: "Outside Temp"
                                font.pixelSize: 12
                                color: "#E0E0E0"
                                width: parent.width - 60
                            }

                            Text {
                                text: safeOutsideTemperature().toFixed(1) + "°C"
                                font.pixelSize: 14
                                font.weight: Font.Bold
                                color: safeOutsideTemperature() > 35 ? errorColor : (safeOutsideTemperature() < 0 ? warningColor : successColor)
                                width: 60
                                horizontalAlignment: Text.AlignRight
                            }
                        }

                        Slider {
                            width: parent.width
                            from: -40
                            to: 60
                            value: safeOutsideTemperature()
                            onMoved: if (vehicleData) vehicleData.outsideTemperature = value

                            background: Rectangle {
                                x: parent.leftPadding
                                y: parent.topPadding + parent.availableHeight / 2 - height / 2
                                width: parent.availableWidth
                                height: 4
                                radius: 2
                                color: "#404040"

                                Rectangle {
                                    width: parent.parent.visualPosition * parent.width
                                    height: parent.height
                                    color: safeOutsideTemperature() > 35 ? errorColor : (safeOutsideTemperature() < 0 ? warningColor : successColor)
                                    radius: 2
                                }
                            }

                            handle: Rectangle {
                                x: parent.leftPadding + parent.visualPosition * (parent.availableWidth - width)
                                y: parent.topPadding + parent.availableHeight / 2 - height / 2
                                width: 20
                                height: 20
                                radius: 10
                                color: safeOutsideTemperature() > 35 ? errorColor : (safeOutsideTemperature() < 0 ? warningColor : successColor)
                                border.color: "#FFFFFF"
                                border.width: 2
                            }
                        }
                    }

                    // Engine Hours Slider
                    Column {
                        width: parent.width
                        spacing: 8

                        Row {
                            width: parent.width

                            Text {
                                text: "Engine Hours"
                                font.pixelSize: 12
                                color: "#E0E0E0"
                                width: parent.width - 80
                            }

                            Text {
                                text: safeEngineHours().toFixed(1) + " h"
                                font.pixelSize: 14
                                font.weight: Font.Bold
                                color: successColor
                                width: 80
                                horizontalAlignment: Text.AlignRight
                            }
                        }

                        Slider {
                            width: parent.width
                            from: 0
                            to: 10000
                            value: safeEngineHours()
                            onMoved: if (vehicleData) vehicleData.engineHours = value

                            background: Rectangle {
                                x: parent.leftPadding
                                y: parent.topPadding + parent.availableHeight / 2 - height / 2
                                width: parent.availableWidth
                                height: 4
                                radius: 2
                                color: "#404040"

                                Rectangle {
                                    width: parent.parent.visualPosition * parent.width
                                    height: parent.height
                                    color: successColor
                                    radius: 2
                                }
                            }

                            handle: Rectangle {
                                x: parent.leftPadding + parent.visualPosition * (parent.availableWidth - width)
                                y: parent.topPadding + parent.availableHeight / 2 - height / 2
                                width: 20
                                height: 20
                                radius: 10
                                color: successColor
                                border.color: "#FFFFFF"
                                border.width: 2
                            }
                        }
                    }
                    // Gear Selection
                                        Column {
                                            width: parent.width
                                            spacing: 8

                                            Row {
                                                width: parent.width

                                                Text {
                                                    text: "Gear Selection"
                                                    font.pixelSize: 12
                                                    color: "#E0E0E0"
                                                    width: parent.width - 60
                                                }

                                                Text {
                                                    text: safeGear()
                                                    font.pixelSize: 14
                                                    font.weight: Font.Bold
                                                    color: safeGear() === "P" ? warningColor : (safeGear() === "R" ? errorColor : successColor)
                                                    width: 60
                                                    horizontalAlignment: Text.AlignRight
                                                }
                                            }

                                            // Gear buttons grid
                                            Column {
                                                width: parent.width
                                                spacing: 8

                                                // First row: P, R, N, D
                                                Row {
                                                    width: parent.width
                                                    spacing: 8

                                                    Repeater {
                                                        model: ["P", "R", "N", "D"]

                                                        Rectangle {
                                                            width: (parent.width - 24) / 4
                                                            height: 40
                                                            radius: 8
                                                            color: safeGear() === modelData ?
                                                                   (modelData === "P" ? warningColor :
                                                                    modelData === "R" ? errorColor :
                                                                    modelData === "N" ? "#606060" : successColor) : "#404040"
                                                            border.color: safeGear() === modelData ? "#FFFFFF" : "#606060"
                                                            border.width: safeGear() === modelData ? 2 : 1

                                                            Behavior on color { ColorAnimation { duration: 200 } }
                                                            Behavior on border.color { ColorAnimation { duration: 200 } }

                                                            Text {
                                                                text: modelData
                                                                font.pixelSize: 16
                                                                font.weight: Font.Bold
                                                                color: safeGear() === modelData ? "#FFFFFF" : "#B0B0B0"
                                                                anchors.centerIn: parent
                                                            }

                                                            MouseArea {
                                                                anchors.fill: parent
                                                                onClicked: if (vehicleData) vehicleData.gear = modelData
                                                            }

                                                            // Glowing effect for selected gear
                                                            Rectangle {
                                                                anchors.fill: parent
                                                                radius: 8
                                                                color: "transparent"
                                                                border.color: safeGear() === modelData ? accentColor : "transparent"
                                                                border.width: 2
                                                                opacity: safeGear() === modelData ? 0.6 : 0

                                                                Behavior on opacity { NumberAnimation { duration: 200 } }

                                                                SequentialAnimation on border.color {
                                                                    running: safeGear() === modelData
                                                                    loops: Animation.Infinite
                                                                    ColorAnimation { to: accentColor; duration: 1000 }
                                                                    ColorAnimation { to: primaryColor; duration: 1000 }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }

                                                // Second row: 1, 2, 3, 4, 5, 6
                                                Row {
                                                    width: parent.width
                                                    spacing: 6

                                                    Repeater {
                                                        model: ["1", "2", "3", "4", "5", "6"]

                                                        Rectangle {
                                                            width: (parent.width - 30) / 6
                                                            height: 35
                                                            radius: 6
                                                            color: safeGear() === modelData ? successColor : "#404040"
                                                            border.color: safeGear() === modelData ? "#FFFFFF" : "#606060"
                                                            border.width: safeGear() === modelData ? 2 : 1

                                                            Behavior on color { ColorAnimation { duration: 200 } }
                                                            Behavior on border.color { ColorAnimation { duration: 200 } }

                                                            Text {
                                                                text: modelData
                                                                font.pixelSize: 14
                                                                font.weight: Font.Bold
                                                                color: safeGear() === modelData ? "#FFFFFF" : "#B0B0B0"
                                                                anchors.centerIn: parent
                                                            }

                                                            MouseArea {
                                                                anchors.fill: parent
                                                                onClicked: if (vehicleData) vehicleData.gear = modelData
                                                            }

                                                            // Subtle glow for manual gears
                                                            Rectangle {
                                                                anchors.fill: parent
                                                                radius: 6
                                                                color: "transparent"
                                                                border.color: safeGear() === modelData ? successColor : "transparent"
                                                                border.width: 1
                                                                opacity: safeGear() === modelData ? 0.4 : 0

                                                                Behavior on opacity { NumberAnimation { duration: 200 } }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                }
            }

            // Fuel & Battery Card
            Rectangle {
                width: parent.width
                height: fuelBatteryColumn.height + 32
                color: cardColor
                radius: 12

                Column {
                    id: fuelBatteryColumn
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.margins: 16
                    spacing: 12

                    Text {
                        text: "⛽ Fuel & Power"
                        font.pixelSize: 16
                        font.weight: Font.Bold
                        color: accentColor
                    }

                    Rectangle {
                        width: parent.width
                        height: 1
                        color: "#404040"
                    }

                    Row {
                        width: parent.width
                        spacing: 16

                        // Fuel Level Circular Gauge
                        Item {
                            width: (parent.width - 16) / 2
                            height: 160

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

                                        Timer {
                                            interval: 100
                                            running: true
                                            repeat: true
                                            onTriggered: parent.requestPaint()
                                        }

                                        onPaint: {
                                            var ctx = getContext("2d")
                                            ctx.clearRect(0, 0, width, height)

                                            var centerX = width / 2
                                            var centerY = height / 2
                                            var radius = 34
                                            var startAngle = -Math.PI / 2
                                            var endAngle = startAngle + (safeFuelLevel() / 100) * 2 * Math.PI

                                            ctx.beginPath()
                                            ctx.arc(centerX, centerY, radius, startAngle, endAngle)
                                            ctx.lineWidth = 6
                                            ctx.strokeStyle = safeFuelLevel() < 20 ? errorColor : (safeFuelLevel() < 40 ? warningColor : successColor)
                                            ctx.lineCap = "round"
                                            ctx.stroke()
                                        }
                                    }

                                    // Center value
                                    Text {
                                        anchors.centerIn: parent
                                        text: safeFuelLevel().toFixed(0)
                                        font.pixelSize: 16
                                        font.weight: Font.Bold
                                        color: safeFuelLevel() < 20 ? errorColor : (safeFuelLevel() < 40 ? warningColor : successColor)
                                    }
                                }

                                Text {
                                    text: "Fuel Level"
                                    font.pixelSize: 10
                                    color: "#E0E0E0"
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }

                                Slider {
                                    width: 100
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    from: 0
                                    to: 100
                                    value: safeFuelLevel()
                                    onMoved: if (vehicleData) vehicleData.fuelLevel = value

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
                                        color: safeFuelLevel() < 20 ? errorColor : (safeFuelLevel() < 40 ? warningColor : successColor)
                                    }
                                }
                            }
                        }

                        // Battery Circular Gauge
                        Item {
                            width: (parent.width - 16) / 2
                            height: 160

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

                                        Timer {
                                            interval: 100
                                            running: true
                                            repeat: true
                                            onTriggered: parent.requestPaint()
                                        }

                                        onPaint: {
                                            var ctx = getContext("2d")
                                            ctx.clearRect(0, 0, width, height)

                                            var centerX = width / 2
                                            var centerY = height / 2
                                            var radius = 34
                                            var startAngle = -Math.PI / 2
                                            var endAngle = startAngle + (safeBatteryVoltage() / 20) * 2 * Math.PI

                                            ctx.beginPath()
                                            ctx.arc(centerX, centerY, radius, startAngle, endAngle)
                                            ctx.lineWidth = 6
                                            ctx.strokeStyle = safeBatteryVoltage() < 11 ? errorColor : (safeBatteryVoltage() < 12 ? warningColor : successColor)
                                            ctx.lineCap = "round"
                                            ctx.stroke()
                                        }
                                    }

                                    // Center value
                                    Text {
                                        anchors.centerIn: parent
                                        text: safeBatteryVoltage().toFixed(1)
                                        font.pixelSize: 14
                                        font.weight: Font.Bold
                                        color: safeBatteryVoltage() < 11 ? errorColor : (safeBatteryVoltage() < 12 ? warningColor : successColor)
                                    }
                                }

                                Text {
                                    text: "Battery"
                                    font.pixelSize: 10
                                    color: "#E0E0E0"
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }

                                Slider {
                                    width: 100
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    from: 0
                                    to: 20
                                    value: safeBatteryVoltage()
                                    onMoved: if (vehicleData) vehicleData.batteryVoltage = value

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
                                        color: safeBatteryVoltage() < 11 ? errorColor : (safeBatteryVoltage() < 12 ? warningColor : successColor)
                                    }
                                }
                            }
                        }
                    }

                    // Range Slider
                    Column {
                        width: parent.width
                        spacing: 8

                        Row {
                            width: parent.width

                            Text {
                                text: "Range"
                                font.pixelSize: 12
                                color: "#E0E0E0"
                                width: parent.width - 70
                            }

                            Text {
                                text: safeRange().toFixed(0) + " km"
                                font.pixelSize: 14
                                font.weight: Font.Bold
                                color: safeRange() < 50 ? errorColor : (safeRange() < 150 ? warningColor : successColor)
                                width: 70
                                horizontalAlignment: Text.AlignRight
                            }
                        }

                        Slider {
                            width: parent.width
                            from: 0
                            to: 2000
                            value: safeRange()
                            onMoved: if (vehicleData) vehicleData.range = value

                            background: Rectangle {
                                x: parent.leftPadding
                                y: parent.topPadding + parent.availableHeight / 2 - height / 2
                                width: parent.availableWidth
                                height: 4
                                radius: 2
                                color: "#404040"

                                Rectangle {
                                    width: parent.parent.visualPosition * parent.width
                                    height: parent.height
                                    color: safeRange() < 50 ? errorColor : (safeRange() < 150 ? warningColor : successColor)
                                    radius: 2
                                }
                            }

                            handle: Rectangle {
                                x: parent.leftPadding + parent.visualPosition * (parent.availableWidth - width)
                                y: parent.topPadding + parent.availableHeight / 2 - height / 2
                                width: 20
                                height: 20
                                radius: 10
                                color: safeRange() < 50 ? errorColor : (safeRange() < 150 ? warningColor : successColor)
                                border.color: "#FFFFFF"
                                border.width: 2
                            }
                        }
                    }
                }
            }

            // TPMS Card
            Rectangle {
                width: parent.width
                height: tpmsColumn.height + 32
                color: cardColor
                radius: 12

                Column {
                    id: tpmsColumn
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.margins: 16
                    spacing: 12

                    Text {
                        text: "🛞 Tire Pressure Monitoring"
                        font.pixelSize: 16
                        font.weight: Font.Bold
                        color: accentColor
                    }

                    Rectangle {
                        width: parent.width
                        height: 1
                        color: "#404040"
                    }

                    // TPMS Temperatures
                    Text {
                        text: "TPMS Temperatures (°C):"
                        font.pixelSize: 14
                        font.weight: Font.Medium
                        color: "#E0E0E0"
                    }

                    Column {
                        width: parent.width
                        spacing: 8

                        Repeater {
                            model: 4

                            Row {
                                width: parent.width
                                spacing: 8

                                Text {
                                    text: "Wheel " + (index + 1) + ":"
                                    font.pixelSize: 12
                                    color: "#E0E0E0"
                                    width: 80
                                    anchors.verticalCenter: parent.verticalCenter
                                }

                                Slider {
                                    width: parent.width - 160
                                    from: -20
                                    to: 120
                                    value: safeTpmsTemps()[index] || 25
                                    onMoved: {
                                        if (vehicleData) {
                                            var temps = safeTpmsTemps().slice()
                                            temps[index] = value
                                            vehicleData.tpmsTemps = temps
                                        }
                                    }

                                    background: Rectangle {
                                        x: parent.leftPadding
                                        y: parent.topPadding + parent.availableHeight / 2 - height / 2
                                        width: parent.availableWidth
                                        height: 4
                                        radius: 2
                                        color: "#404040"

                                        Rectangle {
                                            width: parent.parent.visualPosition * parent.width
                                            height: parent.height
                                            color: (safeTpmsTemps()[index] || 25) > 60 ? errorColor : successColor
                                            radius: 2
                                        }
                                    }

                                    handle: Rectangle {
                                        x: parent.leftPadding + parent.visualPosition * (parent.availableWidth - width)
                                        y: parent.topPadding + parent.availableHeight / 2 - height / 2
                                        width: 16
                                        height: 16
                                        radius: 8
                                        color: (safeTpmsTemps()[index] || 25) > 60 ? errorColor : successColor
                                        border.color: "#FFFFFF"
                                        border.width: 1
                                    }
                                }

                                Text {
                                    text: (safeTpmsTemps()[index] || 25).toFixed(1)
                                    font.pixelSize: 12
                                    color: (safeTpmsTemps()[index] || 25) > 60 ? errorColor : successColor
                                    width: 60
                                    horizontalAlignment: Text.AlignRight
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                            }
                        }
                    }

                    // TPMS Pressures
                    Text {
                        text: "TPMS Pressures (bar):"
                        font.pixelSize: 14
                        font.weight: Font.Medium
                        color: "#E0E0E0"
                    }

                    Column {
                        width: parent.width
                        spacing: 8

                        Repeater {
                            model: 4

                            Row {
                                width: parent.width
                                spacing: 8

                                Text {
                                    text: "Wheel " + (index + 1) + ":"
                                    font.pixelSize: 12
                                    color: "#E0E0E0"
                                    width: 80
                                    anchors.verticalCenter: parent.verticalCenter
                                }

                                Slider {
                                    width: parent.width - 160
                                    from: 0
                                    to: 5
                                    value: safeTpmsPressures()[index] || 2.3
                                    onMoved: {
                                        if (vehicleData) {
                                            var pressures = safeTpmsPressures().slice()
                                            pressures[index] = value
                                            vehicleData.tpmsPressures = pressures
                                        }
                                    }

                                    background: Rectangle {
                                        x: parent.leftPadding
                                        y: parent.topPadding + parent.availableHeight / 2 - height / 2
                                        width: parent.availableWidth
                                        height: 4
                                        radius: 2
                                        color: "#404040"

                                        Rectangle {
                                            width: parent.parent.visualPosition * parent.width
                                            height: parent.height
                                            color: (safeTpmsPressures()[index] || 2.3) < 2.0 ? errorColor : successColor
                                            radius: 2
                                        }
                                    }

                                    handle: Rectangle {
                                        x: parent.leftPadding + parent.visualPosition * (parent.availableWidth - width)
                                        y: parent.topPadding + parent.availableHeight / 2 - height / 2
                                        width: 16
                                        height: 16
                                        radius: 8
                                        color: (safeTpmsPressures()[index] || 2.3) < 2.0 ? errorColor : successColor
                                        border.color: "#FFFFFF"
                                        border.width: 1
                                    }
                                }

                                Text {
                                    text: (safeTpmsPressures()[index] || 2.3).toFixed(2)
                                    font.pixelSize: 12
                                    color: (safeTpmsPressures()[index] || 2.3) < 2.0 ? errorColor : successColor
                                    width: 60
                                    horizontalAlignment: Text.AlignRight
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                            }
                        }
                    }
                }
            }

            // Navigation Card
            Rectangle {
                width: parent.width
                height: navigationColumn.height + 32
                color: cardColor
                radius: 12

                Column {
                    id: navigationColumn
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.margins: 16
                    spacing: 12

                    Text {
                        text: "🧭 Navigation"
                        font.pixelSize: 16
                        font.weight: Font.Bold
                        color: accentColor
                    }

                    Rectangle {
                        width: parent.width
                        height: 1
                        color: "#404040"
                    }

                    // Navigation Distance
                    Column {
                        width: parent.width
                        spacing: 8

                        Row {
                            width: parent.width

                            Text {
                                text: "Navigation Distance"
                                font.pixelSize: 12
                                color: "#E0E0E0"
                                width: parent.width - 70
                            }

                            Text {
                                text: safeNavigationDistance().toFixed(1) + " km"
                                font.pixelSize: 14
                                font.weight: Font.Bold
                                color: successColor
                                width: 70
                                horizontalAlignment: Text.AlignRight
                            }
                        }

                        Slider {
                            width: parent.width
                            from: 0
                            to: 500
                            value: safeNavigationDistance()
                            onMoved: if (vehicleData) vehicleData.navigationDistance = value

                            background: Rectangle {
                                x: parent.leftPadding
                                y: parent.topPadding + parent.availableHeight / 2 - height / 2
                                width: parent.availableWidth
                                height: 4
                                radius: 2
                                color: "#404040"

                                Rectangle {
                                    width: parent.parent.visualPosition * parent.width
                                    height: parent.height
                                    color: successColor
                                    radius: 2
                                }
                            }

                            handle: Rectangle {
                                x: parent.leftPadding + parent.visualPosition * (parent.availableWidth - width)
                                y: parent.topPadding + parent.availableHeight / 2 - height / 2
                                width: 20
                                height: 20
                                radius: 10
                                color: successColor
                                border.color: "#FFFFFF"
                                border.width: 2
                            }
                        }
                    }

                    // Navigation Angle
                    Column {
                        width: parent.width
                        spacing: 8

                        Row {
                            width: parent.width

                            Text {
                                text: "Navigation Angle"
                                font.pixelSize: 12
                                color: "#E0E0E0"
                                width: parent.width - 60
                            }

                            Text {
                                text: safeNavigationAngle().toFixed(0) + "°"
                                font.pixelSize: 14
                                font.weight: Font.Bold
                                color: successColor
                                width: 60
                                horizontalAlignment: Text.AlignRight
                            }
                        }

                        Slider {
                            width: parent.width
                            from: 0
                            to: 360
                            value: safeNavigationAngle()
                            onMoved: if (vehicleData) vehicleData.navigationAngle = value

                            background: Rectangle {
                                x: parent.leftPadding
                                y: parent.topPadding + parent.availableHeight / 2 - height / 2
                                width: parent.availableWidth
                                height: 4
                                radius: 2
                                color: "#404040"

                                Rectangle {
                                    width: parent.parent.visualPosition * parent.width
                                    height: parent.height
                                    color: successColor
                                    radius: 2
                                }
                            }

                            handle: Rectangle {
                                x: parent.leftPadding + parent.visualPosition * (parent.availableWidth - width)
                                y: parent.topPadding + parent.availableHeight / 2 - height / 2
                                width: 20
                                height: 20
                                radius: 10
                                color: successColor
                                border.color: "#FFFFFF"
                                border.width: 2
                            }
                        }
                    }
                }
            }

            // Warning Lights Card
            Rectangle {
                width: parent.width
                height: warningColumn.height + 32
                color: cardColor
                radius: 12

                Column {
                    id: warningColumn
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.margins: 16
                    spacing: 12

                    Text {
                        text: "⚠️ Warning Systems"
                        font.pixelSize: 16
                        font.weight: Font.Bold
                        color: accentColor
                    }

                    Rectangle {
                        width: parent.width
                        height: 1
                        color: "#404040"
                    }

                    // Warning lights grid
                    Column {
                        width: parent.width
                        spacing: 8

                        Row {
                            width: parent.width
                            spacing: 8

                            Rectangle {
                                width: (parent.width - 8) / 2
                                height: 40
                                radius: 8
                                color: safeCheckEngine() ? errorColor : "#404040"
                                border.color: safeCheckEngine() ? "#FF6B6B" : "#606060"
                                border.width: 1

                                Behavior on color { ColorAnimation { duration: 200 } }

                                Row {
                                    anchors.centerIn: parent
                                    spacing: 8

                                    Rectangle {
                                        width: 8
                                        height: 8
                                        radius: 4
                                        color: safeCheckEngine() ? "#FFFFFF" : "#808080"
                                        anchors.verticalCenter: parent.verticalCenter

                                        SequentialAnimation on opacity {
                                            running: safeCheckEngine()
                                            loops: Animation.Infinite
                                            NumberAnimation { to: 0.3; duration: 500 }
                                            NumberAnimation { to: 1.0; duration: 500 }
                                        }
                                    }

                                    Text {
                                        text: "Check Engine"
                                        color: safeCheckEngine() ? "#FFFFFF" : "#B0B0B0"
                                        font.pixelSize: 11
                                        font.weight: Font.Medium
                                        anchors.verticalCenter: parent.verticalCenter
                                    }
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: if (vehicleData) vehicleData.checkEngine = !safeCheckEngine()
                                }
                            }



                            Rectangle {
                                width: (parent.width - 8) / 2
                                height: 40
                                radius: 8
                                color: safeAbsFault() ? errorColor : "#404040"
                                border.color: safeAbsFault() ? "#FF6B6B" : "#606060"
                                border.width: 1

                                Behavior on color { ColorAnimation { duration: 200 } }

                                Row {
                                    anchors.centerIn: parent
                                    spacing: 8

                                    Rectangle {
                                        width: 8
                                        height: 8
                                        radius: 4
                                        color: safeAbsFault() ? "#FFFFFF" : "#808080"
                                        anchors.verticalCenter: parent.verticalCenter

                                        SequentialAnimation on opacity {
                                            running: safeAbsFault()
                                            loops: Animation.Infinite
                                            NumberAnimation { to: 0.3; duration: 500 }
                                            NumberAnimation { to: 1.0; duration: 500 }
                                        }
                                    }

                                    Text {
                                        text: "ABS Fault"
                                        color: safeAbsFault() ? "#FFFFFF" : "#B0B0B0"
                                        font.pixelSize: 11
                                        font.weight: Font.Medium
                                        anchors.verticalCenter: parent.verticalCenter
                                    }
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: if (vehicleData) vehicleData.absFault = !safeAbsFault()
                                }
                            }
                        }
                        Rectangle {
                            width: (parent.width - 8) / 2
                            height: 40
                            radius: 8
                            color: safeSteeringFault() ? errorColor : "#404040"
                            border.color: safeSteeringFault() ? "#FF6B6B" : "#606060"
                            border.width: 1

                            Row {
                                anchors.centerIn: parent
                                spacing: 8

                                Rectangle {
                                    width: 8
                                    height: 8
                                    radius: 4
                                    color: safeSteeringFault() ? "#FFFFFF" : "#808080"
                                    anchors.verticalCenter: parent.verticalCenter
                                }

                                Text {
                                    text: "Steering Fault"
                                    color: safeSteeringFault() ? "#FFFFFF" : "#B0B0B0"
                                    font.pixelSize: 11
                                    font.weight: Font.Medium
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: if (vehicleData) vehicleData.steeringFault = !safeSteeringFault()
                            }
                        }

                        Row {
                            width: parent.width
                            spacing: 8

                            Rectangle {
                                width: (parent.width - 8) / 2
                                height: 40
                                radius: 8
                                color: safeEspFault() ? errorColor : "#404040"
                                border.color: safeEspFault() ? "#FF6B6B" : "#606060"
                                border.width: 1

                                Behavior on color { ColorAnimation { duration: 200 } }

                                Row {
                                    anchors.centerIn: parent
                                    spacing: 8

                                    Rectangle {
                                        width: 8
                                        height: 8
                                        radius: 4
                                        color: safeEspFault() ? "#FFFFFF" : "#808080"
                                        anchors.verticalCenter: parent.verticalCenter

                                        SequentialAnimation on opacity {
                                            running: safeEspFault()
                                            loops: Animation.Infinite
                                            NumberAnimation { to: 0.3; duration: 500 }
                                            NumberAnimation { to: 1.0; duration: 500 }
                                        }
                                    }

                                    Text {
                                        text: "ESP Fault"
                                        color: safeEspFault() ? "#FFFFFF" : "#B0B0B0"
                                        font.pixelSize: 11
                                        font.weight: Font.Medium
                                        anchors.verticalCenter: parent.verticalCenter
                                    }
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: if (vehicleData) vehicleData.espFault = !safeEspFault()
                                }
                            }


                            Rectangle {
                                width: (parent.width - 8) / 2
                                height: 40
                                radius: 8
                                color: safeLowFuelWarning() ? errorColor : "#404040"
                                border.color: safeLowFuelWarning() ? "#FF6B6B" : "#606060"
                                border.width: 1

                                Behavior on color { ColorAnimation { duration: 200 } }

                                Row {
                                    anchors.centerIn: parent
                                    spacing: 8

                                    Rectangle {
                                        width: 8
                                        height: 8
                                        radius: 4
                                        color: safeLowFuelWarning() ? "#FFFFFF" : "#808080"
                                        anchors.verticalCenter: parent.verticalCenter

                                        SequentialAnimation on opacity {
                                            running: safeLowFuelWarning()
                                            loops: Animation.Infinite
                                            NumberAnimation { to: 0.3; duration: 500 }
                                            NumberAnimation { to: 1.0; duration: 500 }
                                        }
                                    }

                                    Text {
                                        text: "Low Fuel"
                                        color: safeLowFuelWarning() ? "#FFFFFF" : "#B0B0B0"
                                        font.pixelSize: 11
                                        font.weight: Font.Medium
                                        anchors.verticalCenter: parent.verticalCenter
                                    }
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: if (vehicleData) vehicleData.lowFuelWarning = !safeLowFuelWarning()
                                }
                            }
                        }

                        Row {
                            width: parent.width
                            spacing: 8

                            Rectangle {
                                width: (parent.width - 8) / 2
                                height: 40
                                radius: 8
                                color: safeLowOilPressureWarning() ? errorColor : "#404040"
                                border.color: safeLowOilPressureWarning() ? "#FF6B6B" : "#606060"
                                border.width: 1

                                Behavior on color { ColorAnimation { duration: 200 } }

                                Row {
                                    anchors.centerIn: parent
                                    spacing: 8

                                    Rectangle {
                                        width: 8
                                        height: 8
                                        radius: 4
                                        color: safeLowOilPressureWarning() ? "#FFFFFF" : "#808080"
                                        anchors.verticalCenter: parent.verticalCenter

                                        SequentialAnimation on opacity {
                                            running: safeLowOilPressureWarning()
                                            loops: Animation.Infinite
                                            NumberAnimation { to: 0.3; duration: 500 }
                                            NumberAnimation { to: 1.0; duration: 500 }
                                        }
                                    }

                                    Text {
                                        text: "Oil Pressure"
                                        color: safeLowOilPressureWarning() ? "#FFFFFF" : "#B0B0B0"
                                        font.pixelSize: 11
                                        font.weight: Font.Medium
                                        anchors.verticalCenter: parent.verticalCenter
                                    }
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: if (vehicleData) vehicleData.lowOilPressureWarning = !safeLowOilPressureWarning()
                                }
                            }

                            Rectangle {
                                width: (parent.width - 8) / 2
                                height: 40
                                radius: 8
                                color: safeHighEngineTempWarning() ? errorColor : "#404040"
                                border.color: safeHighEngineTempWarning() ? "#FF6B6B" : "#606060"
                                border.width: 1

                                Behavior on color { ColorAnimation { duration: 200 } }

                                Row {
                                    anchors.centerIn: parent
                                    spacing: 8

                                    Rectangle {
                                        width: 8
                                        height: 8
                                        radius: 4
                                        color: safeHighEngineTempWarning() ? "#FFFFFF" : "#808080"
                                        anchors.verticalCenter: parent.verticalCenter

                                        SequentialAnimation on opacity {
                                            running: safeHighEngineTempWarning()
                                            loops: Animation.Infinite
                                            NumberAnimation { to: 0.3; duration: 500 }
                                            NumberAnimation { to: 1.0; duration: 500 }
                                        }
                                    }

                                    Text {
                                        text: "Engine Temp"
                                        color: safeHighEngineTempWarning() ? "#FFFFFF" : "#B0B0B0"
                                        font.pixelSize: 11
                                        font.weight: Font.Medium
                                        anchors.verticalCenter: parent.verticalCenter
                                    }
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: if (vehicleData) vehicleData.highEngineTempWarning = !safeHighEngineTempWarning()
                                }
                            }
                        }

                        Row {
                            width: parent.width
                            spacing: 8

                            Rectangle {
                                width: (parent.width - 8) / 2
                                height: 40
                                radius: 8
                                color: safeSeatbeltUnfastened() ? errorColor : "#404040"
                                border.color: safeSeatbeltUnfastened() ? "#FF6B6B" : "#606060"
                                border.width: 1

                                Behavior on color { ColorAnimation { duration: 200 } }

                                Row {
                                    anchors.centerIn: parent
                                    spacing: 8

                                    Rectangle {
                                        width: 8
                                        height: 8
                                        radius: 4
                                        color: safeSeatbeltUnfastened() ? "#FFFFFF" : "#808080"
                                        anchors.verticalCenter: parent.verticalCenter

                                        SequentialAnimation on opacity {
                                            running: safeSeatbeltUnfastened()
                                            loops: Animation.Infinite
                                            NumberAnimation { to: 0.3; duration: 500 }
                                            NumberAnimation { to: 1.0; duration: 500 }
                                        }
                                    }

                                    Text {
                                        text: "Seatbelt"
                                        color: safeSeatbeltUnfastened() ? "#FFFFFF" : "#B0B0B0"
                                        font.pixelSize: 11
                                        font.weight: Font.Medium
                                        anchors.verticalCenter: parent.verticalCenter
                                    }
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: if (vehicleData) vehicleData.seatbeltUnfastened = !safeSeatbeltUnfastened()
                                }
                            }

                            Rectangle {
                                width: (parent.width - 8) / 2
                                height: 40
                                radius: 8
                                color: safeAirbagFault() ? errorColor : "#404040"
                                border.color: safeAirbagFault() ? "#FF6B6B" : "#606060"
                                border.width: 1

                                Behavior on color { ColorAnimation { duration: 200 } }

                                Row {
                                    anchors.centerIn: parent
                                    spacing: 8

                                    Rectangle {
                                        width: 8
                                        height: 8
                                        radius: 4
                                        color: safeAirbagFault() ? "#FFFFFF" : "#808080"
                                        anchors.verticalCenter: parent.verticalCenter

                                        SequentialAnimation on opacity {
                                            running: safeAirbagFault()
                                            loops: Animation.Infinite
                                            NumberAnimation { to: 0.3; duration: 500 }
                                            NumberAnimation { to: 1.0; duration: 500 }
                                        }
                                    }

                                    Text {
                                        text: "Airbag Fault"
                                        color: safeAirbagFault() ? "#FFFFFF" : "#B0B0B0"
                                        font.pixelSize: 11
                                        font.weight: Font.Medium
                                        anchors.verticalCenter: parent.verticalCenter
                                    }
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: if (vehicleData) vehicleData.airbagFault = !safeAirbagFault()
                                }
                            }
                        }

                        Row {
                            width: parent.width
                            spacing: 8

                            Rectangle {
                                width: (parent.width - 8) / 2
                                height: 40
                                radius: 8
                                color: safeBatteryFault() ? errorColor : "#404040"
                                border.color: safeBatteryFault() ? "#FF6B6B" : "#606060"
                                border.width: 1

                                Behavior on color { ColorAnimation { duration: 200 } }

                                Row {
                                    anchors.centerIn: parent
                                    spacing: 8

                                    Rectangle {
                                        width: 8
                                        height: 8
                                        radius: 4
                                        color: safeBatteryFault() ? "#FFFFFF" : "#808080"
                                        anchors.verticalCenter: parent.verticalCenter

                                        SequentialAnimation on opacity {
                                            running: safeBatteryFault()
                                            loops: Animation.Infinite
                                            NumberAnimation { to: 0.3; duration: 500 }
                                            NumberAnimation { to: 1.0; duration: 500 }
                                        }
                                    }

                                    Text {
                                        text: "Battery Fault"
                                        color: safeBatteryFault() ? "#FFFFFF" : "#B0B0B0"
                                        font.pixelSize: 11
                                        font.weight: Font.Medium
                                        anchors.verticalCenter: parent.verticalCenter
                                    }
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: if (vehicleData) vehicleData.batteryFault = !safeBatteryFault()
                                }
                            }

                            Rectangle {
                                width: (parent.width - 8) / 2
                                height: 40
                                radius: 8
                                color: safeParkingBrake() ? warningColor : "#404040"
                                border.color: safeParkingBrake() ? "#FFB74D" : "#606060"
                                border.width: 1

                                Behavior on color { ColorAnimation { duration: 200 } }

                                Row {
                                    anchors.centerIn: parent
                                    spacing: 8

                                    Rectangle {
                                        width: 8
                                        height: 8
                                        radius: 4
                                        color: safeParkingBrake() ? "#FFFFFF" : "#808080"
                                        anchors.verticalCenter: parent.verticalCenter

                                        SequentialAnimation on opacity {
                                            running: safeParkingBrake()
                                            loops: Animation.Infinite
                                            NumberAnimation { to: 0.3; duration: 500 }
                                            NumberAnimation { to: 1.0; duration: 500 }
                                        }
                                    }

                                    Text {
                                        text: "Parking Brake"
                                        color: safeParkingBrake() ? "#FFFFFF" : "#B0B0B0"
                                        font.pixelSize: 11
                                        font.weight: Font.Medium
                                        anchors.verticalCenter: parent.verticalCenter
                                    }
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: if (vehicleData) vehicleData.parkingBrake = !safeParkingBrake()
                                }
                            }
                        }
                    }
                }
            }

            // Doors & Openings Card
            Rectangle {
                width: parent.width
                height: doorsColumn.height + 32
                color: cardColor
                radius: 12

                Column {
                    id: doorsColumn
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.margins: 16
                    spacing: 12

                    Text {
                        text: "🚪 Doors & Openings"
                        font.pixelSize: 16
                        font.weight: Font.Bold
                        color: accentColor
                    }

                    Rectangle {
                        width: parent.width
                        height: 1
                        color: "#404040"
                    }

                    Column {
                        width: parent.width
                        spacing: 8

                        Row {
                            width: parent.width
                            spacing: 8

                            Rectangle {
                                width: (parent.width - 8) / 2
                                height: 40
                                radius: 8
                                color: safeHoodOpen() ? warningColor : "#404040"
                                border.color: safeHoodOpen() ? "#FFB74D" : "#606060"
                                border.width: 1

                                Behavior on color { ColorAnimation { duration: 200 } }

                                Row {
                                    anchors.centerIn: parent
                                    spacing: 8

                                    Rectangle {
                                        width: 8
                                        height: 8
                                        radius: 4
                                        color: safeHoodOpen() ? "#FFFFFF" : "#808080"
                                        anchors.verticalCenter: parent.verticalCenter
                                    }

                                    Text {
                                        text: "Hood Open"
                                        color: safeHoodOpen() ? "#FFFFFF" : "#B0B0B0"
                                        font.pixelSize: 11
                                        font.weight: Font.Medium
                                        anchors.verticalCenter: parent.verticalCenter
                                    }
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: if (vehicleData) vehicleData.hoodOpen = !safeHoodOpen()
                                }
                            }

                            Rectangle {
                                width: (parent.width - 8) / 2
                                height: 40
                                radius: 8
                                color: safeTrunkOpen() ? warningColor : "#404040"
                                border.color: safeTrunkOpen() ? "#FFB74D" : "#606060"
                                border.width: 1

                                Behavior on color { ColorAnimation { duration: 200 } }

                                Row {
                                    anchors.centerIn: parent
                                    spacing: 8

                                    Rectangle {
                                        width: 8
                                        height: 8
                                        radius: 4
                                        color: safeTrunkOpen() ? "#FFFFFF" : "#808080"
                                        anchors.verticalCenter: parent.verticalCenter
                                    }

                                    Text {
                                        text: "Trunk Open"
                                        color: safeTrunkOpen() ? "#FFFFFF" : "#B0B0B0"
                                        font.pixelSize: 11
                                        font.weight: Font.Medium
                                        anchors.verticalCenter: parent.verticalCenter
                                    }
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: if (vehicleData) vehicleData.trunkOpen = !safeTrunkOpen()
                                }
                            }
                        }

                        // Individual doors
                        Column {
                            width: parent.width
                            spacing: 8

                            Repeater {
                                model: 4

                                Rectangle {
                                    width: parent.width
                                    height: 35
                                    radius: 8
                                    color: (safeDoorsOpen()[index] || false) ? warningColor : "#404040"
                                    border.color: (safeDoorsOpen()[index] || false) ? "#FFB74D" : "#606060"
                                    border.width: 1

                                    Behavior on color { ColorAnimation { duration: 200 } }

                                    Row {
                                        anchors.centerIn: parent
                                        spacing: 8

                                        Rectangle {
                                            width: 8
                                            height: 8
                                            radius: 4
                                            color: (safeDoorsOpen()[index] || false) ? "#FFFFFF" : "#808080"
                                            anchors.verticalCenter: parent.verticalCenter
                                        }

                                        Text {
                                            text: "Door " + (index + 1) + " Open"
                                            color: (safeDoorsOpen()[index] || false) ? "#FFFFFF" : "#B0B0B0"
                                            font.pixelSize: 11
                                            font.weight: Font.Medium
                                            anchors.verticalCenter: parent.verticalCenter
                                        }
                                    }

                                    MouseArea {
                                        anchors.fill: parent
                                        onClicked: {
                                            if (vehicleData) {
                                                var doors = safeDoorsOpen().slice()
                                                doors[index] = !doors[index]
                                                vehicleData.doorsOpen = doors
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            // Lights & Signals Card
            Rectangle {
                width: parent.width
                height: lightsColumn.height + 32
                color: cardColor
                radius: 12

                Column {
                    id: lightsColumn
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.margins: 16
                    spacing: 12

                    Text {
                        text: "💡 Lighting System"
                        font.pixelSize: 16
                        font.weight: Font.Bold
                        color: accentColor
                    }

                    Rectangle {
                        width: parent.width
                        height: 1
                        color: "#404040"
                    }

                    Column {
                        width: parent.width
                        spacing: 8

                        Row {
                            width: parent.width
                            spacing: 8

                            Rectangle {
                                width: (parent.width - 8) / 2
                                height: 40
                                radius: 8
                                color: safeLowBeam() ? successColor : "#404040"
                                border.color: safeLowBeam() ? "#66BB6A" : "#606060"
                                border.width: 1

                                Behavior on color { ColorAnimation { duration: 200 } }

                                Row {
                                    anchors.centerIn: parent
                                    spacing: 8

                                    Text {
                                        text: "💡"
                                        font.pixelSize: 16
                                        anchors.verticalCenter: parent.verticalCenter
                                        opacity: safeLowBeam() ? 1.0 : 0.3
                                    }

                                    Text {
                                        text: "Low Beam"
                                        color: safeLowBeam() ? "#FFFFFF" : "#B0B0B0"
                                        font.pixelSize: 11
                                        font.weight: Font.Medium
                                        anchors.verticalCenter: parent.verticalCenter
                                    }
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: if (vehicleData) vehicleData.lowBeam = !safeLowBeam()
                                }
                            }

                            Rectangle {
                                width: (parent.width - 8) / 2
                                height: 40
                                radius: 8
                                color: safeHighBeam() ? successColor : "#404040"
                                border.color: safeHighBeam() ? "#66BB6A" : "#606060"
                                border.width: 1

                                Behavior on color { ColorAnimation { duration: 200 } }

                                Row {
                                    anchors.centerIn: parent
                                    spacing: 8

                                    Text {
                                        text: "💡"
                                        font.pixelSize: 16
                                        anchors.verticalCenter: parent.verticalCenter
                                        opacity: safeHighBeam() ? 1.0 : 0.3
                                    }

                                    Text {
                                        text: "High Beam"
                                        color: safeHighBeam() ? "#FFFFFF" : "#B0B0B0"
                                        font.pixelSize: 11
                                        font.weight: Font.Medium
                                        anchors.verticalCenter: parent.verticalCenter
                                    }
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: if (vehicleData) vehicleData.highBeam = !safeHighBeam()
                                }
                            }
                        }

                        Row {
                            width: parent.width
                            spacing: 8

                            Rectangle {
                                width: (parent.width - 8) / 2
                                height: 40
                                radius: 8
                                color: safeFogLightsFront() ? successColor : "#404040"
                                border.color: safeFogLightsFront() ? "#66BB6A" : "#606060"
                                border.width: 1

                                Behavior on color { ColorAnimation { duration: 200 } }

                                Row {
                                    anchors.centerIn: parent
                                    spacing: 8

                                    Text {
                                        text: "💡"
                                        font.pixelSize: 16
                                        anchors.verticalCenter: parent.verticalCenter
                                        opacity: safeFogLightsFront() ? 1.0 : 0.3
                                    }

                                    Text {
                                        text: "Fog Front"
                                        color: safeFogLightsFront() ? "#FFFFFF" : "#B0B0B0"
                                        font.pixelSize: 11
                                        font.weight: Font.Medium
                                        anchors.verticalCenter: parent.verticalCenter
                                    }
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: if (vehicleData) vehicleData.fogLightsFront = !safeFogLightsFront()
                                }
                            }

                            Rectangle {
                                width: (parent.width - 8) / 2
                                height: 40
                                radius: 8
                                color: safeFogLightsRear() ? successColor : "#404040"
                                border.color: safeFogLightsRear() ? "#66BB6A" : "#606060"
                                border.width: 1

                                Behavior on color { ColorAnimation { duration: 200 } }

                                Row {
                                    anchors.centerIn: parent
                                    spacing: 8

                                    Text {
                                        text: "💡"
                                        font.pixelSize: 16
                                        anchors.verticalCenter: parent.verticalCenter
                                        opacity: safeFogLightsRear() ? 1.0 : 0.3
                                    }

                                    Text {
                                        text: "Fog Rear"
                                        color: safeFogLightsRear() ? "#FFFFFF" : "#B0B0B0"
                                        font.pixelSize: 11
                                        font.weight: Font.Medium
                                        anchors.verticalCenter: parent.verticalCenter
                                    }
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: if (vehicleData) vehicleData.fogLightsRear = !safeFogLightsRear()
                                }
                            }
                        }

                        Row {
                            width: parent.width
                            spacing: 8

                            Rectangle {
                                width: (parent.width - 8) / 2
                                height: 40
                                radius: 8
                                color: safeLeftSignalActive() ? warningColor : "#404040"
                                border.color: safeLeftSignalActive() ? "#FFB74D" : "#606060"
                                border.width: 1

                                Behavior on color { ColorAnimation { duration: 200 } }

                                Row {
                                    anchors.centerIn: parent
                                    spacing: 8

                                    Text {
                                        text: "💡"
                                        font.pixelSize: 16
                                        anchors.verticalCenter: parent.verticalCenter
                                        opacity: safeLeftSignalActive() ? 1.0 : 0.3

                                        SequentialAnimation on opacity {
                                            running: safeLeftSignalActive()
                                            loops: Animation.Infinite
                                            NumberAnimation { to: 0.3; duration: 300 }
                                            NumberAnimation { to: 1.0; duration: 300 }
                                        }
                                    }

                                    Text {
                                        text: "Left Signal"
                                        color: safeLeftSignalActive() ? "#FFFFFF" : "#B0B0B0"
                                        font.pixelSize: 11
                                        font.weight: Font.Medium
                                        anchors.verticalCenter: parent.verticalCenter
                                    }
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: if (vehicleData) vehicleData.leftSignalActive = !safeLeftSignalActive()
                                }
                            }

                            Rectangle {
                                width: (parent.width - 8) / 2
                                height: 40
                                radius: 8
                                color: safeRightSignalActive() ? warningColor : "#404040"
                                border.color: safeRightSignalActive() ? "#FFB74D" : "#606060"
                                border.width: 1

                                Behavior on color { ColorAnimation { duration: 200 } }

                                Row {
                                    anchors.centerIn: parent
                                    spacing: 8

                                    Text {
                                        text: "💡"
                                        font.pixelSize: 16
                                        anchors.verticalCenter: parent.verticalCenter
                                        opacity: safeRightSignalActive() ? 1.0 : 0.3

                                        SequentialAnimation on opacity {
                                            running: safeRightSignalActive()
                                            loops: Animation.Infinite
                                            NumberAnimation { to: 0.3; duration: 300 }
                                            NumberAnimation { to: 1.0; duration: 300 }
                                        }
                                    }

                                    Text {
                                        text: "Right Signal"
                                        color: safeRightSignalActive() ? "#FFFFFF" : "#B0B0B0"
                                        font.pixelSize: 11
                                        font.weight: Font.Medium
                                        anchors.verticalCenter: parent.verticalCenter
                                    }
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: if (vehicleData) vehicleData.rightSignalActive = !safeRightSignalActive()
                                }
                            }
                        }

                        Rectangle {
                            width: parent.width
                            height: 40
                            radius: 8
                            color: safeHazardLights() ? errorColor : "#404040"
                            border.color: safeHazardLights() ? "#FF6B6B" : "#606060"
                            border.width: 1

                            Behavior on color { ColorAnimation { duration: 200 } }

                            Row {
                                anchors.centerIn: parent
                                spacing: 8

                                Text {
                                    text: "💡"
                                    font.pixelSize: 16
                                    anchors.verticalCenter: parent.verticalCenter
                                    opacity: safeHazardLights() ? 1.0 : 0.3

                                    SequentialAnimation on opacity {
                                        running: safeHazardLights()
                                        loops: Animation.Infinite
                                        NumberAnimation { to: 0.3; duration: 250 }
                                        NumberAnimation { to: 1.0; duration: 250 }
                                    }
                                }

                                Text {
                                    text: "Hazard Lights"
                                    color: safeHazardLights() ? "#FFFFFF" : "#B0B0B0"
                                    font.pixelSize: 11
                                    font.weight: Font.Medium
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: if (vehicleData) vehicleData.hazardLights = !safeHazardLights()
                            }
                        }
                    }
                }
            }

            // Media & Phone Card
                        Rectangle {
                            width: parent.width
                            height: mediaColumn.height + 32
                            color: cardColor
                            radius: 12

                            Column {
                                id: mediaColumn
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.top: parent.top
                                anchors.margins: 16
                                spacing: 12

                                Text {
                                    text: "🎵 Media & Communication"
                                    font.pixelSize: 16
                                    font.weight: Font.Bold
                                    color: accentColor
                                }

                                Rectangle {
                                    width: parent.width
                                    height: 1
                                    color: "#404040"
                                }

                                // Media Section
                                Rectangle {
                                    width: parent.width
                                    height: mediaSection.height + 24
                                    radius: 8
                                    color: "#1A1A1A"
                                    border.color: "#404040"
                                    border.width: 1

                                    Column {
                                        id: mediaSection
                                        anchors.left: parent.left
                                        anchors.right: parent.right
                                        anchors.top: parent.top
                                        anchors.margins: 12
                                        spacing: 12

                                        Row {
                                            width: parent.width
                                            spacing: 12

                                            // Album Art
                                            Rectangle {
                                                width: 60
                                                height: 60
                                                radius: 8
                                                color: "#2A2A2A"
                                                border.color: "#404040"
                                                border.width: 1

                                                Image {
                                                    anchors.centerIn: parent
                                                    width: 32
                                                    height: 32
                                                    source: "qrc:/image/play.png"
                                                    fillMode: Image.PreserveAspectFit
                                                    visible: !safeIsPlaying()
                                                }

                                                Rectangle {
                                                    anchors.centerIn: parent
                                                    width: 24
                                                    height: 24
                                                    radius: 4
                                                    color: accentColor
                                                    opacity: 0.3
                                                    visible: safeIsPlaying()

                                                    Text {
                                                        text: "♪"
                                                        font.pixelSize: 16
                                                        color: "white"
                                                        anchors.centerIn: parent
                                                    }
                                                }
                                            }

                                            // Track Info
                                            Column {
                                                width: parent.width - 72
                                                spacing: 4
                                                anchors.verticalCenter: parent.verticalCenter

                                                Text {
                                                    text: safeCurrentTrack()
                                                    font.pixelSize: 14
                                                    font.weight: Font.Bold
                                                    color: "white"
                                                    width: parent.width
                                                    elide: Text.ElideRight
                                                }

                                                Text {
                                                    text: safeCurrentArtist()
                                                    font.pixelSize: 12
                                                    color: "#B0B0B0"
                                                    width: parent.width
                                                    elide: Text.ElideRight
                                                }

                                                Text {
                                                    text: safeCurrentAlbum()
                                                    font.pixelSize: 11
                                                    color: "#808080"
                                                    width: parent.width
                                                    elide: Text.ElideRight
                                                }
                                            }
                                        }

                                        // Playback Controls - Only Play/Pause button
                                        Rectangle {
                                            width: 50
                                            height: 50
                                            radius: 25
                                            color: safeIsPlaying() ? successColor : accentColor
                                            border.color: safeIsPlaying() ? Qt.darker(successColor, 1.2) : Qt.darker(accentColor, 1.2)
                                            border.width: 2
                                            anchors.horizontalCenter: parent.horizontalCenter

                                            Image {
                                                anchors.centerIn: parent
                                                width: 24
                                                height: 24
                                                source: safeIsPlaying() ? "qrc:/image/Pause.png" : "qrc:/image/Play.png"
                                                fillMode: Image.PreserveAspectFit
                                            }

                                            MouseArea {
                                                anchors.fill: parent
                                                onClicked: if (vehicleData) vehicleData.isPlaying = !safeIsPlaying()
                                            }

                                            Behavior on color { ColorAnimation { duration: 200 } }

                                            // Pulsing effect when playing
                                            SequentialAnimation on scale {
                                                running: safeIsPlaying()
                                                loops: Animation.Infinite
                                                NumberAnimation { to: 1.05; duration: 800 }
                                                NumberAnimation { to: 1.0; duration: 800 }
                                            }
                                        }

                                        // Device Name Input Field
                                        Row {
                                            width: parent.width
                                            spacing: 8

                                            Text {
                                                text: "Device:"
                                                font.pixelSize: 12
                                                color: "#E0E0E0"
                                                width: 60
                                                anchors.verticalCenter: parent.verticalCenter
                                            }

                                            TextField {
                                                text: safeConnectedDeviceName()
                                                onEditingFinished: if (vehicleData) vehicleData.connectedDeviceName = text
                                                width: parent.width - 70
                                                color: "#FFFFFF"
                                                font.pixelSize: 12
                                                background: Rectangle {
                                                    color: "#2A2A2A"
                                                    radius: 6
                                                    border.color: parent.parent.activeFocus ? accentColor : "#606060"
                                                    border.width: 1

                                                    Behavior on border.color { ColorAnimation { duration: 200 } }
                                                }
                                            }
                                        }

                                        // Track Input Field
                                        Row {
                                            width: parent.width
                                            spacing: 8

                                            Text {
                                                text: "Track:"
                                                font.pixelSize: 12
                                                color: "#E0E0E0"
                                                width: 60
                                                anchors.verticalCenter: parent.verticalCenter
                                            }

                                            TextField {
                                                text: safeCurrentTrack()
                                                onEditingFinished: if (vehicleData) vehicleData.currentTrack = text
                                                width: parent.width - 70
                                                color: "#FFFFFF"
                                                font.pixelSize: 12
                                                background: Rectangle {
                                                    color: "#2A2A2A"
                                                    radius: 6
                                                    border.color: parent.parent.activeFocus ? accentColor : "#606060"
                                                    border.width: 1

                                                    Behavior on border.color { ColorAnimation { duration: 200 } }
                                                }
                                            }
                                        }

                                        // Artist Input Field
                                        Row {
                                            width: parent.width
                                            spacing: 8

                                            Text {
                                                text: "Artist:"
                                                font.pixelSize: 12
                                                color: "#E0E0E0"
                                                width: 60
                                                anchors.verticalCenter: parent.verticalCenter
                                            }

                                            TextField {
                                                text: safeCurrentArtist()
                                                onEditingFinished: if (vehicleData) vehicleData.currentArtist = text
                                                width: parent.width - 70
                                                color: "#FFFFFF"
                                                font.pixelSize: 12
                                                background: Rectangle {
                                                    color: "#2A2A2A"
                                                    radius: 6
                                                    border.color: parent.parent.activeFocus ? accentColor : "#606060"
                                                    border.width: 1

                                                    Behavior on border.color { ColorAnimation { duration: 200 } }
                                                }
                                            }
                                        }

                                        // Album Input Field
                                        Row {
                                            width: parent.width
                                            spacing: 8

                                            Text {
                                                text: "Album:"
                                                font.pixelSize: 12
                                                color: "#E0E0E0"
                                                width: 60
                                                anchors.verticalCenter: parent.verticalCenter
                                            }

                                            TextField {
                                                text: safeCurrentAlbum()
                                                onEditingFinished: if (vehicleData) vehicleData.currentAlbum = text
                                                width: parent.width - 70
                                                color: "#FFFFFF"
                                                font.pixelSize: 12
                                                background: Rectangle {
                                                    color: "#2A2A2A"
                                                    radius: 6
                                                    border.color: parent.parent.activeFocus ? accentColor : "#606060"
                                                    border.width: 1

                                                    Behavior on border.color { ColorAnimation { duration: 200 } }
                                                }
                                            }
                                        }
                                    }
                                }

                                // Phone Section
                                Rectangle {
                                    width: parent.width
                                    height: phoneSection.height + 24
                                    radius: 8
                                    color: "#1A1A1A"
                                    border.color: "#404040"
                                    border.width: 1

                                    Column {
                                        id: phoneSection
                                        anchors.left: parent.left
                                        anchors.right: parent.right
                                        anchors.top: parent.top
                                        anchors.margins: 12
                                        spacing: 12

                                        // Phone Connection Status
                                        Row {
                                            width: parent.width
                                            spacing: 12

                                            Rectangle {
                                                width: 40
                                                height: 40
                                                radius: 20
                                                color: safeConnectedPhoneName() !== "No Phone" ? successColor : "#404040"
                                                border.color: safeConnectedPhoneName() !== "No Phone" ? Qt.darker(successColor, 1.2) : "#606060"
                                                border.width: 2

                                                Text {
                                                    text: "📱"
                                                    font.pixelSize: 18
                                                    anchors.centerIn: parent
                                                }

                                                Behavior on color { ColorAnimation { duration: 300 } }
                                            }

                                            Column {
                                                width: parent.width - 120
                                                spacing: 4
                                                anchors.verticalCenter: parent.verticalCenter

                                                Text {
                                                    text: safeConnectedPhoneName()
                                                    font.pixelSize: 14
                                                    font.weight: Font.Bold
                                                    color: "white"
                                                    width: parent.width
                                                    elide: Text.ElideRight
                                                }

                                                Text {
                                                    text: safeConnectedPhoneName() !== "No Phone" ? "Connected" : "Not connected"
                                                    font.pixelSize: 11
                                                    color: safeConnectedPhoneName() !== "No Phone" ? successColor : "#808080"
                                                    width: parent.width
                                                    elide: Text.ElideRight
                                                }
                                            }

                                            // Signal Strength Indicator
                                            Column {
                                                spacing: 2
                                                anchors.verticalCenter: parent.verticalCenter

                                                Text {
                                                    text: "Signal"
                                                    font.pixelSize: 9
                                                    color: "#808080"
                                                    anchors.horizontalCenter: parent.horizontalCenter
                                                }

                                                Row {
                                                    spacing: 2
                                                    anchors.horizontalCenter: parent.horizontalCenter

                                                    Repeater {
                                                        model: 5

                                                        Rectangle {
                                                            width: 3
                                                            height: (index + 1) * 3 + 2
                                                            radius: 1
                                                            color: index < safeSignalStrength() ? successColor : "#404040"

                                                            Behavior on color { ColorAnimation { duration: 200 } }
                                                        }
                                                    }
                                                }
                                            }
                                        }

                                        // Phone Input Field
                                        Row {
                                            width: parent.width
                                            spacing: 8

                                            Text {
                                                text: "Phone:"
                                                font.pixelSize: 12
                                                color: "#E0E0E0"
                                                width: 50
                                                anchors.verticalCenter: parent.verticalCenter
                                            }

                                            TextField {
                                                text: safeConnectedPhoneName()
                                                onEditingFinished: if (vehicleData) vehicleData.connectedPhoneName = text
                                                width: parent.width - 60
                                                color: "#FFFFFF"
                                                font.pixelSize: 12
                                                background: Rectangle {
                                                    color: "#2A2A2A"
                                                    radius: 6
                                                    border.color: parent.parent.activeFocus ? accentColor : "#606060"
                                                    border.width: 1

                                                    Behavior on border.color { ColorAnimation { duration: 200 } }
                                                }
                                            }
                                        }

                                        // Signal Strength Slider
                                        Column {
                                            width: parent.width
                                            spacing: 8

                                            Row {
                                                width: parent.width

                                                Text {
                                                    text: "Signal Strength"
                                                    font.pixelSize: 12
                                                    color: "#E0E0E0"
                                                    width: parent.width - 60
                                                }

                                                Text {
                                                    text: safeSignalStrength().toFixed(0) + "/5"
                                                    font.pixelSize: 14
                                                    font.weight: Font.Bold
                                                    color: safeSignalStrength() < 2 ? errorColor : (safeSignalStrength() < 4 ? warningColor : successColor)
                                                    width: 60
                                                    horizontalAlignment: Text.AlignRight
                                                }
                                            }

                                            Slider {
                                                width: parent.width
                                                from: 0
                                                to: 5
                                                value: safeSignalStrength()
                                                onMoved: if (vehicleData) vehicleData.signalStrength = value

                                                background: Rectangle {
                                                    x: parent.leftPadding
                                                    y: parent.topPadding + parent.availableHeight / 2 - height / 2
                                                    width: parent.availableWidth
                                                    height: 4
                                                    radius: 2
                                                    color: "#404040"

                                                    Rectangle {
                                                        width: parent.parent.visualPosition * parent.width
                                                        height: parent.height
                                                        color: safeSignalStrength() < 2 ? errorColor : (safeSignalStrength() < 4 ? warningColor : successColor)
                                                        radius: 2
                                                    }
                                                }

                                                handle: Rectangle {
                                                    x: parent.leftPadding + parent.visualPosition * (parent.availableWidth - width)
                                                    y: parent.topPadding + parent.availableHeight / 2 - height / 2
                                                    width: 20
                                                    height: 20
                                                    radius: 10
                                                    color: safeSignalStrength() < 2 ? errorColor : (safeSignalStrength() < 4 ? warningColor : successColor)
                                                    border.color: "#FFFFFF"
                                                    border.width: 2
                                                }
                                            }

                                            // Call Status Toggle Buttons
                                            Row {
                                                width: parent.width
                                                spacing: 8

                                                Rectangle {
                                                    width: (parent.width - 16) / 3
                                                    height: 35
                                                    radius: 6
                                                    color: safeCallStatus() === 1 ? accentColor : "#404040"
                                                    border.color: safeCallStatus() === 1 ? Qt.darker(accentColor, 1.2) : "#606060"
                                                    border.width: 1

                                                    Text {
                                                        text: "Incoming"
                                                        font.pixelSize: 10
                                                        color: safeCallStatus() === 1 ? "white" : "#B0B0B0"
                                                        anchors.centerIn: parent
                                                    }

                                                    MouseArea {
                                                        anchors.fill: parent
                                                        onClicked: if (vehicleData) vehicleData.callStatus = safeCallStatus() === 1 ? 0 : 1
                                                    }

                                                    Behavior on color { ColorAnimation { duration: 200 } }
                                                }

                                                Rectangle {
                                                    width: (parent.width - 16) / 3
                                                    height: 35
                                                    radius: 6
                                                    color: safeCallStatus() === 2 ? warningColor : "#404040"
                                                    border.color: safeCallStatus() === 2 ? Qt.darker(warningColor, 1.2) : "#606060"
                                                    border.width: 1

                                                    Text {
                                                        text: "Outgoing"
                                                        font.pixelSize: 10
                                                        color: safeCallStatus() === 2 ? "white" : "#B0B0B0"
                                                        anchors.centerIn: parent
                                                    }

                                                    MouseArea {
                                                        anchors.fill: parent
                                                        onClicked: if (vehicleData) vehicleData.callStatus = safeCallStatus() === 2 ? 0 : 2
                                                    }

                                                    Behavior on color { ColorAnimation { duration: 200 } }
                                                }

                                                Rectangle {
                                                    width: (parent.width - 16) / 3
                                                    height: 35
                                                    radius: 6
                                                    color: safeCallStatus() === 3 ? successColor : "#404040"
                                                    border.color: safeCallStatus() === 3 ? Qt.darker(successColor, 1.2) : "#606060"
                                                    border.width: 1

                                                    Text {
                                                        text: "Active"
                                                        font.pixelSize: 10
                                                        color: safeCallStatus() === 3 ? "white" : "#B0B0B0"
                                                        anchors.centerIn: parent
                                                    }

                                                    MouseArea {
                                                        anchors.fill: parent
                                                        onClicked: if (vehicleData) vehicleData.callStatus = safeCallStatus() === 3 ? 0 : 3
                                                    }

                                                    Behavior on color { ColorAnimation { duration: 200 } }

                                                    // Pulsing effect for active call
                                                    SequentialAnimation on opacity {
                                                        running: safeCallStatus() === 3
                                                        loops: Animation.Infinite
                                                        NumberAnimation { to: 0.7; duration: 1000 }
                                                        NumberAnimation { to: 1.0; duration: 1000 }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }

            // System Status Card
            Rectangle {
                width: parent.width
                height: systemColumn.height + 32
                color: cardColor
                radius: 12

                Column {
                    id: systemColumn
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.margins: 16
                    spacing: 12

                    Text {
                        text: "🖥️ System Status"
                        font.pixelSize: 16
                        font.weight: Font.Bold
                        color: accentColor
                    }

                    Rectangle {
                        width: parent.width
                        height: 1
                        color: "#404040"
                    }

                    Row {
                        width: parent.width
                        spacing: 16

                        Column {
                            spacing: 4
                            width: (parent.width - 16) / 2

                            Text {
                                text: "CPU Load"
                                font.pixelSize: 10
                                color: "#B0B0B0"
                                anchors.horizontalCenter: parent.horizontalCenter
                            }

                            Text {
                                text: safeCpuLoad().toFixed(0) + "%"
                                font.pixelSize: 18
                                font.weight: Font.Bold
                                color: safeCpuLoad() > 80 ? errorColor : (safeCpuLoad() > 60 ? warningColor : successColor)
                                anchors.horizontalCenter: parent.horizontalCenter
                            }

                            Rectangle {
                                width: 60
                                height: 4
                                radius: 2
                                color: "#404040"
                                anchors.horizontalCenter: parent.horizontalCenter

                                Rectangle {
                                    width: parent.width * (safeCpuLoad() / 100)
                                    height: parent.height
                                    radius: 2
                                    color: safeCpuLoad() > 80 ? errorColor : (safeCpuLoad() > 60 ? warningColor : successColor)
                                }
                            }
                        }

                        Column {
                            spacing: 4
                            width: (parent.width - 16) / 2

                            Text {
                                text: "FPS"
                                font.pixelSize: 10
                                color: "#B0B0B0"
                                anchors.horizontalCenter: parent.horizontalCenter
                            }

                            Text {
                                text: safeFps().toFixed(0)
                                font.pixelSize: 18
                                font.weight: Font.Bold
                                color: safeFps() < 30 ? errorColor : (safeFps() < 60 ? warningColor : successColor)
                                anchors.horizontalCenter: parent.horizontalCenter
                            }

                            Rectangle {
                                width: 60
                                height: 4
                                radius: 2
                                color: "#404040"
                                anchors.horizontalCenter: parent.horizontalCenter

                                Rectangle {
                                    width: parent.width * (safeFps() / 120)
                                    height: parent.height
                                    radius: 2
                                    color: safeFps() < 30 ? errorColor : (safeFps() < 60 ? warningColor : successColor)
                                }
                            }
                        }
                    }

                    Rectangle {
                        width: parent.width
                        height: 1
                        color: "#404040"
                    }

                    Row {
                        width: parent.width
                        spacing: 16

                        Row {
                            spacing: 8

                            Rectangle {
                                width: 12
                                height: 12
                                radius: 6
                                color: !safeCanError() ? successColor : errorColor
                                anchors.verticalCenter: parent.verticalCenter

                                SequentialAnimation on opacity {
                                    running: !safeCanError()
                                    loops: Animation.Infinite
                                    NumberAnimation { to: 0.5; duration: 1000 }
                                    NumberAnimation { to: 1.0; duration: 1000 }
                                }
                            }

                            Text {
                                text: "CAN Bus"
                                font.pixelSize: 12
                                color: !safeCanError() ? successColor : errorColor
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }

                        Row {
                            spacing: 8

                            Rectangle {
                                width: 12
                                height: 12
                                radius: 6
                                color: successColor
                                anchors.verticalCenter: parent.verticalCenter

                                SequentialAnimation on opacity {
                                    running: true
                                    loops: Animation.Infinite
                                    NumberAnimation { to: 0.5; duration: 1000 }
                                    NumberAnimation { to: 1.0; duration: 1000 }
                                }
                            }

                            Text {
                                text: "Connected"
                                font.pixelSize: 12
                                color: successColor
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }

                        Row {
                            spacing: 8

                            Rectangle {
                                width: 12
                                height: 12
                                radius: 6
                                color: safeCruiseControlActive() ? successColor : "#606060"
                                anchors.verticalCenter: parent.verticalCenter

                                SequentialAnimation on opacity {
                                    running: safeCruiseControlActive()
                                    loops: Animation.Infinite
                                    NumberAnimation { to: 0.5; duration: 1000 }
                                    NumberAnimation { to: 1.0; duration: 1000 }
                                }
                            }

                            Text {
                                text: "Cruise Control"
                                font.pixelSize: 12
                                color: safeCruiseControlActive() ? successColor : "#B0B0B0"
                                anchors.verticalCenter: parent.verticalCenter
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: if (vehicleData) vehicleData.cruiseControlActive = !safeCruiseControlActive()
                            }
                        }
                    }
                }
            }

            // Bottom spacer
            Item { height: 20; width: 1 }
        }
        }
    }
}
