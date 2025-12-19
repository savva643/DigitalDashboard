#ifndef VEHICLEDATA_H
#define VEHICLEDATA_H

#pragma once

#include <QObject>
#include <QString>
#include <QVector>

class VehicleData : public QObject {
    Q_OBJECT

    // Основные параметры
    Q_PROPERTY(double speed READ speed WRITE setSpeed NOTIFY speedChanged)
    Q_PROPERTY(int rpm READ rpm WRITE setRpm NOTIFY rpmChanged)
    Q_PROPERTY(QString gear READ gear WRITE setGear NOTIFY gearChanged)
    Q_PROPERTY(double fuelLevel READ fuelLevel WRITE setFuelLevel NOTIFY fuelLevelChanged)
    Q_PROPERTY(double temperature READ temperature WRITE setTemperature NOTIFY temperatureChanged)
    Q_PROPERTY(int range READ range WRITE setRange NOTIFY rangeChanged)
    Q_PROPERTY(double odometer READ odometer WRITE setOdometer NOTIFY odometerChanged)
    Q_PROPERTY(double tripDistance READ tripDistance WRITE setTripDistance NOTIFY tripDistanceChanged)

    // Диагностика двигателя и ошибок
    Q_PROPERTY(bool checkEngine READ checkEngine WRITE setCheckEngine NOTIFY checkEngineChanged)
    Q_PROPERTY(bool absFault READ absFault WRITE setAbsFault NOTIFY absFaultChanged)
    Q_PROPERTY(bool espFault READ espFault WRITE setEspFault NOTIFY espFaultChanged)

    // Открытые компоненты кузова
    Q_PROPERTY(QVector<bool> doorsOpen READ doorsOpen WRITE setDoorsOpen NOTIFY doorsOpenChanged)  // FL, FR, RL, RR
    Q_PROPERTY(bool hoodOpen READ hoodOpen WRITE setHoodOpen NOTIFY hoodOpenChanged)
    Q_PROPERTY(bool trunkOpen READ trunkOpen WRITE setTrunkOpen NOTIFY trunkOpenChanged)

    // Освещение
    Q_PROPERTY(bool lowBeam READ lowBeam WRITE setLowBeam NOTIFY lowBeamChanged)
    Q_PROPERTY(bool highBeam READ highBeam WRITE setHighBeam NOTIFY highBeamChanged)
    Q_PROPERTY(bool fogLightsFront READ fogLightsFront WRITE setFogLightsFront NOTIFY fogLightsFrontChanged)
    Q_PROPERTY(bool fogLightsRear READ fogLightsRear WRITE setFogLightsRear NOTIFY fogLightsRearChanged)
    Q_PROPERTY(bool hazardLights READ hazardLights WRITE setHazardLights NOTIFY hazardLightsChanged)

    // Прочие предупреждения
    Q_PROPERTY(bool parkingBrake READ parkingBrake WRITE setParkingBrake NOTIFY parkingBrakeChanged)
    Q_PROPERTY(bool lowFuelWarning READ lowFuelWarning WRITE setLowFuelWarning NOTIFY lowFuelWarningChanged)
    Q_PROPERTY(bool lowOilPressureWarning READ lowOilPressureWarning WRITE setLowOilPressureWarning NOTIFY lowOilPressureWarningChanged)
    Q_PROPERTY(bool highEngineTempWarning READ highEngineTempWarning WRITE setHighEngineTempWarning NOTIFY highEngineTempWarningChanged)
    Q_PROPERTY(bool seatbeltUnfastened READ seatbeltUnfastened WRITE setSeatbeltUnfastened NOTIFY seatbeltUnfastenedChanged)
    Q_PROPERTY(bool airbagFault READ airbagFault WRITE setAirbagFault NOTIFY airbagFaultChanged)
    Q_PROPERTY(bool batteryFault READ batteryFault WRITE setBatteryFault NOTIFY batteryFaultChanged)
    Q_PROPERTY(bool cruiseControlActive READ cruiseControlActive WRITE setCruiseControlActive NOTIFY cruiseControlActiveChanged)

    // Поворотники
    Q_PROPERTY(bool leftSignalActive READ leftSignalActive WRITE setLeftSignalActive NOTIFY leftSignalActiveChanged)
    Q_PROPERTY(bool rightSignalActive READ rightSignalActive WRITE setRightSignalActive NOTIFY rightSignalActiveChanged)

    // TPMS (шины)
    Q_PROPERTY(QVector<float> tpmsTemps READ tpmsTemps WRITE setTpmsTemps NOTIFY tpmsTempsChanged)
    Q_PROPERTY(QVector<float> tpmsPressures READ tpmsPressures WRITE setTpmsPressures NOTIFY tpmsPressuresChanged)

    // Навигация
    Q_PROPERTY(float navigationDistance READ navigationDistance WRITE setNavigationDistance NOTIFY navigationDistanceChanged)
    Q_PROPERTY(float navigationAngle READ navigationAngle WRITE setNavigationAngle NOTIFY navigationAngleChanged)

    // Мультимедиа и связь
    Q_PROPERTY(QString currentTrack READ currentTrack WRITE setCurrentTrack NOTIFY currentTrackChanged)
    Q_PROPERTY(QString connectedPhoneName READ connectedPhoneName WRITE setConnectedPhoneName NOTIFY connectedPhoneNameChanged)
    Q_PROPERTY(int signalStrength READ signalStrength WRITE setSignalStrength NOTIFY signalStrengthChanged)
    Q_PROPERTY(QString currentArtist READ currentArtist WRITE setCurrentArtist NOTIFY currentArtistChanged)
    Q_PROPERTY(QString currentAlbum READ currentAlbum WRITE setCurrentAlbum NOTIFY currentAlbumChanged)
    Q_PROPERTY(QString albumArt READ albumArt WRITE setAlbumArt NOTIFY albumArtChanged)
    Q_PROPERTY(bool isPlaying READ isPlaying WRITE setIsPlaying NOTIFY isPlayingChanged)
    Q_PROPERTY(int trackCurrentTime READ trackCurrentTime WRITE setTrackCurrentTime NOTIFY trackCurrentTimeChanged) // в секундах
    Q_PROPERTY(int trackTotalTime READ trackTotalTime WRITE setTrackTotalTime NOTIFY trackTotalTimeChanged) // в секундах

    // Звонки
    Q_PROPERTY(CallStatus callStatus READ callStatus WRITE setCallStatus NOTIFY callStatusChanged)
    Q_PROPERTY(QString callerName READ callerName WRITE setCallerName NOTIFY callerNameChanged)
    Q_PROPERTY(QString callerNumber READ callerNumber WRITE setCallerNumber NOTIFY callerNumberChanged)
    Q_PROPERTY(int callDuration READ callDuration WRITE setCallDuration NOTIFY callDurationChanged)

    // Системные параметры
    Q_PROPERTY(float cpuLoad READ cpuLoad WRITE setCpuLoad NOTIFY cpuLoadChanged)
    Q_PROPERTY(int fps READ fps WRITE setFps NOTIFY fpsChanged)
    Q_PROPERTY(bool canError READ canError WRITE setCanError NOTIFY canErrorChanged)
    Q_PROPERTY(float engineHours READ engineHours WRITE setEngineHours NOTIFY engineHoursChanged)

    Q_PROPERTY(bool fogLightsFrontActive READ fogLightsFrontActive WRITE setFogLightsFrontActive NOTIFY fogLightsFrontActiveChanged)
    Q_PROPERTY(bool fogLightsRearActive READ fogLightsRearActive WRITE setFogLightsRearActive NOTIFY fogLightsRearActiveChanged)
    Q_PROPERTY(bool steeringFault READ steeringFault WRITE setSteeringFault NOTIFY steeringFaultChanged)
    Q_PROPERTY(bool washerFluidLow READ washerFluidLow WRITE setWasherFluidLow NOTIFY washerFluidLowChanged)
    Q_PROPERTY(bool brakePadWear READ brakePadWear WRITE setBrakePadWear NOTIFY brakePadWearChanged)
    Q_PROPERTY(bool rainLightSensor READ rainLightSensor WRITE setRainLightSensor NOTIFY rainLightSensorChanged)
    Q_PROPERTY(bool winterMode READ winterMode WRITE setWinterMode NOTIFY winterModeChanged)
    Q_PROPERTY(bool infoMessage READ infoMessage WRITE setInfoMessage NOTIFY infoMessageChanged)
    Q_PROPERTY(bool glowPlugActive READ glowPlugActive WRITE setGlowPlugActive NOTIFY glowPlugActiveChanged)
    Q_PROPERTY(bool frostWarning READ frostWarning WRITE setFrostWarning NOTIFY frostWarningChanged)
    Q_PROPERTY(bool keyDetected READ keyDetected WRITE setKeyDetected NOTIFY keyDetectedChanged)
    Q_PROPERTY(bool keyBatteryLow READ keyBatteryLow WRITE setKeyBatteryLow NOTIFY keyBatteryLowChanged)
    Q_PROPERTY(bool distanceWarning READ distanceWarning WRITE setDistanceWarning NOTIFY distanceWarningChanged)
    Q_PROPERTY(bool clutchPedal READ clutchPedal WRITE setClutchPedal NOTIFY clutchPedalChanged)
    Q_PROPERTY(bool brakePedal READ brakePedal WRITE setBrakePedal NOTIFY brakePedalChanged)
    Q_PROPERTY(bool steeringLock READ steeringLock WRITE setSteeringLock NOTIFY steeringLockChanged)
    Q_PROPERTY(bool highBeamActive READ highBeamActive WRITE setHighBeamActive NOTIFY highBeamActiveChanged)
    Q_PROPERTY(bool tpmsWarning READ tpmsWarning WRITE setTpmsWarning NOTIFY tpmsWarningChanged)
    Q_PROPERTY(bool exteriorLightFault READ exteriorLightFault WRITE setExteriorLightFault NOTIFY exteriorLightFaultChanged)
    Q_PROPERTY(bool dpfWarning READ dpfWarning WRITE setDpfWarning NOTIFY dpfWarningChanged)
    Q_PROPERTY(bool trailerConnected READ trailerConnected WRITE setTrailerConnected NOTIFY trailerConnectedChanged)
    Q_PROPERTY(bool airSuspensionWarning READ airSuspensionWarning WRITE setAirSuspensionWarning NOTIFY airSuspensionWarningChanged)
    Q_PROPERTY(bool laneAssist READ laneAssist WRITE setLaneAssist NOTIFY laneAssistChanged)
    Q_PROPERTY(bool catalystOverheat READ catalystOverheat WRITE setCatalystOverheat NOTIFY catalystOverheatChanged)
    Q_PROPERTY(bool adaptiveHeadlights READ adaptiveHeadlights WRITE setAdaptiveHeadlights NOTIFY adaptiveHeadlightsChanged)
    Q_PROPERTY(bool headlightLevelFault READ headlightLevelFault WRITE setHeadlightLevelFault NOTIFY headlightLevelFaultChanged)
    Q_PROPERTY(bool spoilerFault READ spoilerFault WRITE setSpoilerFault NOTIFY spoilerFaultChanged)
    Q_PROPERTY(bool convertibleRoofFault READ convertibleRoofFault WRITE setConvertibleRoofFault NOTIFY convertibleRoofFaultChanged)
    Q_PROPERTY(bool waterInFuel READ waterInFuel WRITE setWaterInFuel NOTIFY waterInFuelChanged)
    Q_PROPERTY(bool airFilterClogged READ airFilterClogged WRITE setAirFilterClogged NOTIFY airFilterCloggedChanged)
    Q_PROPERTY(bool ecoMode READ ecoMode WRITE setEcoMode NOTIFY ecoModeChanged)
    Q_PROPERTY(bool hillDescentControl READ hillDescentControl WRITE setHillDescentControl NOTIFY hillDescentControlChanged)
    Q_PROPERTY(bool overheatWarning READ overheatWarning WRITE setOverheatWarning NOTIFY overheatWarningChanged)
    Q_PROPERTY(bool fuelFilterFault READ fuelFilterFault WRITE setFuelFilterFault NOTIFY fuelFilterFaultChanged)
    Q_PROPERTY(bool transmissionFault READ transmissionFault WRITE setTransmissionFault NOTIFY transmissionFaultChanged)
    Q_PROPERTY(bool speedLimiter READ speedLimiter WRITE setSpeedLimiter NOTIFY speedLimiterChanged)
    Q_PROPERTY(bool suspensionDamping READ suspensionDamping WRITE setSuspensionDamping NOTIFY suspensionDampingChanged)
    Q_PROPERTY(bool lowOilPressure READ lowOilPressure WRITE setLowOilPressure NOTIFY lowOilPressureChanged)
    Q_PROPERTY(bool frontDefrost READ frontDefrost WRITE setFrontDefrost NOTIFY frontDefrostChanged)
    Q_PROPERTY(bool rearDefrost READ rearDefrost WRITE setRearDefrost NOTIFY rearDefrostChanged)
    Q_PROPERTY(bool autoWipe READ autoWipe WRITE setAutoWipe NOTIFY autoWipeChanged)
    Q_PROPERTY(bool stabilityControlOff READ stabilityControlOff WRITE setStabilityControlOff NOTIFY stabilityControlOffChanged)

public:
    explicit VehicleData(QObject *parent = nullptr);

    enum CallStatus {
        NoCall,
        IncomingCall,
        OutgoingCall,
        ActiveCall,
        CallEnded,
        MissedCall,
        CallRejected
    };
    Q_ENUM(CallStatus)

    // Новые геттеры для музыки
    QString currentArtist() const;
    QString currentAlbum() const;
    QString albumArt() const;
    bool isPlaying() const;
    int trackCurrentTime() const;
    int trackTotalTime() const;

    // Новые геттеры для звонков
    CallStatus callStatus() const;
    QString callerName() const;
    QString callerNumber() const;
    int callDuration() const;

    // Новые сеттеры для музыки
    void setCurrentArtist(const QString &);
    void setCurrentAlbum(const QString &);
    void setAlbumArt(const QString &);
    void setIsPlaying(bool);
    void setTrackCurrentTime(int);
    void setTrackTotalTime(int);


    // Геттеры
    double speed() const;
    int rpm() const;
    QString gear() const;
    double fuelLevel() const;
    double temperature() const;
    int range() const;
    double odometer() const;
    double tripDistance() const;

    bool checkEngine() const;
    bool absFault() const;
    bool espFault() const;

    QVector<bool> doorsOpen() const;
    bool hoodOpen() const;
    bool trunkOpen() const;

    bool lowBeam() const;
    bool highBeam() const;
    bool fogLightsFront() const;
    bool fogLightsRear() const;
    bool hazardLights() const;

    bool parkingBrake() const;
    bool lowFuelWarning() const;
    bool lowOilPressureWarning() const;
    bool highEngineTempWarning() const;
    bool seatbeltUnfastened() const;
    bool airbagFault() const;
    bool batteryFault() const;
    bool cruiseControlActive() const;

    bool leftSignalActive() const;
    bool rightSignalActive() const;

    QVector<float> tpmsTemps() const;
    QVector<float> tpmsPressures() const;

    float navigationDistance() const;
    float navigationAngle() const;

    QString currentTrack() const;
    QString connectedPhoneName() const;
    int signalStrength() const;

    float cpuLoad() const;
    int fps() const;
    bool canError() const;
    float engineHours() const;

    // Сеттеры
    void setSpeed(double);
    void setRpm(int);
    void setGear(const QString &);
    void setFuelLevel(double);
    void setTemperature(double);
    void setRange(int);
    void setOdometer(double);
    void setTripDistance(double);

    void setCheckEngine(bool);
    void setAbsFault(bool);
    void setEspFault(bool);

    void setDoorsOpen(const QVector<bool> &);
    void setHoodOpen(bool);
    void setTrunkOpen(bool);

    void setLowBeam(bool);
    void setHighBeam(bool);
    void setFogLightsFront(bool);
    void setFogLightsRear(bool);
    void setHazardLights(bool);

    void setParkingBrake(bool);
    void setLowFuelWarning(bool);
    void setLowOilPressureWarning(bool);
    void setHighEngineTempWarning(bool);
    void setSeatbeltUnfastened(bool);
    void setAirbagFault(bool);
    void setBatteryFault(bool);
    void setCruiseControlActive(bool);

    void setLeftSignalActive(bool);
    void setRightSignalActive(bool);

    void setTpmsTemps(const QVector<float> &);
    void setTpmsPressures(const QVector<float> &);

    void setNavigationDistance(float);
    void setNavigationAngle(float);

    void setCurrentTrack(const QString &);
    void setConnectedPhoneName(const QString &);
    void setSignalStrength(int);

    void setCpuLoad(float);
    void setFps(int);
    void setCanError(bool);
    void setEngineHours(float);

    void setCallStatus(CallStatus);
    void setCallerName(const QString &);
    void setCallerNumber(const QString &);
    void setCallDuration(int);


    bool fogLightsFrontActive() const;
    bool fogLightsRearActive() const;
    bool steeringFault() const;
    bool washerFluidLow() const;
    bool brakePadWear() const;
    bool rainLightSensor() const;
    bool winterMode() const;
    bool infoMessage() const;
    bool glowPlugActive() const;
    bool frostWarning() const;
    bool keyDetected() const;
    bool keyBatteryLow() const;
    bool distanceWarning() const;
    bool clutchPedal() const;
    bool brakePedal() const;
    bool steeringLock() const;
    bool highBeamActive() const;
    bool tpmsWarning() const;
    bool exteriorLightFault() const;
    bool dpfWarning() const;
    bool trailerConnected() const;
    bool airSuspensionWarning() const;
    bool laneAssist() const;
    bool catalystOverheat() const;
    bool adaptiveHeadlights() const;
    bool headlightLevelFault() const;
    bool spoilerFault() const;
    bool convertibleRoofFault() const;
    bool waterInFuel() const;
    bool airFilterClogged() const;
    bool ecoMode() const;
    bool hillDescentControl() const;
    bool overheatWarning() const;
    bool fuelFilterFault() const;
    bool transmissionFault() const;
    bool speedLimiter() const;
    bool suspensionDamping() const;
    bool lowOilPressure() const;
    bool frontDefrost() const;
    bool rearDefrost() const;
    bool autoWipe() const;
    bool stabilityControlOff() const;

    // Сеттеры для новых свойств
    void setFogLightsFrontActive(bool active);
    void setFogLightsRearActive(bool active);
    void setSteeringFault(bool fault);
    void setWasherFluidLow(bool low);
    void setBrakePadWear(bool wear);
    void setRainLightSensor(bool active);
    void setWinterMode(bool active);
    void setInfoMessage(bool active);
    void setGlowPlugActive(bool active);
    void setFrostWarning(bool active);
    void setKeyDetected(bool detected);
    void setKeyBatteryLow(bool low);
    void setDistanceWarning(bool warning);
    void setClutchPedal(bool pressed);
    void setBrakePedal(bool pressed);
    void setSteeringLock(bool locked);
    void setHighBeamActive(bool active);
    void setTpmsWarning(bool warning);
    void setExteriorLightFault(bool fault);
    void setDpfWarning(bool warning);
    void setTrailerConnected(bool connected);
    void setAirSuspensionWarning(bool warning);
    void setLaneAssist(bool active);
    void setCatalystOverheat(bool overheat);
    void setAdaptiveHeadlights(bool active);
    void setHeadlightLevelFault(bool fault);
    void setSpoilerFault(bool fault);
    void setConvertibleRoofFault(bool fault);
    void setWaterInFuel(bool detected);
    void setAirFilterClogged(bool clogged);
    void setEcoMode(bool active);
    void setHillDescentControl(bool active);
    void setOverheatWarning(bool warning);
    void setFuelFilterFault(bool fault);
    void setTransmissionFault(bool fault);
    void setSpeedLimiter(bool active);
    void setSuspensionDamping(bool active);
    void setLowOilPressure(bool low);
    void setFrontDefrost(bool active);
    void setRearDefrost(bool active);
    void setAutoWipe(bool active);
    void setStabilityControlOff(bool off);

signals:
    void speedChanged();
    void rpmChanged();
    void gearChanged();
    void fuelLevelChanged();
    void temperatureChanged();
    void rangeChanged();
    void odometerChanged();
    void tripDistanceChanged();

    void checkEngineChanged();
    void absFaultChanged();
    void espFaultChanged();

    void doorsOpenChanged();
    void hoodOpenChanged();
    void trunkOpenChanged();

    void lowBeamChanged();
    void highBeamChanged();
    void fogLightsFrontChanged();
    void fogLightsRearChanged();
    void hazardLightsChanged();

    void parkingBrakeChanged();
    void lowFuelWarningChanged();
    void lowOilPressureWarningChanged();
    void highEngineTempWarningChanged();
    void seatbeltUnfastenedChanged();
    void airbagFaultChanged();
    void batteryFaultChanged();
    void cruiseControlActiveChanged();

    void leftSignalActiveChanged();
    void rightSignalActiveChanged();

    void tpmsTempsChanged();
    void tpmsPressuresChanged();

    void navigationDistanceChanged();
    void navigationAngleChanged();

    void currentTrackChanged();
    void connectedPhoneNameChanged();
    void signalStrengthChanged();
    // Новые сигналы для музыки
    void currentArtistChanged();
    void currentAlbumChanged();
    void albumArtChanged();
    void isPlayingChanged();
    void trackCurrentTimeChanged();
    void trackTotalTimeChanged();

    // Новые сигналы для звонков
    void callStatusChanged();
    void callerNameChanged();
    void callerNumberChanged();
    void callDurationChanged();

    void cpuLoadChanged();
    void fpsChanged();
    void canErrorChanged();
    void engineHoursChanged();
    // Новые сигналы предупреждений
    void fogLightsFrontActiveChanged();
    void fogLightsRearActiveChanged();
    void steeringFaultChanged();
    void washerFluidLowChanged();
    void brakePadWearChanged();
    void rainLightSensorChanged();
    void winterModeChanged();
    void infoMessageChanged();
    void glowPlugActiveChanged();
    void frostWarningChanged();
    void keyDetectedChanged();
    void keyBatteryLowChanged();
    void distanceWarningChanged();
    void clutchPedalChanged();
    void brakePedalChanged();
    void steeringLockChanged();
    void highBeamActiveChanged();
    void tpmsWarningChanged();
    void exteriorLightFaultChanged();
    void dpfWarningChanged();
    void trailerConnectedChanged();
    void airSuspensionWarningChanged();
    void laneAssistChanged();
    void catalystOverheatChanged();
    void adaptiveHeadlightsChanged();
    void headlightLevelFaultChanged();
    void spoilerFaultChanged();
    void convertibleRoofFaultChanged();
    void waterInFuelChanged();
    void airFilterCloggedChanged();
    void ecoModeChanged();
    void hillDescentControlChanged();
    void overheatWarningChanged();
    void fuelFilterFaultChanged();
    void transmissionFaultChanged();
    void speedLimiterChanged();
    void suspensionDampingChanged();
    void lowOilPressureChanged();
    void frontDefrostChanged();
    void rearDefrostChanged();
    void autoWipeChanged();
    void stabilityControlOffChanged();


private:
    double m_speed = 0;
    int m_rpm = 0;
    QString m_gear = "N";
    double m_fuelLevel = 100;
    double m_temperature = 90;
    int m_range = 0;
    double m_odometer = 0;
    double m_tripDistance = 0;

    bool m_checkEngine = false;
    bool m_absFault = false;
    bool m_espFault = false;

    QVector<bool> m_doorsOpen {false, false, false, false};
    bool m_hoodOpen = false;
    bool m_trunkOpen = false;

    bool m_lowBeam = false;
    bool m_highBeam = false;
    bool m_fogLightsFront = false;
    bool m_fogLightsRear = false;
    bool m_hazardLights = false;

    bool m_parkingBrake = false;
    bool m_lowFuelWarning = false;
    bool m_lowOilPressureWarning = false;
    bool m_highEngineTempWarning = false;
    bool m_seatbeltUnfastened = false;
    bool m_airbagFault = false;
    bool m_batteryFault = false;
    bool m_cruiseControlActive = false;

    bool m_leftSignalActive = false;
    bool m_rightSignalActive = false;

    QVector<float> m_tpmsTemps {0, 0, 0, 0};
    QVector<float> m_tpmsPressures {0, 0, 0, 0};

    float m_navigationDistance = 0;
    float m_navigationAngle = 0;

    QString m_currentTrack;
    QString m_connectedPhoneName;
    int m_signalStrength = 0;
    QString m_currentArtist;
    QString m_currentAlbum;
    QString m_albumArt;
    bool m_isPlaying = false;
    int m_trackCurrentTime = 0;
    int m_trackTotalTime = 0;

    // Новые приватные члены для звонков
    CallStatus m_callStatus = NoCall;
    QString m_callerName;
    QString m_callerNumber;
    int m_callDuration = 0;

    float m_cpuLoad = 0;
    int m_fps = 0;
    bool m_canError = false;
    float m_engineHours = 0;

    bool m_fogLightsFrontActive = false;
    bool m_fogLightsRearActive = false;
    bool m_steeringFault = false;
    bool m_washerFluidLow = false;
    bool m_brakePadWear = false;
    bool m_rainLightSensor = false;
    bool m_winterMode = false;
    bool m_infoMessage = false;
    bool m_glowPlugActive = false;
    bool m_frostWarning = false;
    bool m_keyDetected = false;
    bool m_keyBatteryLow = false;
    bool m_distanceWarning = false;
    bool m_clutchPedal = false;
    bool m_brakePedal = false;
    bool m_steeringLock = false;
    bool m_highBeamActive = false;
    bool m_tpmsWarning = false;
    bool m_exteriorLightFault = false;
    bool m_dpfWarning = false;
    bool m_trailerConnected = false;
    bool m_airSuspensionWarning = false;
    bool m_laneAssist = false;
    bool m_catalystOverheat = false;
    bool m_adaptiveHeadlights = false;
    bool m_headlightLevelFault = false;
    bool m_spoilerFault = false;
    bool m_convertibleRoofFault = false;
    bool m_waterInFuel = false;
    bool m_airFilterClogged = false;
    bool m_ecoMode = false;
    bool m_hillDescentControl = false;
    bool m_overheatWarning = false;
    bool m_fuelFilterFault = false;
    bool m_transmissionFault = false;
    bool m_speedLimiter = false;
    bool m_suspensionDamping = false;
    bool m_lowOilPressure = false;
    bool m_frontDefrost = false;
    bool m_rearDefrost = false;
    bool m_autoWipe = false;
    bool m_stabilityControlOff = false;
};

#endif // VEHICLEDATA_H
