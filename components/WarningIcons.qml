import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    id: warningIcons

    property string position: "bottom" // top, bottom, left, right

    property int iconSize: 36
    property int maxIconsPerRow: 8

    // Список активных предупреждений (вычисляемое свойство)
    readonly property var activeWarnings: {
        var warnings = []

        if (!vehicleData) return warnings

        // Диагностика двигателя
        if (vehicleData.checkEngine) warnings.push("check")
        if (vehicleData.absFault) warnings.push("abs")
        if (vehicleData.espFault) warnings.push("esp")
        if (vehicleData.canError) warnings.push("can")
        if (vehicleData.steeringFault) warnings.push("steering")
        if (vehicleData.glowPlugActive) warnings.push("glow_plug")
        if (vehicleData.dpfWarning) warnings.push("dpf")
        if (vehicleData.catalystOverheat) warnings.push("catalyst")
        if (vehicleData.fuelFilterFault) warnings.push("fuel_filter")
        if (vehicleData.transmissionFault) warnings.push("transmission")
        if (vehicleData.waterInFuel) warnings.push("water_fuel")

        // Системные предупреждения
        if (vehicleData.lowFuelWarning) warnings.push("fuel")
        if (vehicleData.lowOilPressureWarning) warnings.push("oil")
        if (vehicleData.lowOilPressure) warnings.push("oil_pressure")
        if (vehicleData.highEngineTempWarning) warnings.push("temp")
        if (vehicleData.overheatWarning) warnings.push("overheat")
        if (vehicleData.batteryFault) warnings.push("battery")
        if (vehicleData.washerFluidLow) warnings.push("washer")
        if (vehicleData.brakePadWear) warnings.push("brake_pad")
        if (vehicleData.airFilterClogged) warnings.push("air_filter")

        // Безопасность
        if (vehicleData.airbagFault) warnings.push("airbag")
        if (vehicleData.seatbeltUnfastened) warnings.push("seatbelt")
        if (vehicleData.parkingBrake) warnings.push("parking")
        if (vehicleData.steeringLock) warnings.push("steering_lock")
        if (vehicleData.stabilityControlOff) warnings.push("stability_off")

        // Двери и капот
        if (vehicleData.hoodOpen) warnings.push("hood")
        if (vehicleData.trunkOpen) warnings.push("trunk")
        if (vehicleData.doorsOpen.some(door => door)) warnings.push("door")

        // Освещение
        if (vehicleData.fogLightsFrontActive) warnings.push("fog_front")
        if (vehicleData.fogLightsRearActive) warnings.push("fog_rear")
        if (vehicleData.highBeamActive) warnings.push("high_beam")
        if (vehicleData.exteriorLightFault) warnings.push("light_fault")
        if (vehicleData.headlightLevelFault) warnings.push("headlight_fault")
        if (vehicleData.adaptiveHeadlights) warnings.push("adaptive_light")

        // TPMS и шины
        if (vehicleData.tpmsWarning) warnings.push("tpms")
        if (vehicleData.tpmsPressures.some(p => p < 1.8 || p > 3.2)) warnings.push("tire")

        // Погодные условия
        if (vehicleData.rainLightSensor) warnings.push("rain_sensor")
        if (vehicleData.frostWarning) warnings.push("frost")
        if (vehicleData.frontDefrost) warnings.push("front_defrost")
        if (vehicleData.rearDefrost) warnings.push("rear_defrost")
        if (vehicleData.autoWipe) warnings.push("auto_wipe")
        if (vehicleData.winterMode) warnings.push("winter")

        // Дополнительные системы
        if (vehicleData.trailerConnected) warnings.push("trailer")
        if (vehicleData.airSuspensionWarning) warnings.push("air_suspension")
        if (vehicleData.laneAssist) warnings.push("lane_assist")
        if (vehicleData.spoilerFault) warnings.push("spoiler")
        if (vehicleData.convertibleRoofFault) warnings.push("convertible")
        if (vehicleData.ecoMode) warnings.push("eco")
        if (vehicleData.hillDescentControl) warnings.push("hill_descent")
        if (vehicleData.speedLimiter) warnings.push("speed_limiter")
        if (vehicleData.suspensionDamping) warnings.push("suspension")

        // Ключ и безопасность
        if (vehicleData.keyDetected) warnings.push("key_detected")
        if (vehicleData.keyBatteryLow) warnings.push("key_battery")
        if (vehicleData.distanceWarning) warnings.push("distance")

        // Педали
        if (vehicleData.clutchPedal) warnings.push("clutch")
        if (vehicleData.brakePedal) warnings.push("brake")

        // Информационные сообщения
        if (vehicleData.infoMessage) warnings.push("info")

        return warnings
    }

    Column {
        spacing: 8

        anchors {
            horizontalCenter: (position === "top" || position === "bottom") ? parent.horizontalCenter : undefined
            verticalCenter: (position === "left" || position === "right") ? parent.verticalCenter : undefined
            bottom: position === "bottom" ? parent.bottom : undefined
            top: position === "top" ? parent.top : undefined
            left: position === "left" ? parent.left : undefined
            right: position === "right" ? parent.right : undefined
            margins: 10
        }

        Repeater {
            model: Math.ceil(activeWarnings.length / maxIconsPerRow)

            Row {
                spacing: 14
                property int rowIndex: index

                Repeater {
                    model: Math.min(maxIconsPerRow, activeWarnings.length - (rowIndex * maxIconsPerRow))

                    Image {
                        width: iconSize
                        height: iconSize
                        fillMode: Image.PreserveAspectFit

                        source: {
                            var warningIndex = rowIndex * maxIconsPerRow + index
                            var warning = activeWarnings[warningIndex]

                            switch(warning) {
                                // Основные предупреждения
                                case "check": return "qrc:/image/check.png"
                                case "abs": return "qrc:/image/abs.png"
                                case "esp": return "qrc:/image/esp.png"
                                case "can": return "qrc:/image/can_error.png"
                                case "steering": return "qrc:/image/steering.png"
                                case "glow_plug": return "qrc:/image/glow_plug.png"
                                case "dpf": return "qrc:/image/dpf.png"
                                case "catalyst": return "qrc:/image/catalyst.png"
                                case "fuel_filter": return "qrc:/image/fuel.png"
                                case "transmission": return "qrc:/image/transmission.png"
                                case "water_fuel": return "qrc:/image/water_fuel.png"

                                // Системные
                                case "fuel": return "qrc:/image/fuel.png"
                                case "oil": return "qrc:/image/oil.png"
                                case "oil_pressure": return "qrc:/image/oil_pressure_low.png"
                                case "temp": return "qrc:/image/engine_temp.png"
                                case "overheat": return "qrc:/image/overheat.png"
                                case "battery": return "qrc:/image/battery.png"
                                case "washer": return "qrc:/image/washer_fluid.png"
                                case "brake_pad": return "qrc:/image/brake_pad.png"
                                case "air_filter": return "qrc:/image/air_filter.png"

                                // Безопасность
                                case "airbag": return "qrc:/image/airbag.png"
                                case "seatbelt": return "qrc:/image/seatbelt.png"
                                case "parking": return "qrc:/image/parking_brake.png"
                                case "steering_lock": return "qrc:/image/steering_lock.png"
                                case "stability_off": return "qrc:/image/stability_off.png"

                                // Двери и капот
                                case "hood": return "qrc:/image/hood_open.png"
                                case "trunk": return "qrc:/image/trunk_open.png"
                                case "door": return "qrc:/image/cardoor.png"

                                // Освещение
                                case "fog_front": return "qrc:/image/fog_front.png"
                                case "fog_rear": return "qrc:/image/fog_rear.png"
                                case "high_beam": return "qrc:/image/warnings/high_beam.png"
                                case "light_fault": return "qrc:/image/light_fault.png"
                                case "headlight_fault": return "qrc:/image/headlight_fault.png"
                                case "adaptive_light": return "qrc:/image/adaptive_light.png"

                                // Шины
                                case "tpms": return "qrc:/image/tpms.png"
                                case "tire": return "qrc:/image/tire_pressure.png"

                                // Погода
                                case "rain_sensor": return "qrc:/image/rain_sensor.png"
                                case "frost": return "qrc:/image/frost.png"
                                case "front_defrost": return "qrc:/image/front_defrost.png"
                                case "rear_defrost": return "qrc:/image/rear_defrost.png"
                                case "auto_wipe": return "qrc:/image/auto_wipe.png"
                                case "winter": return "qrc:/image/winter.png"

                                // Доп. системы
                                case "trailer": return "qrc:/image/trailer.png"
                                case "air_suspension": return "qrc:/image/air_suspension.png"
                                case "lane_assist": return "qrc:/image/lane_assist.png"
                                case "spoiler": return "qrc:/image/spoiler.png"
                                case "convertible": return "qrc:/image/convertible.png"
                                case "eco": return "qrc:/image/eco.png"
                                case "hill_descent": return "qrc:/image/hill_descent.png"
                                case "speed_limiter": return "qrc:/image/speed_limiter.png"
                                case "suspension": return "qrc:/image/suspension.png"

                                // Ключ
                                case "key_detected": return "qrc:/image/key_detected.png"
                                case "key_battery": return "qrc:/image/key_battery.png"
                                case "distance": return "qrc:/image/distance.png"

                                // Педали
                                case "clutch": return "qrc:/image/clutch.png"
                                case "brake": return "qrc:/image/brake.png"

                                // Информация
                                case "info": return "qrc:/image/info.png"

                                default: return ""
                            }
                        }
                    }
                }
            }
        }
    }
}
