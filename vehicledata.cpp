#include "VehicleData.h"

VehicleData::VehicleData(QObject *parent) : QObject(parent) {}

// Getters
double VehicleData::speed() const { return m_speed; }
int VehicleData::rpm() const { return m_rpm; }
QString VehicleData::gear() const { return m_gear; }
double VehicleData::fuelLevel() const { return m_fuelLevel; }
double VehicleData::temperature() const { return m_temperature; }
int VehicleData::range() const { return m_range; }
double VehicleData::odometer() const { return m_odometer; }
double VehicleData::tripDistance() const { return m_tripDistance; }
bool VehicleData::checkEngine() const { return m_checkEngine; }
bool VehicleData::absFault() const { return m_absFault; }
bool VehicleData::espFault() const { return m_espFault; }
QVector<bool> VehicleData::doorsOpen() const { return m_doorsOpen; }
bool VehicleData::hoodOpen() const { return m_hoodOpen; }
bool VehicleData::trunkOpen() const { return m_trunkOpen; }
bool VehicleData::lowBeam() const { return m_lowBeam; }
bool VehicleData::highBeam() const { return m_highBeam; }
bool VehicleData::fogLightsFront() const { return m_fogLightsFront; }
bool VehicleData::fogLightsRear() const { return m_fogLightsRear; }
bool VehicleData::hazardLights() const { return m_hazardLights; }
bool VehicleData::parkingBrake() const { return m_parkingBrake; }
bool VehicleData::lowFuelWarning() const { return m_lowFuelWarning; }
bool VehicleData::lowOilPressureWarning() const { return m_lowOilPressureWarning; }
bool VehicleData::highEngineTempWarning() const { return m_highEngineTempWarning; }
bool VehicleData::seatbeltUnfastened() const { return m_seatbeltUnfastened; }
bool VehicleData::airbagFault() const { return m_airbagFault; }
bool VehicleData::batteryFault() const { return m_batteryFault; }
bool VehicleData::cruiseControlActive() const { return m_cruiseControlActive; }
bool VehicleData::leftSignalActive() const { return m_leftSignalActive; }
bool VehicleData::rightSignalActive() const { return m_rightSignalActive; }
QVector<float> VehicleData::tpmsTemps() const { return m_tpmsTemps; }
QVector<float> VehicleData::tpmsPressures() const { return m_tpmsPressures; }
float VehicleData::navigationDistance() const { return m_navigationDistance; }
float VehicleData::navigationAngle() const { return m_navigationAngle; }
QString VehicleData::currentTrack() const { return m_currentTrack; }
QString VehicleData::connectedPhoneName() const { return m_connectedPhoneName; }
int VehicleData::signalStrength() const { return m_signalStrength; }
float VehicleData::cpuLoad() const { return m_cpuLoad; }
int VehicleData::fps() const { return m_fps; }
bool VehicleData::canError() const { return m_canError; }
float VehicleData::engineHours() const { return m_engineHours; }
// Music related getters
QString VehicleData::currentArtist() const {
    return m_currentArtist;
}

QString VehicleData::currentAlbum() const {
    return m_currentAlbum;
}

QString VehicleData::albumArt() const {
    return m_albumArt;
}

bool VehicleData::isPlaying() const {
    return m_isPlaying;
}

// Call related getters
VehicleData::CallStatus VehicleData::callStatus() const {
    return m_callStatus;
}

QString VehicleData::callerName() const {
    return m_callerName;
}

QString VehicleData::callerNumber() const {
    return m_callerNumber;
}

int VehicleData::callDuration() const {
    return m_callDuration;
}


bool VehicleData::fogLightsFrontActive() const { return m_fogLightsFrontActive; }
bool VehicleData::fogLightsRearActive() const { return m_fogLightsRearActive; }
bool VehicleData::steeringFault() const { return m_steeringFault; }
bool VehicleData::washerFluidLow() const { return m_washerFluidLow; }
bool VehicleData::brakePadWear() const { return m_brakePadWear; }
bool VehicleData::rainLightSensor() const { return m_rainLightSensor; }
bool VehicleData::winterMode() const { return m_winterMode; }
bool VehicleData::infoMessage() const { return m_infoMessage; }
bool VehicleData::glowPlugActive() const { return m_glowPlugActive; }
bool VehicleData::frostWarning() const { return m_frostWarning; }
bool VehicleData::keyDetected() const { return m_keyDetected; }
bool VehicleData::keyBatteryLow() const { return m_keyBatteryLow; }
bool VehicleData::distanceWarning() const { return m_distanceWarning; }
bool VehicleData::clutchPedal() const { return m_clutchPedal; }
bool VehicleData::brakePedal() const { return m_brakePedal; }
bool VehicleData::steeringLock() const { return m_steeringLock; }
bool VehicleData::highBeamActive() const { return m_highBeamActive; }
bool VehicleData::tpmsWarning() const { return m_tpmsWarning; }
bool VehicleData::exteriorLightFault() const { return m_exteriorLightFault; }
bool VehicleData::dpfWarning() const { return m_dpfWarning; }
bool VehicleData::trailerConnected() const { return m_trailerConnected; }
bool VehicleData::airSuspensionWarning() const { return m_airSuspensionWarning; }
bool VehicleData::laneAssist() const { return m_laneAssist; }
bool VehicleData::catalystOverheat() const { return m_catalystOverheat; }
bool VehicleData::adaptiveHeadlights() const { return m_adaptiveHeadlights; }
bool VehicleData::headlightLevelFault() const { return m_headlightLevelFault; }
bool VehicleData::spoilerFault() const { return m_spoilerFault; }
bool VehicleData::convertibleRoofFault() const { return m_convertibleRoofFault; }
bool VehicleData::waterInFuel() const { return m_waterInFuel; }
bool VehicleData::airFilterClogged() const { return m_airFilterClogged; }
bool VehicleData::ecoMode() const { return m_ecoMode; }
bool VehicleData::hillDescentControl() const { return m_hillDescentControl; }
bool VehicleData::overheatWarning() const { return m_overheatWarning; }
bool VehicleData::fuelFilterFault() const { return m_fuelFilterFault; }
bool VehicleData::transmissionFault() const { return m_transmissionFault; }
bool VehicleData::speedLimiter() const { return m_speedLimiter; }
bool VehicleData::suspensionDamping() const { return m_suspensionDamping; }
bool VehicleData::lowOilPressure() const { return m_lowOilPressure; }
bool VehicleData::frontDefrost() const { return m_frontDefrost; }
bool VehicleData::rearDefrost() const { return m_rearDefrost; }
bool VehicleData::autoWipe() const { return m_autoWipe; }
bool VehicleData::stabilityControlOff() const { return m_stabilityControlOff; }



// Setters
void VehicleData::setSpeed(double newSpeed) {
    if (m_speed == newSpeed)
        return;
    m_speed = newSpeed;
    emit speedChanged();
}

void VehicleData::setRpm(int newRpm) {
    if (m_rpm == newRpm)
        return;
    m_rpm = newRpm;
    emit rpmChanged();
}

void VehicleData::setGear(const QString &newGear) {
    if (m_gear == newGear)
        return;
    m_gear = newGear;
    emit gearChanged();
}

void VehicleData::setFuelLevel(double newFuel) {
    if (m_fuelLevel == newFuel)
        return;
    m_fuelLevel = newFuel;
    emit fuelLevelChanged();
}

void VehicleData::setTemperature(double newTemp) {
    if (m_temperature == newTemp)
        return;
    m_temperature = newTemp;
    emit temperatureChanged();
}

void VehicleData::setRange(int newRange) {
    if (m_range == newRange)
        return;
    m_range = newRange;
    emit rangeChanged();
}
void VehicleData::setOdometer(double value) {
    if (m_odometer == value) return;
    m_odometer = value;
    emit odometerChanged();
}

void VehicleData::setTripDistance(double value) {
    if (m_tripDistance == value) return;
    m_tripDistance = value;
    emit tripDistanceChanged();
}

void VehicleData::setCheckEngine(bool value) {
    if (m_checkEngine == value) return;
    m_checkEngine = value;
    emit checkEngineChanged();
}

void VehicleData::setAbsFault(bool value) {
    if (m_absFault == value) return;
    m_absFault = value;
    emit absFaultChanged();
}

void VehicleData::setEspFault(bool value) {
    if (m_espFault == value) return;
    m_espFault = value;
    emit espFaultChanged();
}

void VehicleData::setDoorsOpen(const QVector<bool> &value) {
    if (m_doorsOpen == value) return;
    m_doorsOpen = value;
    emit doorsOpenChanged();
}

void VehicleData::setHoodOpen(bool value) {
    if (m_hoodOpen == value) return;
    m_hoodOpen = value;
    emit hoodOpenChanged();
}

void VehicleData::setTrunkOpen(bool value) {
    if (m_trunkOpen == value) return;
    m_trunkOpen = value;
    emit trunkOpenChanged();
}

void VehicleData::setLowBeam(bool value) {
    if (m_lowBeam == value) return;
    m_lowBeam = value;
    emit lowBeamChanged();
}

void VehicleData::setHighBeam(bool value) {
    if (m_highBeam == value) return;
    m_highBeam = value;
    emit highBeamChanged();
}

void VehicleData::setFogLightsFront(bool value) {
    if (m_fogLightsFront == value) return;
    m_fogLightsFront = value;
    emit fogLightsFrontChanged();
}

void VehicleData::setFogLightsRear(bool value) {
    if (m_fogLightsRear == value) return;
    m_fogLightsRear = value;
    emit fogLightsRearChanged();
}

void VehicleData::setHazardLights(bool value) {
    if (m_hazardLights == value) return;
    m_hazardLights = value;
    emit hazardLightsChanged();
}

void VehicleData::setParkingBrake(bool value) {
    if (m_parkingBrake == value) return;
    m_parkingBrake = value;
    emit parkingBrakeChanged();
}

void VehicleData::setLowFuelWarning(bool value) {
    if (m_lowFuelWarning == value) return;
    m_lowFuelWarning = value;
    emit lowFuelWarningChanged();
}

void VehicleData::setLowOilPressureWarning(bool value) {
    if (m_lowOilPressureWarning == value) return;
    m_lowOilPressureWarning = value;
    emit lowOilPressureWarningChanged();
}

void VehicleData::setHighEngineTempWarning(bool value) {
    if (m_highEngineTempWarning == value) return;
    m_highEngineTempWarning = value;
    emit highEngineTempWarningChanged();
}

void VehicleData::setSeatbeltUnfastened(bool value) {
    if (m_seatbeltUnfastened == value) return;
    m_seatbeltUnfastened = value;
    emit seatbeltUnfastenedChanged();
}

void VehicleData::setAirbagFault(bool value) {
    if (m_airbagFault == value) return;
    m_airbagFault = value;
    emit airbagFaultChanged();
}

void VehicleData::setBatteryFault(bool value) {
    if (m_batteryFault == value) return;
    m_batteryFault = value;
    emit batteryFaultChanged();
}

void VehicleData::setCruiseControlActive(bool value) {
    if (m_cruiseControlActive == value) return;
    m_cruiseControlActive = value;
    emit cruiseControlActiveChanged();
}

void VehicleData::setLeftSignalActive(bool value) {
    if (m_leftSignalActive == value) return;
    m_leftSignalActive = value;
    emit leftSignalActiveChanged();
}

void VehicleData::setRightSignalActive(bool value) {
    if (m_rightSignalActive == value) return;
    m_rightSignalActive = value;
    emit rightSignalActiveChanged();
}

void VehicleData::setTpmsTemps(const QVector<float> &value) {
    if (m_tpmsTemps == value) return;
    m_tpmsTemps = value;
    emit tpmsTempsChanged();
}

void VehicleData::setTpmsPressures(const QVector<float> &value) {
    if (m_tpmsPressures == value) return;
    m_tpmsPressures = value;
    emit tpmsPressuresChanged();
}

void VehicleData::setNavigationDistance(float value) {
    if (m_navigationDistance == value) return;
    m_navigationDistance = value;
    emit navigationDistanceChanged();
}

void VehicleData::setNavigationAngle(float value) {
    if (m_navigationAngle == value) return;
    m_navigationAngle = value;
    emit navigationAngleChanged();
}

void VehicleData::setCurrentTrack(const QString &value) {
    if (m_currentTrack == value) return;
    m_currentTrack = value;
    emit currentTrackChanged();
}

void VehicleData::setConnectedPhoneName(const QString &value) {
    if (m_connectedPhoneName == value) return;
    m_connectedPhoneName = value;
    emit connectedPhoneNameChanged();
}

void VehicleData::setSignalStrength(int value) {
    if (m_signalStrength == value) return;
    m_signalStrength = value;
    emit signalStrengthChanged();
}

void VehicleData::setCpuLoad(float value) {
    if (m_cpuLoad == value) return;
    m_cpuLoad = value;
    emit cpuLoadChanged();
}

void VehicleData::setFps(int value) {
    if (m_fps == value) return;
    m_fps = value;
    emit fpsChanged();
}

void VehicleData::setCanError(bool value) {
    if (m_canError == value) return;
    m_canError = value;
    emit canErrorChanged();
}

void VehicleData::setEngineHours(float value) {
    if (m_engineHours == value) return;
    m_engineHours = value;
    emit engineHoursChanged();
}

// Music related setters
void VehicleData::setCurrentArtist(const QString &artist) {
    if (m_currentArtist != artist) {
        m_currentArtist = artist;
        emit currentArtistChanged();
    }
}

void VehicleData::setCurrentAlbum(const QString &album) {
    if (m_currentAlbum != album) {
        m_currentAlbum = album;
        emit currentAlbumChanged();
    }
}

void VehicleData::setAlbumArt(const QString &art) {
    if (m_albumArt != art) {
        m_albumArt = art;
        emit albumArtChanged();
    }
}

void VehicleData::setIsPlaying(bool playing) {
    if (m_isPlaying != playing) {
        m_isPlaying = playing;
        emit isPlayingChanged();
    }
}

// Call related setters
void VehicleData::setCallStatus(CallStatus status) {
    if (m_callStatus != status) {
        m_callStatus = status;
        emit callStatusChanged();

        // Сброс длительности при завершении звонка
        if (status == NoCall || status == CallEnded ||
            status == MissedCall || status == CallRejected) {
            setCallDuration(0);
        }
    }
}

void VehicleData::setCallerName(const QString &name) {
    if (m_callerName != name) {
        m_callerName = name;
        emit callerNameChanged();
    }
}

void VehicleData::setCallerNumber(const QString &number) {
    if (m_callerNumber != number) {
        m_callerNumber = number;
        emit callerNumberChanged();
    }
}

void VehicleData::setCallDuration(int duration) {
    if (m_callDuration != duration) {
        m_callDuration = duration;
        emit callDurationChanged();
    }
}

void VehicleData::setFogLightsFrontActive(bool active) {
    if (m_fogLightsFrontActive != active) {
        m_fogLightsFrontActive = active;
        emit fogLightsFrontActiveChanged();
    }
}

void VehicleData::setFogLightsRearActive(bool active) {
    if (m_fogLightsRearActive != active) {
        m_fogLightsRearActive = active;
        emit fogLightsRearActiveChanged();
    }
}

void VehicleData::setSteeringFault(bool fault) {
    if (m_steeringFault != fault) {
        m_steeringFault = fault;
        emit steeringFaultChanged();
    }
}

void VehicleData::setWasherFluidLow(bool low) {
    if (m_washerFluidLow != low) {
        m_washerFluidLow = low;
        emit washerFluidLowChanged();
    }
}

void VehicleData::setBrakePadWear(bool wear) {
    if (m_brakePadWear != wear) {
        m_brakePadWear = wear;
        emit brakePadWearChanged();
    }
}

void VehicleData::setRainLightSensor(bool active) {
    if (m_rainLightSensor != active) {
        m_rainLightSensor = active;
        emit rainLightSensorChanged();
    }
}

void VehicleData::setWinterMode(bool active) {
    if (m_winterMode != active) {
        m_winterMode = active;
        emit winterModeChanged();
    }
}

void VehicleData::setInfoMessage(bool active) {
    if (m_infoMessage != active) {
        m_infoMessage = active;
        emit infoMessageChanged();
    }
}

void VehicleData::setGlowPlugActive(bool active) {
    if (m_glowPlugActive != active) {
        m_glowPlugActive = active;
        emit glowPlugActiveChanged();
    }
}

void VehicleData::setFrostWarning(bool active) {
    if (m_frostWarning != active) {
        m_frostWarning = active;
        emit frostWarningChanged();
    }
}

void VehicleData::setKeyDetected(bool detected) {
    if (m_keyDetected != detected) {
        m_keyDetected = detected;
        emit keyDetectedChanged();
    }
}

void VehicleData::setKeyBatteryLow(bool low) {
    if (m_keyBatteryLow != low) {
        m_keyBatteryLow = low;
        emit keyBatteryLowChanged();
    }
}

void VehicleData::setDistanceWarning(bool warning) {
    if (m_distanceWarning != warning) {
        m_distanceWarning = warning;
        emit distanceWarningChanged();
    }
}

void VehicleData::setClutchPedal(bool pressed) {
    if (m_clutchPedal != pressed) {
        m_clutchPedal = pressed;
        emit clutchPedalChanged();
    }
}

void VehicleData::setBrakePedal(bool pressed) {
    if (m_brakePedal != pressed) {
        m_brakePedal = pressed;
        emit brakePedalChanged();
    }
}

void VehicleData::setSteeringLock(bool locked) {
    if (m_steeringLock != locked) {
        m_steeringLock = locked;
        emit steeringLockChanged();
    }
}

void VehicleData::setHighBeamActive(bool active) {
    if (m_highBeamActive != active) {
        m_highBeamActive = active;
        emit highBeamActiveChanged();
    }
}

void VehicleData::setTpmsWarning(bool warning) {
    if (m_tpmsWarning != warning) {
        m_tpmsWarning = warning;
        emit tpmsWarningChanged();
    }
}

void VehicleData::setExteriorLightFault(bool fault) {
    if (m_exteriorLightFault != fault) {
        m_exteriorLightFault = fault;
        emit exteriorLightFaultChanged();
    }
}

void VehicleData::setDpfWarning(bool warning) {
    if (m_dpfWarning != warning) {
        m_dpfWarning = warning;
        emit dpfWarningChanged();
    }
}

void VehicleData::setTrailerConnected(bool connected) {
    if (m_trailerConnected != connected) {
        m_trailerConnected = connected;
        emit trailerConnectedChanged();
    }
}

void VehicleData::setAirSuspensionWarning(bool warning) {
    if (m_airSuspensionWarning != warning) {
        m_airSuspensionWarning = warning;
        emit airSuspensionWarningChanged();
    }
}

void VehicleData::setLaneAssist(bool active) {
    if (m_laneAssist != active) {
        m_laneAssist = active;
        emit laneAssistChanged();
    }
}

void VehicleData::setCatalystOverheat(bool overheat) {
    if (m_catalystOverheat != overheat) {
        m_catalystOverheat = overheat;
        emit catalystOverheatChanged();
    }
}

void VehicleData::setAdaptiveHeadlights(bool active) {
    if (m_adaptiveHeadlights != active) {
        m_adaptiveHeadlights = active;
        emit adaptiveHeadlightsChanged();
    }
}

void VehicleData::setHeadlightLevelFault(bool fault) {
    if (m_headlightLevelFault != fault) {
        m_headlightLevelFault = fault;
        emit headlightLevelFaultChanged();
    }
}

void VehicleData::setSpoilerFault(bool fault) {
    if (m_spoilerFault != fault) {
        m_spoilerFault = fault;
        emit spoilerFaultChanged();
    }
}

void VehicleData::setConvertibleRoofFault(bool fault) {
    if (m_convertibleRoofFault != fault) {
        m_convertibleRoofFault = fault;
        emit convertibleRoofFaultChanged();
    }
}

void VehicleData::setWaterInFuel(bool detected) {
    if (m_waterInFuel != detected) {
        m_waterInFuel = detected;
        emit waterInFuelChanged();
    }
}

void VehicleData::setAirFilterClogged(bool clogged) {
    if (m_airFilterClogged != clogged) {
        m_airFilterClogged = clogged;
        emit airFilterCloggedChanged();
    }
}

void VehicleData::setEcoMode(bool active) {
    if (m_ecoMode != active) {
        m_ecoMode = active;
        emit ecoModeChanged();
    }
}

void VehicleData::setHillDescentControl(bool active) {
    if (m_hillDescentControl != active) {
        m_hillDescentControl = active;
        emit hillDescentControlChanged();
    }
}

void VehicleData::setOverheatWarning(bool warning) {
    if (m_overheatWarning != warning) {
        m_overheatWarning = warning;
        emit overheatWarningChanged();
    }
}

void VehicleData::setFuelFilterFault(bool fault) {
    if (m_fuelFilterFault != fault) {
        m_fuelFilterFault = fault;
        emit fuelFilterFaultChanged();
    }
}

void VehicleData::setTransmissionFault(bool fault) {
    if (m_transmissionFault != fault) {
        m_transmissionFault = fault;
        emit transmissionFaultChanged();
    }
}

void VehicleData::setSpeedLimiter(bool active) {
    if (m_speedLimiter != active) {
        m_speedLimiter = active;
        emit speedLimiterChanged();
    }
}

void VehicleData::setSuspensionDamping(bool active) {
    if (m_suspensionDamping != active) {
        m_suspensionDamping = active;
        emit suspensionDampingChanged();
    }
}

void VehicleData::setLowOilPressure(bool low) {
    if (m_lowOilPressure != low) {
        m_lowOilPressure = low;
        emit lowOilPressureChanged();
    }
}

void VehicleData::setFrontDefrost(bool active) {
    if (m_frontDefrost != active) {
        m_frontDefrost = active;
        emit frontDefrostChanged();
    }
}

void VehicleData::setRearDefrost(bool active) {
    if (m_rearDefrost != active) {
        m_rearDefrost = active;
        emit rearDefrostChanged();
    }
}

void VehicleData::setAutoWipe(bool active) {
    if (m_autoWipe != active) {
        m_autoWipe = active;
        emit autoWipeChanged();
    }
}

void VehicleData::setStabilityControlOff(bool off) {
    if (m_stabilityControlOff != off) {
        m_stabilityControlOff = off;
        emit stabilityControlOffChanged();
    }
}
