/****************************************************************************
** Meta object code from reading C++ file 'vehicledata.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.5.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../vehicledata.h"
#include <QtCore/qmetatype.h>
#include <QtCore/QList>

#if __has_include(<QtCore/qtmochelpers.h>)
#include <QtCore/qtmochelpers.h>
#else
QT_BEGIN_MOC_NAMESPACE
#endif


#include <memory>

#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'vehicledata.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 68
#error "This file was generated using the moc from 6.5.3. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

#ifndef Q_CONSTINIT
#define Q_CONSTINIT
#endif

QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
QT_WARNING_DISABLE_GCC("-Wuseless-cast")
namespace {

#ifdef QT_MOC_HAS_STRINGDATA
struct qt_meta_stringdata_CLASSVehicleDataENDCLASS_t {};
static constexpr auto qt_meta_stringdata_CLASSVehicleDataENDCLASS = QtMocHelpers::stringData(
    "VehicleData",
    "speedChanged",
    "",
    "rpmChanged",
    "gearChanged",
    "fuelLevelChanged",
    "temperatureChanged",
    "rangeChanged",
    "odometerChanged",
    "tripDistanceChanged",
    "checkEngineChanged",
    "absFaultChanged",
    "espFaultChanged",
    "doorsOpenChanged",
    "hoodOpenChanged",
    "trunkOpenChanged",
    "lowBeamChanged",
    "highBeamChanged",
    "fogLightsFrontChanged",
    "fogLightsRearChanged",
    "hazardLightsChanged",
    "parkingBrakeChanged",
    "lowFuelWarningChanged",
    "lowOilPressureWarningChanged",
    "highEngineTempWarningChanged",
    "seatbeltUnfastenedChanged",
    "airbagFaultChanged",
    "batteryFaultChanged",
    "cruiseControlActiveChanged",
    "leftSignalActiveChanged",
    "rightSignalActiveChanged",
    "tpmsTempsChanged",
    "tpmsPressuresChanged",
    "navigationDistanceChanged",
    "navigationAngleChanged",
    "currentTrackChanged",
    "connectedPhoneNameChanged",
    "signalStrengthChanged",
    "currentArtistChanged",
    "currentAlbumChanged",
    "albumArtChanged",
    "isPlayingChanged",
    "trackCurrentTimeChanged",
    "trackTotalTimeChanged",
    "callStatusChanged",
    "callerNameChanged",
    "callerNumberChanged",
    "callDurationChanged",
    "cpuLoadChanged",
    "fpsChanged",
    "canErrorChanged",
    "engineHoursChanged",
    "fogLightsFrontActiveChanged",
    "fogLightsRearActiveChanged",
    "steeringFaultChanged",
    "washerFluidLowChanged",
    "brakePadWearChanged",
    "rainLightSensorChanged",
    "winterModeChanged",
    "infoMessageChanged",
    "glowPlugActiveChanged",
    "frostWarningChanged",
    "keyDetectedChanged",
    "keyBatteryLowChanged",
    "distanceWarningChanged",
    "clutchPedalChanged",
    "brakePedalChanged",
    "steeringLockChanged",
    "highBeamActiveChanged",
    "tpmsWarningChanged",
    "exteriorLightFaultChanged",
    "dpfWarningChanged",
    "trailerConnectedChanged",
    "airSuspensionWarningChanged",
    "laneAssistChanged",
    "catalystOverheatChanged",
    "adaptiveHeadlightsChanged",
    "headlightLevelFaultChanged",
    "spoilerFaultChanged",
    "convertibleRoofFaultChanged",
    "waterInFuelChanged",
    "airFilterCloggedChanged",
    "ecoModeChanged",
    "hillDescentControlChanged",
    "overheatWarningChanged",
    "fuelFilterFaultChanged",
    "transmissionFaultChanged",
    "speedLimiterChanged",
    "suspensionDampingChanged",
    "lowOilPressureChanged",
    "frontDefrostChanged",
    "rearDefrostChanged",
    "autoWipeChanged",
    "stabilityControlOffChanged",
    "speed",
    "rpm",
    "gear",
    "fuelLevel",
    "temperature",
    "range",
    "odometer",
    "tripDistance",
    "checkEngine",
    "absFault",
    "espFault",
    "doorsOpen",
    "QList<bool>",
    "hoodOpen",
    "trunkOpen",
    "lowBeam",
    "highBeam",
    "fogLightsFront",
    "fogLightsRear",
    "hazardLights",
    "parkingBrake",
    "lowFuelWarning",
    "lowOilPressureWarning",
    "highEngineTempWarning",
    "seatbeltUnfastened",
    "airbagFault",
    "batteryFault",
    "cruiseControlActive",
    "leftSignalActive",
    "rightSignalActive",
    "tpmsTemps",
    "QList<float>",
    "tpmsPressures",
    "navigationDistance",
    "navigationAngle",
    "currentTrack",
    "connectedPhoneName",
    "signalStrength",
    "currentArtist",
    "currentAlbum",
    "albumArt",
    "isPlaying",
    "trackCurrentTime",
    "trackTotalTime",
    "callStatus",
    "CallStatus",
    "callerName",
    "callerNumber",
    "callDuration",
    "cpuLoad",
    "fps",
    "canError",
    "engineHours",
    "fogLightsFrontActive",
    "fogLightsRearActive",
    "steeringFault",
    "washerFluidLow",
    "brakePadWear",
    "rainLightSensor",
    "winterMode",
    "infoMessage",
    "glowPlugActive",
    "frostWarning",
    "keyDetected",
    "keyBatteryLow",
    "distanceWarning",
    "clutchPedal",
    "brakePedal",
    "steeringLock",
    "highBeamActive",
    "tpmsWarning",
    "exteriorLightFault",
    "dpfWarning",
    "trailerConnected",
    "airSuspensionWarning",
    "laneAssist",
    "catalystOverheat",
    "adaptiveHeadlights",
    "headlightLevelFault",
    "spoilerFault",
    "convertibleRoofFault",
    "waterInFuel",
    "airFilterClogged",
    "ecoMode",
    "hillDescentControl",
    "overheatWarning",
    "fuelFilterFault",
    "transmissionFault",
    "speedLimiter",
    "suspensionDamping",
    "lowOilPressure",
    "frontDefrost",
    "rearDefrost",
    "autoWipe",
    "stabilityControlOff",
    "NoCall",
    "IncomingCall",
    "OutgoingCall",
    "ActiveCall",
    "CallEnded",
    "MissedCall",
    "CallRejected"
);
#else  // !QT_MOC_HAS_STRING_DATA
struct qt_meta_stringdata_CLASSVehicleDataENDCLASS_t {
    uint offsetsAndSizes[392];
    char stringdata0[12];
    char stringdata1[13];
    char stringdata2[1];
    char stringdata3[11];
    char stringdata4[12];
    char stringdata5[17];
    char stringdata6[19];
    char stringdata7[13];
    char stringdata8[16];
    char stringdata9[20];
    char stringdata10[19];
    char stringdata11[16];
    char stringdata12[16];
    char stringdata13[17];
    char stringdata14[16];
    char stringdata15[17];
    char stringdata16[15];
    char stringdata17[16];
    char stringdata18[22];
    char stringdata19[21];
    char stringdata20[20];
    char stringdata21[20];
    char stringdata22[22];
    char stringdata23[29];
    char stringdata24[29];
    char stringdata25[26];
    char stringdata26[19];
    char stringdata27[20];
    char stringdata28[27];
    char stringdata29[24];
    char stringdata30[25];
    char stringdata31[17];
    char stringdata32[21];
    char stringdata33[26];
    char stringdata34[23];
    char stringdata35[20];
    char stringdata36[26];
    char stringdata37[22];
    char stringdata38[21];
    char stringdata39[20];
    char stringdata40[16];
    char stringdata41[17];
    char stringdata42[24];
    char stringdata43[22];
    char stringdata44[18];
    char stringdata45[18];
    char stringdata46[20];
    char stringdata47[20];
    char stringdata48[15];
    char stringdata49[11];
    char stringdata50[16];
    char stringdata51[19];
    char stringdata52[28];
    char stringdata53[27];
    char stringdata54[21];
    char stringdata55[22];
    char stringdata56[20];
    char stringdata57[23];
    char stringdata58[18];
    char stringdata59[19];
    char stringdata60[22];
    char stringdata61[20];
    char stringdata62[19];
    char stringdata63[21];
    char stringdata64[23];
    char stringdata65[19];
    char stringdata66[18];
    char stringdata67[20];
    char stringdata68[22];
    char stringdata69[19];
    char stringdata70[26];
    char stringdata71[18];
    char stringdata72[24];
    char stringdata73[28];
    char stringdata74[18];
    char stringdata75[24];
    char stringdata76[26];
    char stringdata77[27];
    char stringdata78[20];
    char stringdata79[28];
    char stringdata80[19];
    char stringdata81[24];
    char stringdata82[15];
    char stringdata83[26];
    char stringdata84[23];
    char stringdata85[23];
    char stringdata86[25];
    char stringdata87[20];
    char stringdata88[25];
    char stringdata89[22];
    char stringdata90[20];
    char stringdata91[19];
    char stringdata92[16];
    char stringdata93[27];
    char stringdata94[6];
    char stringdata95[4];
    char stringdata96[5];
    char stringdata97[10];
    char stringdata98[12];
    char stringdata99[6];
    char stringdata100[9];
    char stringdata101[13];
    char stringdata102[12];
    char stringdata103[9];
    char stringdata104[9];
    char stringdata105[10];
    char stringdata106[12];
    char stringdata107[9];
    char stringdata108[10];
    char stringdata109[8];
    char stringdata110[9];
    char stringdata111[15];
    char stringdata112[14];
    char stringdata113[13];
    char stringdata114[13];
    char stringdata115[15];
    char stringdata116[22];
    char stringdata117[22];
    char stringdata118[19];
    char stringdata119[12];
    char stringdata120[13];
    char stringdata121[20];
    char stringdata122[17];
    char stringdata123[18];
    char stringdata124[10];
    char stringdata125[13];
    char stringdata126[14];
    char stringdata127[19];
    char stringdata128[16];
    char stringdata129[13];
    char stringdata130[19];
    char stringdata131[15];
    char stringdata132[14];
    char stringdata133[13];
    char stringdata134[9];
    char stringdata135[10];
    char stringdata136[17];
    char stringdata137[15];
    char stringdata138[11];
    char stringdata139[11];
    char stringdata140[11];
    char stringdata141[13];
    char stringdata142[13];
    char stringdata143[8];
    char stringdata144[4];
    char stringdata145[9];
    char stringdata146[12];
    char stringdata147[21];
    char stringdata148[20];
    char stringdata149[14];
    char stringdata150[15];
    char stringdata151[13];
    char stringdata152[16];
    char stringdata153[11];
    char stringdata154[12];
    char stringdata155[15];
    char stringdata156[13];
    char stringdata157[12];
    char stringdata158[14];
    char stringdata159[16];
    char stringdata160[12];
    char stringdata161[11];
    char stringdata162[13];
    char stringdata163[15];
    char stringdata164[12];
    char stringdata165[19];
    char stringdata166[11];
    char stringdata167[17];
    char stringdata168[21];
    char stringdata169[11];
    char stringdata170[17];
    char stringdata171[19];
    char stringdata172[20];
    char stringdata173[13];
    char stringdata174[21];
    char stringdata175[12];
    char stringdata176[17];
    char stringdata177[8];
    char stringdata178[19];
    char stringdata179[16];
    char stringdata180[16];
    char stringdata181[18];
    char stringdata182[13];
    char stringdata183[18];
    char stringdata184[15];
    char stringdata185[13];
    char stringdata186[12];
    char stringdata187[9];
    char stringdata188[20];
    char stringdata189[7];
    char stringdata190[13];
    char stringdata191[13];
    char stringdata192[11];
    char stringdata193[10];
    char stringdata194[11];
    char stringdata195[13];
};
#define QT_MOC_LITERAL(ofs, len) \
    uint(sizeof(qt_meta_stringdata_CLASSVehicleDataENDCLASS_t::offsetsAndSizes) + ofs), len 
Q_CONSTINIT static const qt_meta_stringdata_CLASSVehicleDataENDCLASS_t qt_meta_stringdata_CLASSVehicleDataENDCLASS = {
    {
        QT_MOC_LITERAL(0, 11),  // "VehicleData"
        QT_MOC_LITERAL(12, 12),  // "speedChanged"
        QT_MOC_LITERAL(25, 0),  // ""
        QT_MOC_LITERAL(26, 10),  // "rpmChanged"
        QT_MOC_LITERAL(37, 11),  // "gearChanged"
        QT_MOC_LITERAL(49, 16),  // "fuelLevelChanged"
        QT_MOC_LITERAL(66, 18),  // "temperatureChanged"
        QT_MOC_LITERAL(85, 12),  // "rangeChanged"
        QT_MOC_LITERAL(98, 15),  // "odometerChanged"
        QT_MOC_LITERAL(114, 19),  // "tripDistanceChanged"
        QT_MOC_LITERAL(134, 18),  // "checkEngineChanged"
        QT_MOC_LITERAL(153, 15),  // "absFaultChanged"
        QT_MOC_LITERAL(169, 15),  // "espFaultChanged"
        QT_MOC_LITERAL(185, 16),  // "doorsOpenChanged"
        QT_MOC_LITERAL(202, 15),  // "hoodOpenChanged"
        QT_MOC_LITERAL(218, 16),  // "trunkOpenChanged"
        QT_MOC_LITERAL(235, 14),  // "lowBeamChanged"
        QT_MOC_LITERAL(250, 15),  // "highBeamChanged"
        QT_MOC_LITERAL(266, 21),  // "fogLightsFrontChanged"
        QT_MOC_LITERAL(288, 20),  // "fogLightsRearChanged"
        QT_MOC_LITERAL(309, 19),  // "hazardLightsChanged"
        QT_MOC_LITERAL(329, 19),  // "parkingBrakeChanged"
        QT_MOC_LITERAL(349, 21),  // "lowFuelWarningChanged"
        QT_MOC_LITERAL(371, 28),  // "lowOilPressureWarningChanged"
        QT_MOC_LITERAL(400, 28),  // "highEngineTempWarningChanged"
        QT_MOC_LITERAL(429, 25),  // "seatbeltUnfastenedChanged"
        QT_MOC_LITERAL(455, 18),  // "airbagFaultChanged"
        QT_MOC_LITERAL(474, 19),  // "batteryFaultChanged"
        QT_MOC_LITERAL(494, 26),  // "cruiseControlActiveChanged"
        QT_MOC_LITERAL(521, 23),  // "leftSignalActiveChanged"
        QT_MOC_LITERAL(545, 24),  // "rightSignalActiveChanged"
        QT_MOC_LITERAL(570, 16),  // "tpmsTempsChanged"
        QT_MOC_LITERAL(587, 20),  // "tpmsPressuresChanged"
        QT_MOC_LITERAL(608, 25),  // "navigationDistanceChanged"
        QT_MOC_LITERAL(634, 22),  // "navigationAngleChanged"
        QT_MOC_LITERAL(657, 19),  // "currentTrackChanged"
        QT_MOC_LITERAL(677, 25),  // "connectedPhoneNameChanged"
        QT_MOC_LITERAL(703, 21),  // "signalStrengthChanged"
        QT_MOC_LITERAL(725, 20),  // "currentArtistChanged"
        QT_MOC_LITERAL(746, 19),  // "currentAlbumChanged"
        QT_MOC_LITERAL(766, 15),  // "albumArtChanged"
        QT_MOC_LITERAL(782, 16),  // "isPlayingChanged"
        QT_MOC_LITERAL(799, 23),  // "trackCurrentTimeChanged"
        QT_MOC_LITERAL(823, 21),  // "trackTotalTimeChanged"
        QT_MOC_LITERAL(845, 17),  // "callStatusChanged"
        QT_MOC_LITERAL(863, 17),  // "callerNameChanged"
        QT_MOC_LITERAL(881, 19),  // "callerNumberChanged"
        QT_MOC_LITERAL(901, 19),  // "callDurationChanged"
        QT_MOC_LITERAL(921, 14),  // "cpuLoadChanged"
        QT_MOC_LITERAL(936, 10),  // "fpsChanged"
        QT_MOC_LITERAL(947, 15),  // "canErrorChanged"
        QT_MOC_LITERAL(963, 18),  // "engineHoursChanged"
        QT_MOC_LITERAL(982, 27),  // "fogLightsFrontActiveChanged"
        QT_MOC_LITERAL(1010, 26),  // "fogLightsRearActiveChanged"
        QT_MOC_LITERAL(1037, 20),  // "steeringFaultChanged"
        QT_MOC_LITERAL(1058, 21),  // "washerFluidLowChanged"
        QT_MOC_LITERAL(1080, 19),  // "brakePadWearChanged"
        QT_MOC_LITERAL(1100, 22),  // "rainLightSensorChanged"
        QT_MOC_LITERAL(1123, 17),  // "winterModeChanged"
        QT_MOC_LITERAL(1141, 18),  // "infoMessageChanged"
        QT_MOC_LITERAL(1160, 21),  // "glowPlugActiveChanged"
        QT_MOC_LITERAL(1182, 19),  // "frostWarningChanged"
        QT_MOC_LITERAL(1202, 18),  // "keyDetectedChanged"
        QT_MOC_LITERAL(1221, 20),  // "keyBatteryLowChanged"
        QT_MOC_LITERAL(1242, 22),  // "distanceWarningChanged"
        QT_MOC_LITERAL(1265, 18),  // "clutchPedalChanged"
        QT_MOC_LITERAL(1284, 17),  // "brakePedalChanged"
        QT_MOC_LITERAL(1302, 19),  // "steeringLockChanged"
        QT_MOC_LITERAL(1322, 21),  // "highBeamActiveChanged"
        QT_MOC_LITERAL(1344, 18),  // "tpmsWarningChanged"
        QT_MOC_LITERAL(1363, 25),  // "exteriorLightFaultChanged"
        QT_MOC_LITERAL(1389, 17),  // "dpfWarningChanged"
        QT_MOC_LITERAL(1407, 23),  // "trailerConnectedChanged"
        QT_MOC_LITERAL(1431, 27),  // "airSuspensionWarningChanged"
        QT_MOC_LITERAL(1459, 17),  // "laneAssistChanged"
        QT_MOC_LITERAL(1477, 23),  // "catalystOverheatChanged"
        QT_MOC_LITERAL(1501, 25),  // "adaptiveHeadlightsChanged"
        QT_MOC_LITERAL(1527, 26),  // "headlightLevelFaultChanged"
        QT_MOC_LITERAL(1554, 19),  // "spoilerFaultChanged"
        QT_MOC_LITERAL(1574, 27),  // "convertibleRoofFaultChanged"
        QT_MOC_LITERAL(1602, 18),  // "waterInFuelChanged"
        QT_MOC_LITERAL(1621, 23),  // "airFilterCloggedChanged"
        QT_MOC_LITERAL(1645, 14),  // "ecoModeChanged"
        QT_MOC_LITERAL(1660, 25),  // "hillDescentControlChanged"
        QT_MOC_LITERAL(1686, 22),  // "overheatWarningChanged"
        QT_MOC_LITERAL(1709, 22),  // "fuelFilterFaultChanged"
        QT_MOC_LITERAL(1732, 24),  // "transmissionFaultChanged"
        QT_MOC_LITERAL(1757, 19),  // "speedLimiterChanged"
        QT_MOC_LITERAL(1777, 24),  // "suspensionDampingChanged"
        QT_MOC_LITERAL(1802, 21),  // "lowOilPressureChanged"
        QT_MOC_LITERAL(1824, 19),  // "frontDefrostChanged"
        QT_MOC_LITERAL(1844, 18),  // "rearDefrostChanged"
        QT_MOC_LITERAL(1863, 15),  // "autoWipeChanged"
        QT_MOC_LITERAL(1879, 26),  // "stabilityControlOffChanged"
        QT_MOC_LITERAL(1906, 5),  // "speed"
        QT_MOC_LITERAL(1912, 3),  // "rpm"
        QT_MOC_LITERAL(1916, 4),  // "gear"
        QT_MOC_LITERAL(1921, 9),  // "fuelLevel"
        QT_MOC_LITERAL(1931, 11),  // "temperature"
        QT_MOC_LITERAL(1943, 5),  // "range"
        QT_MOC_LITERAL(1949, 8),  // "odometer"
        QT_MOC_LITERAL(1958, 12),  // "tripDistance"
        QT_MOC_LITERAL(1971, 11),  // "checkEngine"
        QT_MOC_LITERAL(1983, 8),  // "absFault"
        QT_MOC_LITERAL(1992, 8),  // "espFault"
        QT_MOC_LITERAL(2001, 9),  // "doorsOpen"
        QT_MOC_LITERAL(2011, 11),  // "QList<bool>"
        QT_MOC_LITERAL(2023, 8),  // "hoodOpen"
        QT_MOC_LITERAL(2032, 9),  // "trunkOpen"
        QT_MOC_LITERAL(2042, 7),  // "lowBeam"
        QT_MOC_LITERAL(2050, 8),  // "highBeam"
        QT_MOC_LITERAL(2059, 14),  // "fogLightsFront"
        QT_MOC_LITERAL(2074, 13),  // "fogLightsRear"
        QT_MOC_LITERAL(2088, 12),  // "hazardLights"
        QT_MOC_LITERAL(2101, 12),  // "parkingBrake"
        QT_MOC_LITERAL(2114, 14),  // "lowFuelWarning"
        QT_MOC_LITERAL(2129, 21),  // "lowOilPressureWarning"
        QT_MOC_LITERAL(2151, 21),  // "highEngineTempWarning"
        QT_MOC_LITERAL(2173, 18),  // "seatbeltUnfastened"
        QT_MOC_LITERAL(2192, 11),  // "airbagFault"
        QT_MOC_LITERAL(2204, 12),  // "batteryFault"
        QT_MOC_LITERAL(2217, 19),  // "cruiseControlActive"
        QT_MOC_LITERAL(2237, 16),  // "leftSignalActive"
        QT_MOC_LITERAL(2254, 17),  // "rightSignalActive"
        QT_MOC_LITERAL(2272, 9),  // "tpmsTemps"
        QT_MOC_LITERAL(2282, 12),  // "QList<float>"
        QT_MOC_LITERAL(2295, 13),  // "tpmsPressures"
        QT_MOC_LITERAL(2309, 18),  // "navigationDistance"
        QT_MOC_LITERAL(2328, 15),  // "navigationAngle"
        QT_MOC_LITERAL(2344, 12),  // "currentTrack"
        QT_MOC_LITERAL(2357, 18),  // "connectedPhoneName"
        QT_MOC_LITERAL(2376, 14),  // "signalStrength"
        QT_MOC_LITERAL(2391, 13),  // "currentArtist"
        QT_MOC_LITERAL(2405, 12),  // "currentAlbum"
        QT_MOC_LITERAL(2418, 8),  // "albumArt"
        QT_MOC_LITERAL(2427, 9),  // "isPlaying"
        QT_MOC_LITERAL(2437, 16),  // "trackCurrentTime"
        QT_MOC_LITERAL(2454, 14),  // "trackTotalTime"
        QT_MOC_LITERAL(2469, 10),  // "callStatus"
        QT_MOC_LITERAL(2480, 10),  // "CallStatus"
        QT_MOC_LITERAL(2491, 10),  // "callerName"
        QT_MOC_LITERAL(2502, 12),  // "callerNumber"
        QT_MOC_LITERAL(2515, 12),  // "callDuration"
        QT_MOC_LITERAL(2528, 7),  // "cpuLoad"
        QT_MOC_LITERAL(2536, 3),  // "fps"
        QT_MOC_LITERAL(2540, 8),  // "canError"
        QT_MOC_LITERAL(2549, 11),  // "engineHours"
        QT_MOC_LITERAL(2561, 20),  // "fogLightsFrontActive"
        QT_MOC_LITERAL(2582, 19),  // "fogLightsRearActive"
        QT_MOC_LITERAL(2602, 13),  // "steeringFault"
        QT_MOC_LITERAL(2616, 14),  // "washerFluidLow"
        QT_MOC_LITERAL(2631, 12),  // "brakePadWear"
        QT_MOC_LITERAL(2644, 15),  // "rainLightSensor"
        QT_MOC_LITERAL(2660, 10),  // "winterMode"
        QT_MOC_LITERAL(2671, 11),  // "infoMessage"
        QT_MOC_LITERAL(2683, 14),  // "glowPlugActive"
        QT_MOC_LITERAL(2698, 12),  // "frostWarning"
        QT_MOC_LITERAL(2711, 11),  // "keyDetected"
        QT_MOC_LITERAL(2723, 13),  // "keyBatteryLow"
        QT_MOC_LITERAL(2737, 15),  // "distanceWarning"
        QT_MOC_LITERAL(2753, 11),  // "clutchPedal"
        QT_MOC_LITERAL(2765, 10),  // "brakePedal"
        QT_MOC_LITERAL(2776, 12),  // "steeringLock"
        QT_MOC_LITERAL(2789, 14),  // "highBeamActive"
        QT_MOC_LITERAL(2804, 11),  // "tpmsWarning"
        QT_MOC_LITERAL(2816, 18),  // "exteriorLightFault"
        QT_MOC_LITERAL(2835, 10),  // "dpfWarning"
        QT_MOC_LITERAL(2846, 16),  // "trailerConnected"
        QT_MOC_LITERAL(2863, 20),  // "airSuspensionWarning"
        QT_MOC_LITERAL(2884, 10),  // "laneAssist"
        QT_MOC_LITERAL(2895, 16),  // "catalystOverheat"
        QT_MOC_LITERAL(2912, 18),  // "adaptiveHeadlights"
        QT_MOC_LITERAL(2931, 19),  // "headlightLevelFault"
        QT_MOC_LITERAL(2951, 12),  // "spoilerFault"
        QT_MOC_LITERAL(2964, 20),  // "convertibleRoofFault"
        QT_MOC_LITERAL(2985, 11),  // "waterInFuel"
        QT_MOC_LITERAL(2997, 16),  // "airFilterClogged"
        QT_MOC_LITERAL(3014, 7),  // "ecoMode"
        QT_MOC_LITERAL(3022, 18),  // "hillDescentControl"
        QT_MOC_LITERAL(3041, 15),  // "overheatWarning"
        QT_MOC_LITERAL(3057, 15),  // "fuelFilterFault"
        QT_MOC_LITERAL(3073, 17),  // "transmissionFault"
        QT_MOC_LITERAL(3091, 12),  // "speedLimiter"
        QT_MOC_LITERAL(3104, 17),  // "suspensionDamping"
        QT_MOC_LITERAL(3122, 14),  // "lowOilPressure"
        QT_MOC_LITERAL(3137, 12),  // "frontDefrost"
        QT_MOC_LITERAL(3150, 11),  // "rearDefrost"
        QT_MOC_LITERAL(3162, 8),  // "autoWipe"
        QT_MOC_LITERAL(3171, 19),  // "stabilityControlOff"
        QT_MOC_LITERAL(3191, 6),  // "NoCall"
        QT_MOC_LITERAL(3198, 12),  // "IncomingCall"
        QT_MOC_LITERAL(3211, 12),  // "OutgoingCall"
        QT_MOC_LITERAL(3224, 10),  // "ActiveCall"
        QT_MOC_LITERAL(3235, 9),  // "CallEnded"
        QT_MOC_LITERAL(3245, 10),  // "MissedCall"
        QT_MOC_LITERAL(3256, 12)   // "CallRejected"
    },
    "VehicleData",
    "speedChanged",
    "",
    "rpmChanged",
    "gearChanged",
    "fuelLevelChanged",
    "temperatureChanged",
    "rangeChanged",
    "odometerChanged",
    "tripDistanceChanged",
    "checkEngineChanged",
    "absFaultChanged",
    "espFaultChanged",
    "doorsOpenChanged",
    "hoodOpenChanged",
    "trunkOpenChanged",
    "lowBeamChanged",
    "highBeamChanged",
    "fogLightsFrontChanged",
    "fogLightsRearChanged",
    "hazardLightsChanged",
    "parkingBrakeChanged",
    "lowFuelWarningChanged",
    "lowOilPressureWarningChanged",
    "highEngineTempWarningChanged",
    "seatbeltUnfastenedChanged",
    "airbagFaultChanged",
    "batteryFaultChanged",
    "cruiseControlActiveChanged",
    "leftSignalActiveChanged",
    "rightSignalActiveChanged",
    "tpmsTempsChanged",
    "tpmsPressuresChanged",
    "navigationDistanceChanged",
    "navigationAngleChanged",
    "currentTrackChanged",
    "connectedPhoneNameChanged",
    "signalStrengthChanged",
    "currentArtistChanged",
    "currentAlbumChanged",
    "albumArtChanged",
    "isPlayingChanged",
    "trackCurrentTimeChanged",
    "trackTotalTimeChanged",
    "callStatusChanged",
    "callerNameChanged",
    "callerNumberChanged",
    "callDurationChanged",
    "cpuLoadChanged",
    "fpsChanged",
    "canErrorChanged",
    "engineHoursChanged",
    "fogLightsFrontActiveChanged",
    "fogLightsRearActiveChanged",
    "steeringFaultChanged",
    "washerFluidLowChanged",
    "brakePadWearChanged",
    "rainLightSensorChanged",
    "winterModeChanged",
    "infoMessageChanged",
    "glowPlugActiveChanged",
    "frostWarningChanged",
    "keyDetectedChanged",
    "keyBatteryLowChanged",
    "distanceWarningChanged",
    "clutchPedalChanged",
    "brakePedalChanged",
    "steeringLockChanged",
    "highBeamActiveChanged",
    "tpmsWarningChanged",
    "exteriorLightFaultChanged",
    "dpfWarningChanged",
    "trailerConnectedChanged",
    "airSuspensionWarningChanged",
    "laneAssistChanged",
    "catalystOverheatChanged",
    "adaptiveHeadlightsChanged",
    "headlightLevelFaultChanged",
    "spoilerFaultChanged",
    "convertibleRoofFaultChanged",
    "waterInFuelChanged",
    "airFilterCloggedChanged",
    "ecoModeChanged",
    "hillDescentControlChanged",
    "overheatWarningChanged",
    "fuelFilterFaultChanged",
    "transmissionFaultChanged",
    "speedLimiterChanged",
    "suspensionDampingChanged",
    "lowOilPressureChanged",
    "frontDefrostChanged",
    "rearDefrostChanged",
    "autoWipeChanged",
    "stabilityControlOffChanged",
    "speed",
    "rpm",
    "gear",
    "fuelLevel",
    "temperature",
    "range",
    "odometer",
    "tripDistance",
    "checkEngine",
    "absFault",
    "espFault",
    "doorsOpen",
    "QList<bool>",
    "hoodOpen",
    "trunkOpen",
    "lowBeam",
    "highBeam",
    "fogLightsFront",
    "fogLightsRear",
    "hazardLights",
    "parkingBrake",
    "lowFuelWarning",
    "lowOilPressureWarning",
    "highEngineTempWarning",
    "seatbeltUnfastened",
    "airbagFault",
    "batteryFault",
    "cruiseControlActive",
    "leftSignalActive",
    "rightSignalActive",
    "tpmsTemps",
    "QList<float>",
    "tpmsPressures",
    "navigationDistance",
    "navigationAngle",
    "currentTrack",
    "connectedPhoneName",
    "signalStrength",
    "currentArtist",
    "currentAlbum",
    "albumArt",
    "isPlaying",
    "trackCurrentTime",
    "trackTotalTime",
    "callStatus",
    "CallStatus",
    "callerName",
    "callerNumber",
    "callDuration",
    "cpuLoad",
    "fps",
    "canError",
    "engineHours",
    "fogLightsFrontActive",
    "fogLightsRearActive",
    "steeringFault",
    "washerFluidLow",
    "brakePadWear",
    "rainLightSensor",
    "winterMode",
    "infoMessage",
    "glowPlugActive",
    "frostWarning",
    "keyDetected",
    "keyBatteryLow",
    "distanceWarning",
    "clutchPedal",
    "brakePedal",
    "steeringLock",
    "highBeamActive",
    "tpmsWarning",
    "exteriorLightFault",
    "dpfWarning",
    "trailerConnected",
    "airSuspensionWarning",
    "laneAssist",
    "catalystOverheat",
    "adaptiveHeadlights",
    "headlightLevelFault",
    "spoilerFault",
    "convertibleRoofFault",
    "waterInFuel",
    "airFilterClogged",
    "ecoMode",
    "hillDescentControl",
    "overheatWarning",
    "fuelFilterFault",
    "transmissionFault",
    "speedLimiter",
    "suspensionDamping",
    "lowOilPressure",
    "frontDefrost",
    "rearDefrost",
    "autoWipe",
    "stabilityControlOff",
    "NoCall",
    "IncomingCall",
    "OutgoingCall",
    "ActiveCall",
    "CallEnded",
    "MissedCall",
    "CallRejected"
};
#undef QT_MOC_LITERAL
#endif // !QT_MOC_HAS_STRING_DATA
} // unnamed namespace

Q_CONSTINIT static const uint qt_meta_data_CLASSVehicleDataENDCLASS[] = {

 // content:
      11,       // revision
       0,       // classname
       0,    0, // classinfo
      92,   14, // methods
      92,  658, // properties
       1, 1118, // enums/sets
       0,    0, // constructors
       0,       // flags
      92,       // signalCount

 // signals: name, argc, parameters, tag, flags, initial metatype offsets
       1,    0,  566,    2, 0x06,   93 /* Public */,
       3,    0,  567,    2, 0x06,   94 /* Public */,
       4,    0,  568,    2, 0x06,   95 /* Public */,
       5,    0,  569,    2, 0x06,   96 /* Public */,
       6,    0,  570,    2, 0x06,   97 /* Public */,
       7,    0,  571,    2, 0x06,   98 /* Public */,
       8,    0,  572,    2, 0x06,   99 /* Public */,
       9,    0,  573,    2, 0x06,  100 /* Public */,
      10,    0,  574,    2, 0x06,  101 /* Public */,
      11,    0,  575,    2, 0x06,  102 /* Public */,
      12,    0,  576,    2, 0x06,  103 /* Public */,
      13,    0,  577,    2, 0x06,  104 /* Public */,
      14,    0,  578,    2, 0x06,  105 /* Public */,
      15,    0,  579,    2, 0x06,  106 /* Public */,
      16,    0,  580,    2, 0x06,  107 /* Public */,
      17,    0,  581,    2, 0x06,  108 /* Public */,
      18,    0,  582,    2, 0x06,  109 /* Public */,
      19,    0,  583,    2, 0x06,  110 /* Public */,
      20,    0,  584,    2, 0x06,  111 /* Public */,
      21,    0,  585,    2, 0x06,  112 /* Public */,
      22,    0,  586,    2, 0x06,  113 /* Public */,
      23,    0,  587,    2, 0x06,  114 /* Public */,
      24,    0,  588,    2, 0x06,  115 /* Public */,
      25,    0,  589,    2, 0x06,  116 /* Public */,
      26,    0,  590,    2, 0x06,  117 /* Public */,
      27,    0,  591,    2, 0x06,  118 /* Public */,
      28,    0,  592,    2, 0x06,  119 /* Public */,
      29,    0,  593,    2, 0x06,  120 /* Public */,
      30,    0,  594,    2, 0x06,  121 /* Public */,
      31,    0,  595,    2, 0x06,  122 /* Public */,
      32,    0,  596,    2, 0x06,  123 /* Public */,
      33,    0,  597,    2, 0x06,  124 /* Public */,
      34,    0,  598,    2, 0x06,  125 /* Public */,
      35,    0,  599,    2, 0x06,  126 /* Public */,
      36,    0,  600,    2, 0x06,  127 /* Public */,
      37,    0,  601,    2, 0x06,  128 /* Public */,
      38,    0,  602,    2, 0x06,  129 /* Public */,
      39,    0,  603,    2, 0x06,  130 /* Public */,
      40,    0,  604,    2, 0x06,  131 /* Public */,
      41,    0,  605,    2, 0x06,  132 /* Public */,
      42,    0,  606,    2, 0x06,  133 /* Public */,
      43,    0,  607,    2, 0x06,  134 /* Public */,
      44,    0,  608,    2, 0x06,  135 /* Public */,
      45,    0,  609,    2, 0x06,  136 /* Public */,
      46,    0,  610,    2, 0x06,  137 /* Public */,
      47,    0,  611,    2, 0x06,  138 /* Public */,
      48,    0,  612,    2, 0x06,  139 /* Public */,
      49,    0,  613,    2, 0x06,  140 /* Public */,
      50,    0,  614,    2, 0x06,  141 /* Public */,
      51,    0,  615,    2, 0x06,  142 /* Public */,
      52,    0,  616,    2, 0x06,  143 /* Public */,
      53,    0,  617,    2, 0x06,  144 /* Public */,
      54,    0,  618,    2, 0x06,  145 /* Public */,
      55,    0,  619,    2, 0x06,  146 /* Public */,
      56,    0,  620,    2, 0x06,  147 /* Public */,
      57,    0,  621,    2, 0x06,  148 /* Public */,
      58,    0,  622,    2, 0x06,  149 /* Public */,
      59,    0,  623,    2, 0x06,  150 /* Public */,
      60,    0,  624,    2, 0x06,  151 /* Public */,
      61,    0,  625,    2, 0x06,  152 /* Public */,
      62,    0,  626,    2, 0x06,  153 /* Public */,
      63,    0,  627,    2, 0x06,  154 /* Public */,
      64,    0,  628,    2, 0x06,  155 /* Public */,
      65,    0,  629,    2, 0x06,  156 /* Public */,
      66,    0,  630,    2, 0x06,  157 /* Public */,
      67,    0,  631,    2, 0x06,  158 /* Public */,
      68,    0,  632,    2, 0x06,  159 /* Public */,
      69,    0,  633,    2, 0x06,  160 /* Public */,
      70,    0,  634,    2, 0x06,  161 /* Public */,
      71,    0,  635,    2, 0x06,  162 /* Public */,
      72,    0,  636,    2, 0x06,  163 /* Public */,
      73,    0,  637,    2, 0x06,  164 /* Public */,
      74,    0,  638,    2, 0x06,  165 /* Public */,
      75,    0,  639,    2, 0x06,  166 /* Public */,
      76,    0,  640,    2, 0x06,  167 /* Public */,
      77,    0,  641,    2, 0x06,  168 /* Public */,
      78,    0,  642,    2, 0x06,  169 /* Public */,
      79,    0,  643,    2, 0x06,  170 /* Public */,
      80,    0,  644,    2, 0x06,  171 /* Public */,
      81,    0,  645,    2, 0x06,  172 /* Public */,
      82,    0,  646,    2, 0x06,  173 /* Public */,
      83,    0,  647,    2, 0x06,  174 /* Public */,
      84,    0,  648,    2, 0x06,  175 /* Public */,
      85,    0,  649,    2, 0x06,  176 /* Public */,
      86,    0,  650,    2, 0x06,  177 /* Public */,
      87,    0,  651,    2, 0x06,  178 /* Public */,
      88,    0,  652,    2, 0x06,  179 /* Public */,
      89,    0,  653,    2, 0x06,  180 /* Public */,
      90,    0,  654,    2, 0x06,  181 /* Public */,
      91,    0,  655,    2, 0x06,  182 /* Public */,
      92,    0,  656,    2, 0x06,  183 /* Public */,
      93,    0,  657,    2, 0x06,  184 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // properties: name, type, flags
      94, QMetaType::Double, 0x00015103, uint(0), 0,
      95, QMetaType::Int, 0x00015103, uint(1), 0,
      96, QMetaType::QString, 0x00015103, uint(2), 0,
      97, QMetaType::Double, 0x00015103, uint(3), 0,
      98, QMetaType::Double, 0x00015103, uint(4), 0,
      99, QMetaType::Int, 0x00015103, uint(5), 0,
     100, QMetaType::Double, 0x00015103, uint(6), 0,
     101, QMetaType::Double, 0x00015103, uint(7), 0,
     102, QMetaType::Bool, 0x00015103, uint(8), 0,
     103, QMetaType::Bool, 0x00015103, uint(9), 0,
     104, QMetaType::Bool, 0x00015103, uint(10), 0,
     105, 0x80000000 | 106, 0x0001510b, uint(11), 0,
     107, QMetaType::Bool, 0x00015103, uint(12), 0,
     108, QMetaType::Bool, 0x00015103, uint(13), 0,
     109, QMetaType::Bool, 0x00015103, uint(14), 0,
     110, QMetaType::Bool, 0x00015103, uint(15), 0,
     111, QMetaType::Bool, 0x00015103, uint(16), 0,
     112, QMetaType::Bool, 0x00015103, uint(17), 0,
     113, QMetaType::Bool, 0x00015103, uint(18), 0,
     114, QMetaType::Bool, 0x00015103, uint(19), 0,
     115, QMetaType::Bool, 0x00015103, uint(20), 0,
     116, QMetaType::Bool, 0x00015103, uint(21), 0,
     117, QMetaType::Bool, 0x00015103, uint(22), 0,
     118, QMetaType::Bool, 0x00015103, uint(23), 0,
     119, QMetaType::Bool, 0x00015103, uint(24), 0,
     120, QMetaType::Bool, 0x00015103, uint(25), 0,
     121, QMetaType::Bool, 0x00015103, uint(26), 0,
     122, QMetaType::Bool, 0x00015103, uint(27), 0,
     123, QMetaType::Bool, 0x00015103, uint(28), 0,
     124, 0x80000000 | 125, 0x0001510b, uint(29), 0,
     126, 0x80000000 | 125, 0x0001510b, uint(30), 0,
     127, QMetaType::Float, 0x00015103, uint(31), 0,
     128, QMetaType::Float, 0x00015103, uint(32), 0,
     129, QMetaType::QString, 0x00015103, uint(33), 0,
     130, QMetaType::QString, 0x00015103, uint(34), 0,
     131, QMetaType::Int, 0x00015103, uint(35), 0,
     132, QMetaType::QString, 0x00015103, uint(36), 0,
     133, QMetaType::QString, 0x00015103, uint(37), 0,
     134, QMetaType::QString, 0x00015103, uint(38), 0,
     135, QMetaType::Bool, 0x00015103, uint(39), 0,
     136, QMetaType::Int, 0x00015103, uint(40), 0,
     137, QMetaType::Int, 0x00015103, uint(41), 0,
     138, 0x80000000 | 139, 0x0001510b, uint(42), 0,
     140, QMetaType::QString, 0x00015103, uint(43), 0,
     141, QMetaType::QString, 0x00015103, uint(44), 0,
     142, QMetaType::Int, 0x00015103, uint(45), 0,
     143, QMetaType::Float, 0x00015103, uint(46), 0,
     144, QMetaType::Int, 0x00015103, uint(47), 0,
     145, QMetaType::Bool, 0x00015103, uint(48), 0,
     146, QMetaType::Float, 0x00015103, uint(49), 0,
     147, QMetaType::Bool, 0x00015103, uint(50), 0,
     148, QMetaType::Bool, 0x00015103, uint(51), 0,
     149, QMetaType::Bool, 0x00015103, uint(52), 0,
     150, QMetaType::Bool, 0x00015103, uint(53), 0,
     151, QMetaType::Bool, 0x00015103, uint(54), 0,
     152, QMetaType::Bool, 0x00015103, uint(55), 0,
     153, QMetaType::Bool, 0x00015103, uint(56), 0,
     154, QMetaType::Bool, 0x00015103, uint(57), 0,
     155, QMetaType::Bool, 0x00015103, uint(58), 0,
     156, QMetaType::Bool, 0x00015103, uint(59), 0,
     157, QMetaType::Bool, 0x00015103, uint(60), 0,
     158, QMetaType::Bool, 0x00015103, uint(61), 0,
     159, QMetaType::Bool, 0x00015103, uint(62), 0,
     160, QMetaType::Bool, 0x00015103, uint(63), 0,
     161, QMetaType::Bool, 0x00015103, uint(64), 0,
     162, QMetaType::Bool, 0x00015103, uint(65), 0,
     163, QMetaType::Bool, 0x00015103, uint(66), 0,
     164, QMetaType::Bool, 0x00015103, uint(67), 0,
     165, QMetaType::Bool, 0x00015103, uint(68), 0,
     166, QMetaType::Bool, 0x00015103, uint(69), 0,
     167, QMetaType::Bool, 0x00015103, uint(70), 0,
     168, QMetaType::Bool, 0x00015103, uint(71), 0,
     169, QMetaType::Bool, 0x00015103, uint(72), 0,
     170, QMetaType::Bool, 0x00015103, uint(73), 0,
     171, QMetaType::Bool, 0x00015103, uint(74), 0,
     172, QMetaType::Bool, 0x00015103, uint(75), 0,
     173, QMetaType::Bool, 0x00015103, uint(76), 0,
     174, QMetaType::Bool, 0x00015103, uint(77), 0,
     175, QMetaType::Bool, 0x00015103, uint(78), 0,
     176, QMetaType::Bool, 0x00015103, uint(79), 0,
     177, QMetaType::Bool, 0x00015103, uint(80), 0,
     178, QMetaType::Bool, 0x00015103, uint(81), 0,
     179, QMetaType::Bool, 0x00015103, uint(82), 0,
     180, QMetaType::Bool, 0x00015103, uint(83), 0,
     181, QMetaType::Bool, 0x00015103, uint(84), 0,
     182, QMetaType::Bool, 0x00015103, uint(85), 0,
     183, QMetaType::Bool, 0x00015103, uint(86), 0,
     184, QMetaType::Bool, 0x00015103, uint(87), 0,
     185, QMetaType::Bool, 0x00015103, uint(88), 0,
     186, QMetaType::Bool, 0x00015103, uint(89), 0,
     187, QMetaType::Bool, 0x00015103, uint(90), 0,
     188, QMetaType::Bool, 0x00015103, uint(91), 0,

 // enums: name, alias, flags, count, data
     139,  139, 0x0,    7, 1123,

 // enum data: key, value
     189, uint(VehicleData::NoCall),
     190, uint(VehicleData::IncomingCall),
     191, uint(VehicleData::OutgoingCall),
     192, uint(VehicleData::ActiveCall),
     193, uint(VehicleData::CallEnded),
     194, uint(VehicleData::MissedCall),
     195, uint(VehicleData::CallRejected),

       0        // eod
};

Q_CONSTINIT const QMetaObject VehicleData::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_CLASSVehicleDataENDCLASS.offsetsAndSizes,
    qt_meta_data_CLASSVehicleDataENDCLASS,
    qt_static_metacall,
    nullptr,
    qt_incomplete_metaTypeArray<qt_meta_stringdata_CLASSVehicleDataENDCLASS_t,
        // property 'speed'
        QtPrivate::TypeAndForceComplete<double, std::true_type>,
        // property 'rpm'
        QtPrivate::TypeAndForceComplete<int, std::true_type>,
        // property 'gear'
        QtPrivate::TypeAndForceComplete<QString, std::true_type>,
        // property 'fuelLevel'
        QtPrivate::TypeAndForceComplete<double, std::true_type>,
        // property 'temperature'
        QtPrivate::TypeAndForceComplete<double, std::true_type>,
        // property 'range'
        QtPrivate::TypeAndForceComplete<int, std::true_type>,
        // property 'odometer'
        QtPrivate::TypeAndForceComplete<double, std::true_type>,
        // property 'tripDistance'
        QtPrivate::TypeAndForceComplete<double, std::true_type>,
        // property 'checkEngine'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'absFault'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'espFault'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'doorsOpen'
        QtPrivate::TypeAndForceComplete<QList<bool>, std::true_type>,
        // property 'hoodOpen'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'trunkOpen'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'lowBeam'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'highBeam'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'fogLightsFront'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'fogLightsRear'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'hazardLights'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'parkingBrake'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'lowFuelWarning'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'lowOilPressureWarning'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'highEngineTempWarning'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'seatbeltUnfastened'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'airbagFault'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'batteryFault'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'cruiseControlActive'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'leftSignalActive'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'rightSignalActive'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'tpmsTemps'
        QtPrivate::TypeAndForceComplete<QList<float>, std::true_type>,
        // property 'tpmsPressures'
        QtPrivate::TypeAndForceComplete<QList<float>, std::true_type>,
        // property 'navigationDistance'
        QtPrivate::TypeAndForceComplete<float, std::true_type>,
        // property 'navigationAngle'
        QtPrivate::TypeAndForceComplete<float, std::true_type>,
        // property 'currentTrack'
        QtPrivate::TypeAndForceComplete<QString, std::true_type>,
        // property 'connectedPhoneName'
        QtPrivate::TypeAndForceComplete<QString, std::true_type>,
        // property 'signalStrength'
        QtPrivate::TypeAndForceComplete<int, std::true_type>,
        // property 'currentArtist'
        QtPrivate::TypeAndForceComplete<QString, std::true_type>,
        // property 'currentAlbum'
        QtPrivate::TypeAndForceComplete<QString, std::true_type>,
        // property 'albumArt'
        QtPrivate::TypeAndForceComplete<QString, std::true_type>,
        // property 'isPlaying'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'trackCurrentTime'
        QtPrivate::TypeAndForceComplete<int, std::true_type>,
        // property 'trackTotalTime'
        QtPrivate::TypeAndForceComplete<int, std::true_type>,
        // property 'callStatus'
        QtPrivate::TypeAndForceComplete<CallStatus, std::true_type>,
        // property 'callerName'
        QtPrivate::TypeAndForceComplete<QString, std::true_type>,
        // property 'callerNumber'
        QtPrivate::TypeAndForceComplete<QString, std::true_type>,
        // property 'callDuration'
        QtPrivate::TypeAndForceComplete<int, std::true_type>,
        // property 'cpuLoad'
        QtPrivate::TypeAndForceComplete<float, std::true_type>,
        // property 'fps'
        QtPrivate::TypeAndForceComplete<int, std::true_type>,
        // property 'canError'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'engineHours'
        QtPrivate::TypeAndForceComplete<float, std::true_type>,
        // property 'fogLightsFrontActive'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'fogLightsRearActive'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'steeringFault'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'washerFluidLow'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'brakePadWear'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'rainLightSensor'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'winterMode'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'infoMessage'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'glowPlugActive'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'frostWarning'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'keyDetected'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'keyBatteryLow'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'distanceWarning'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'clutchPedal'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'brakePedal'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'steeringLock'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'highBeamActive'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'tpmsWarning'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'exteriorLightFault'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'dpfWarning'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'trailerConnected'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'airSuspensionWarning'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'laneAssist'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'catalystOverheat'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'adaptiveHeadlights'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'headlightLevelFault'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'spoilerFault'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'convertibleRoofFault'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'waterInFuel'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'airFilterClogged'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'ecoMode'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'hillDescentControl'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'overheatWarning'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'fuelFilterFault'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'transmissionFault'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'speedLimiter'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'suspensionDamping'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'lowOilPressure'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'frontDefrost'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'rearDefrost'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'autoWipe'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'stabilityControlOff'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // Q_OBJECT / Q_GADGET
        QtPrivate::TypeAndForceComplete<VehicleData, std::true_type>,
        // method 'speedChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'rpmChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'gearChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'fuelLevelChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'temperatureChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'rangeChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'odometerChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'tripDistanceChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'checkEngineChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'absFaultChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'espFaultChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'doorsOpenChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'hoodOpenChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'trunkOpenChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'lowBeamChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'highBeamChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'fogLightsFrontChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'fogLightsRearChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'hazardLightsChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'parkingBrakeChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'lowFuelWarningChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'lowOilPressureWarningChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'highEngineTempWarningChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'seatbeltUnfastenedChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'airbagFaultChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'batteryFaultChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'cruiseControlActiveChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'leftSignalActiveChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'rightSignalActiveChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'tpmsTempsChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'tpmsPressuresChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'navigationDistanceChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'navigationAngleChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'currentTrackChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'connectedPhoneNameChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'signalStrengthChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'currentArtistChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'currentAlbumChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'albumArtChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'isPlayingChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'trackCurrentTimeChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'trackTotalTimeChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'callStatusChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'callerNameChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'callerNumberChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'callDurationChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'cpuLoadChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'fpsChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'canErrorChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'engineHoursChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'fogLightsFrontActiveChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'fogLightsRearActiveChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'steeringFaultChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'washerFluidLowChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'brakePadWearChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'rainLightSensorChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'winterModeChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'infoMessageChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'glowPlugActiveChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'frostWarningChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'keyDetectedChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'keyBatteryLowChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'distanceWarningChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'clutchPedalChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'brakePedalChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'steeringLockChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'highBeamActiveChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'tpmsWarningChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'exteriorLightFaultChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'dpfWarningChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'trailerConnectedChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'airSuspensionWarningChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'laneAssistChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'catalystOverheatChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'adaptiveHeadlightsChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'headlightLevelFaultChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'spoilerFaultChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'convertibleRoofFaultChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'waterInFuelChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'airFilterCloggedChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'ecoModeChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'hillDescentControlChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'overheatWarningChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'fuelFilterFaultChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'transmissionFaultChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'speedLimiterChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'suspensionDampingChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'lowOilPressureChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'frontDefrostChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'rearDefrostChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'autoWipeChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'stabilityControlOffChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>
    >,
    nullptr
} };

void VehicleData::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<VehicleData *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->speedChanged(); break;
        case 1: _t->rpmChanged(); break;
        case 2: _t->gearChanged(); break;
        case 3: _t->fuelLevelChanged(); break;
        case 4: _t->temperatureChanged(); break;
        case 5: _t->rangeChanged(); break;
        case 6: _t->odometerChanged(); break;
        case 7: _t->tripDistanceChanged(); break;
        case 8: _t->checkEngineChanged(); break;
        case 9: _t->absFaultChanged(); break;
        case 10: _t->espFaultChanged(); break;
        case 11: _t->doorsOpenChanged(); break;
        case 12: _t->hoodOpenChanged(); break;
        case 13: _t->trunkOpenChanged(); break;
        case 14: _t->lowBeamChanged(); break;
        case 15: _t->highBeamChanged(); break;
        case 16: _t->fogLightsFrontChanged(); break;
        case 17: _t->fogLightsRearChanged(); break;
        case 18: _t->hazardLightsChanged(); break;
        case 19: _t->parkingBrakeChanged(); break;
        case 20: _t->lowFuelWarningChanged(); break;
        case 21: _t->lowOilPressureWarningChanged(); break;
        case 22: _t->highEngineTempWarningChanged(); break;
        case 23: _t->seatbeltUnfastenedChanged(); break;
        case 24: _t->airbagFaultChanged(); break;
        case 25: _t->batteryFaultChanged(); break;
        case 26: _t->cruiseControlActiveChanged(); break;
        case 27: _t->leftSignalActiveChanged(); break;
        case 28: _t->rightSignalActiveChanged(); break;
        case 29: _t->tpmsTempsChanged(); break;
        case 30: _t->tpmsPressuresChanged(); break;
        case 31: _t->navigationDistanceChanged(); break;
        case 32: _t->navigationAngleChanged(); break;
        case 33: _t->currentTrackChanged(); break;
        case 34: _t->connectedPhoneNameChanged(); break;
        case 35: _t->signalStrengthChanged(); break;
        case 36: _t->currentArtistChanged(); break;
        case 37: _t->currentAlbumChanged(); break;
        case 38: _t->albumArtChanged(); break;
        case 39: _t->isPlayingChanged(); break;
        case 40: _t->trackCurrentTimeChanged(); break;
        case 41: _t->trackTotalTimeChanged(); break;
        case 42: _t->callStatusChanged(); break;
        case 43: _t->callerNameChanged(); break;
        case 44: _t->callerNumberChanged(); break;
        case 45: _t->callDurationChanged(); break;
        case 46: _t->cpuLoadChanged(); break;
        case 47: _t->fpsChanged(); break;
        case 48: _t->canErrorChanged(); break;
        case 49: _t->engineHoursChanged(); break;
        case 50: _t->fogLightsFrontActiveChanged(); break;
        case 51: _t->fogLightsRearActiveChanged(); break;
        case 52: _t->steeringFaultChanged(); break;
        case 53: _t->washerFluidLowChanged(); break;
        case 54: _t->brakePadWearChanged(); break;
        case 55: _t->rainLightSensorChanged(); break;
        case 56: _t->winterModeChanged(); break;
        case 57: _t->infoMessageChanged(); break;
        case 58: _t->glowPlugActiveChanged(); break;
        case 59: _t->frostWarningChanged(); break;
        case 60: _t->keyDetectedChanged(); break;
        case 61: _t->keyBatteryLowChanged(); break;
        case 62: _t->distanceWarningChanged(); break;
        case 63: _t->clutchPedalChanged(); break;
        case 64: _t->brakePedalChanged(); break;
        case 65: _t->steeringLockChanged(); break;
        case 66: _t->highBeamActiveChanged(); break;
        case 67: _t->tpmsWarningChanged(); break;
        case 68: _t->exteriorLightFaultChanged(); break;
        case 69: _t->dpfWarningChanged(); break;
        case 70: _t->trailerConnectedChanged(); break;
        case 71: _t->airSuspensionWarningChanged(); break;
        case 72: _t->laneAssistChanged(); break;
        case 73: _t->catalystOverheatChanged(); break;
        case 74: _t->adaptiveHeadlightsChanged(); break;
        case 75: _t->headlightLevelFaultChanged(); break;
        case 76: _t->spoilerFaultChanged(); break;
        case 77: _t->convertibleRoofFaultChanged(); break;
        case 78: _t->waterInFuelChanged(); break;
        case 79: _t->airFilterCloggedChanged(); break;
        case 80: _t->ecoModeChanged(); break;
        case 81: _t->hillDescentControlChanged(); break;
        case 82: _t->overheatWarningChanged(); break;
        case 83: _t->fuelFilterFaultChanged(); break;
        case 84: _t->transmissionFaultChanged(); break;
        case 85: _t->speedLimiterChanged(); break;
        case 86: _t->suspensionDampingChanged(); break;
        case 87: _t->lowOilPressureChanged(); break;
        case 88: _t->frontDefrostChanged(); break;
        case 89: _t->rearDefrostChanged(); break;
        case 90: _t->autoWipeChanged(); break;
        case 91: _t->stabilityControlOffChanged(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::speedChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::rpmChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::gearChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::fuelLevelChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::temperatureChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 4;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::rangeChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 5;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::odometerChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 6;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::tripDistanceChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 7;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::checkEngineChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 8;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::absFaultChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 9;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::espFaultChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 10;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::doorsOpenChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 11;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::hoodOpenChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 12;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::trunkOpenChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 13;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::lowBeamChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 14;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::highBeamChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 15;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::fogLightsFrontChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 16;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::fogLightsRearChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 17;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::hazardLightsChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 18;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::parkingBrakeChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 19;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::lowFuelWarningChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 20;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::lowOilPressureWarningChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 21;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::highEngineTempWarningChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 22;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::seatbeltUnfastenedChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 23;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::airbagFaultChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 24;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::batteryFaultChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 25;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::cruiseControlActiveChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 26;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::leftSignalActiveChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 27;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::rightSignalActiveChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 28;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::tpmsTempsChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 29;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::tpmsPressuresChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 30;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::navigationDistanceChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 31;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::navigationAngleChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 32;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::currentTrackChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 33;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::connectedPhoneNameChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 34;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::signalStrengthChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 35;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::currentArtistChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 36;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::currentAlbumChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 37;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::albumArtChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 38;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::isPlayingChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 39;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::trackCurrentTimeChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 40;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::trackTotalTimeChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 41;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::callStatusChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 42;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::callerNameChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 43;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::callerNumberChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 44;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::callDurationChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 45;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::cpuLoadChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 46;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::fpsChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 47;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::canErrorChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 48;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::engineHoursChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 49;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::fogLightsFrontActiveChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 50;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::fogLightsRearActiveChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 51;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::steeringFaultChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 52;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::washerFluidLowChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 53;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::brakePadWearChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 54;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::rainLightSensorChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 55;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::winterModeChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 56;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::infoMessageChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 57;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::glowPlugActiveChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 58;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::frostWarningChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 59;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::keyDetectedChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 60;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::keyBatteryLowChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 61;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::distanceWarningChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 62;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::clutchPedalChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 63;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::brakePedalChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 64;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::steeringLockChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 65;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::highBeamActiveChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 66;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::tpmsWarningChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 67;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::exteriorLightFaultChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 68;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::dpfWarningChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 69;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::trailerConnectedChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 70;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::airSuspensionWarningChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 71;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::laneAssistChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 72;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::catalystOverheatChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 73;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::adaptiveHeadlightsChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 74;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::headlightLevelFaultChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 75;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::spoilerFaultChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 76;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::convertibleRoofFaultChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 77;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::waterInFuelChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 78;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::airFilterCloggedChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 79;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::ecoModeChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 80;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::hillDescentControlChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 81;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::overheatWarningChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 82;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::fuelFilterFaultChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 83;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::transmissionFaultChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 84;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::speedLimiterChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 85;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::suspensionDampingChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 86;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::lowOilPressureChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 87;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::frontDefrostChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 88;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::rearDefrostChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 89;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::autoWipeChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 90;
                return;
            }
        }
        {
            using _t = void (VehicleData::*)();
            if (_t _q_method = &VehicleData::stabilityControlOffChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 91;
                return;
            }
        }
    } else if (_c == QMetaObject::RegisterPropertyMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 11:
            *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QList<bool> >(); break;
        case 30:
        case 29:
            *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QList<float> >(); break;
        }
    } else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<VehicleData *>(_o);
        (void)_t;
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< double*>(_v) = _t->speed(); break;
        case 1: *reinterpret_cast< int*>(_v) = _t->rpm(); break;
        case 2: *reinterpret_cast< QString*>(_v) = _t->gear(); break;
        case 3: *reinterpret_cast< double*>(_v) = _t->fuelLevel(); break;
        case 4: *reinterpret_cast< double*>(_v) = _t->temperature(); break;
        case 5: *reinterpret_cast< int*>(_v) = _t->range(); break;
        case 6: *reinterpret_cast< double*>(_v) = _t->odometer(); break;
        case 7: *reinterpret_cast< double*>(_v) = _t->tripDistance(); break;
        case 8: *reinterpret_cast< bool*>(_v) = _t->checkEngine(); break;
        case 9: *reinterpret_cast< bool*>(_v) = _t->absFault(); break;
        case 10: *reinterpret_cast< bool*>(_v) = _t->espFault(); break;
        case 11: *reinterpret_cast< QList<bool>*>(_v) = _t->doorsOpen(); break;
        case 12: *reinterpret_cast< bool*>(_v) = _t->hoodOpen(); break;
        case 13: *reinterpret_cast< bool*>(_v) = _t->trunkOpen(); break;
        case 14: *reinterpret_cast< bool*>(_v) = _t->lowBeam(); break;
        case 15: *reinterpret_cast< bool*>(_v) = _t->highBeam(); break;
        case 16: *reinterpret_cast< bool*>(_v) = _t->fogLightsFront(); break;
        case 17: *reinterpret_cast< bool*>(_v) = _t->fogLightsRear(); break;
        case 18: *reinterpret_cast< bool*>(_v) = _t->hazardLights(); break;
        case 19: *reinterpret_cast< bool*>(_v) = _t->parkingBrake(); break;
        case 20: *reinterpret_cast< bool*>(_v) = _t->lowFuelWarning(); break;
        case 21: *reinterpret_cast< bool*>(_v) = _t->lowOilPressureWarning(); break;
        case 22: *reinterpret_cast< bool*>(_v) = _t->highEngineTempWarning(); break;
        case 23: *reinterpret_cast< bool*>(_v) = _t->seatbeltUnfastened(); break;
        case 24: *reinterpret_cast< bool*>(_v) = _t->airbagFault(); break;
        case 25: *reinterpret_cast< bool*>(_v) = _t->batteryFault(); break;
        case 26: *reinterpret_cast< bool*>(_v) = _t->cruiseControlActive(); break;
        case 27: *reinterpret_cast< bool*>(_v) = _t->leftSignalActive(); break;
        case 28: *reinterpret_cast< bool*>(_v) = _t->rightSignalActive(); break;
        case 29: *reinterpret_cast< QList<float>*>(_v) = _t->tpmsTemps(); break;
        case 30: *reinterpret_cast< QList<float>*>(_v) = _t->tpmsPressures(); break;
        case 31: *reinterpret_cast< float*>(_v) = _t->navigationDistance(); break;
        case 32: *reinterpret_cast< float*>(_v) = _t->navigationAngle(); break;
        case 33: *reinterpret_cast< QString*>(_v) = _t->currentTrack(); break;
        case 34: *reinterpret_cast< QString*>(_v) = _t->connectedPhoneName(); break;
        case 35: *reinterpret_cast< int*>(_v) = _t->signalStrength(); break;
        case 36: *reinterpret_cast< QString*>(_v) = _t->currentArtist(); break;
        case 37: *reinterpret_cast< QString*>(_v) = _t->currentAlbum(); break;
        case 38: *reinterpret_cast< QString*>(_v) = _t->albumArt(); break;
        case 39: *reinterpret_cast< bool*>(_v) = _t->isPlaying(); break;
        case 40: *reinterpret_cast< int*>(_v) = _t->trackCurrentTime(); break;
        case 41: *reinterpret_cast< int*>(_v) = _t->trackTotalTime(); break;
        case 42: *reinterpret_cast< CallStatus*>(_v) = _t->callStatus(); break;
        case 43: *reinterpret_cast< QString*>(_v) = _t->callerName(); break;
        case 44: *reinterpret_cast< QString*>(_v) = _t->callerNumber(); break;
        case 45: *reinterpret_cast< int*>(_v) = _t->callDuration(); break;
        case 46: *reinterpret_cast< float*>(_v) = _t->cpuLoad(); break;
        case 47: *reinterpret_cast< int*>(_v) = _t->fps(); break;
        case 48: *reinterpret_cast< bool*>(_v) = _t->canError(); break;
        case 49: *reinterpret_cast< float*>(_v) = _t->engineHours(); break;
        case 50: *reinterpret_cast< bool*>(_v) = _t->fogLightsFrontActive(); break;
        case 51: *reinterpret_cast< bool*>(_v) = _t->fogLightsRearActive(); break;
        case 52: *reinterpret_cast< bool*>(_v) = _t->steeringFault(); break;
        case 53: *reinterpret_cast< bool*>(_v) = _t->washerFluidLow(); break;
        case 54: *reinterpret_cast< bool*>(_v) = _t->brakePadWear(); break;
        case 55: *reinterpret_cast< bool*>(_v) = _t->rainLightSensor(); break;
        case 56: *reinterpret_cast< bool*>(_v) = _t->winterMode(); break;
        case 57: *reinterpret_cast< bool*>(_v) = _t->infoMessage(); break;
        case 58: *reinterpret_cast< bool*>(_v) = _t->glowPlugActive(); break;
        case 59: *reinterpret_cast< bool*>(_v) = _t->frostWarning(); break;
        case 60: *reinterpret_cast< bool*>(_v) = _t->keyDetected(); break;
        case 61: *reinterpret_cast< bool*>(_v) = _t->keyBatteryLow(); break;
        case 62: *reinterpret_cast< bool*>(_v) = _t->distanceWarning(); break;
        case 63: *reinterpret_cast< bool*>(_v) = _t->clutchPedal(); break;
        case 64: *reinterpret_cast< bool*>(_v) = _t->brakePedal(); break;
        case 65: *reinterpret_cast< bool*>(_v) = _t->steeringLock(); break;
        case 66: *reinterpret_cast< bool*>(_v) = _t->highBeamActive(); break;
        case 67: *reinterpret_cast< bool*>(_v) = _t->tpmsWarning(); break;
        case 68: *reinterpret_cast< bool*>(_v) = _t->exteriorLightFault(); break;
        case 69: *reinterpret_cast< bool*>(_v) = _t->dpfWarning(); break;
        case 70: *reinterpret_cast< bool*>(_v) = _t->trailerConnected(); break;
        case 71: *reinterpret_cast< bool*>(_v) = _t->airSuspensionWarning(); break;
        case 72: *reinterpret_cast< bool*>(_v) = _t->laneAssist(); break;
        case 73: *reinterpret_cast< bool*>(_v) = _t->catalystOverheat(); break;
        case 74: *reinterpret_cast< bool*>(_v) = _t->adaptiveHeadlights(); break;
        case 75: *reinterpret_cast< bool*>(_v) = _t->headlightLevelFault(); break;
        case 76: *reinterpret_cast< bool*>(_v) = _t->spoilerFault(); break;
        case 77: *reinterpret_cast< bool*>(_v) = _t->convertibleRoofFault(); break;
        case 78: *reinterpret_cast< bool*>(_v) = _t->waterInFuel(); break;
        case 79: *reinterpret_cast< bool*>(_v) = _t->airFilterClogged(); break;
        case 80: *reinterpret_cast< bool*>(_v) = _t->ecoMode(); break;
        case 81: *reinterpret_cast< bool*>(_v) = _t->hillDescentControl(); break;
        case 82: *reinterpret_cast< bool*>(_v) = _t->overheatWarning(); break;
        case 83: *reinterpret_cast< bool*>(_v) = _t->fuelFilterFault(); break;
        case 84: *reinterpret_cast< bool*>(_v) = _t->transmissionFault(); break;
        case 85: *reinterpret_cast< bool*>(_v) = _t->speedLimiter(); break;
        case 86: *reinterpret_cast< bool*>(_v) = _t->suspensionDamping(); break;
        case 87: *reinterpret_cast< bool*>(_v) = _t->lowOilPressure(); break;
        case 88: *reinterpret_cast< bool*>(_v) = _t->frontDefrost(); break;
        case 89: *reinterpret_cast< bool*>(_v) = _t->rearDefrost(); break;
        case 90: *reinterpret_cast< bool*>(_v) = _t->autoWipe(); break;
        case 91: *reinterpret_cast< bool*>(_v) = _t->stabilityControlOff(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<VehicleData *>(_o);
        (void)_t;
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setSpeed(*reinterpret_cast< double*>(_v)); break;
        case 1: _t->setRpm(*reinterpret_cast< int*>(_v)); break;
        case 2: _t->setGear(*reinterpret_cast< QString*>(_v)); break;
        case 3: _t->setFuelLevel(*reinterpret_cast< double*>(_v)); break;
        case 4: _t->setTemperature(*reinterpret_cast< double*>(_v)); break;
        case 5: _t->setRange(*reinterpret_cast< int*>(_v)); break;
        case 6: _t->setOdometer(*reinterpret_cast< double*>(_v)); break;
        case 7: _t->setTripDistance(*reinterpret_cast< double*>(_v)); break;
        case 8: _t->setCheckEngine(*reinterpret_cast< bool*>(_v)); break;
        case 9: _t->setAbsFault(*reinterpret_cast< bool*>(_v)); break;
        case 10: _t->setEspFault(*reinterpret_cast< bool*>(_v)); break;
        case 11: _t->setDoorsOpen(*reinterpret_cast< QList<bool>*>(_v)); break;
        case 12: _t->setHoodOpen(*reinterpret_cast< bool*>(_v)); break;
        case 13: _t->setTrunkOpen(*reinterpret_cast< bool*>(_v)); break;
        case 14: _t->setLowBeam(*reinterpret_cast< bool*>(_v)); break;
        case 15: _t->setHighBeam(*reinterpret_cast< bool*>(_v)); break;
        case 16: _t->setFogLightsFront(*reinterpret_cast< bool*>(_v)); break;
        case 17: _t->setFogLightsRear(*reinterpret_cast< bool*>(_v)); break;
        case 18: _t->setHazardLights(*reinterpret_cast< bool*>(_v)); break;
        case 19: _t->setParkingBrake(*reinterpret_cast< bool*>(_v)); break;
        case 20: _t->setLowFuelWarning(*reinterpret_cast< bool*>(_v)); break;
        case 21: _t->setLowOilPressureWarning(*reinterpret_cast< bool*>(_v)); break;
        case 22: _t->setHighEngineTempWarning(*reinterpret_cast< bool*>(_v)); break;
        case 23: _t->setSeatbeltUnfastened(*reinterpret_cast< bool*>(_v)); break;
        case 24: _t->setAirbagFault(*reinterpret_cast< bool*>(_v)); break;
        case 25: _t->setBatteryFault(*reinterpret_cast< bool*>(_v)); break;
        case 26: _t->setCruiseControlActive(*reinterpret_cast< bool*>(_v)); break;
        case 27: _t->setLeftSignalActive(*reinterpret_cast< bool*>(_v)); break;
        case 28: _t->setRightSignalActive(*reinterpret_cast< bool*>(_v)); break;
        case 29: _t->setTpmsTemps(*reinterpret_cast< QList<float>*>(_v)); break;
        case 30: _t->setTpmsPressures(*reinterpret_cast< QList<float>*>(_v)); break;
        case 31: _t->setNavigationDistance(*reinterpret_cast< float*>(_v)); break;
        case 32: _t->setNavigationAngle(*reinterpret_cast< float*>(_v)); break;
        case 33: _t->setCurrentTrack(*reinterpret_cast< QString*>(_v)); break;
        case 34: _t->setConnectedPhoneName(*reinterpret_cast< QString*>(_v)); break;
        case 35: _t->setSignalStrength(*reinterpret_cast< int*>(_v)); break;
        case 36: _t->setCurrentArtist(*reinterpret_cast< QString*>(_v)); break;
        case 37: _t->setCurrentAlbum(*reinterpret_cast< QString*>(_v)); break;
        case 38: _t->setAlbumArt(*reinterpret_cast< QString*>(_v)); break;
        case 39: _t->setIsPlaying(*reinterpret_cast< bool*>(_v)); break;
        case 40: _t->setTrackCurrentTime(*reinterpret_cast< int*>(_v)); break;
        case 41: _t->setTrackTotalTime(*reinterpret_cast< int*>(_v)); break;
        case 42: _t->setCallStatus(*reinterpret_cast< CallStatus*>(_v)); break;
        case 43: _t->setCallerName(*reinterpret_cast< QString*>(_v)); break;
        case 44: _t->setCallerNumber(*reinterpret_cast< QString*>(_v)); break;
        case 45: _t->setCallDuration(*reinterpret_cast< int*>(_v)); break;
        case 46: _t->setCpuLoad(*reinterpret_cast< float*>(_v)); break;
        case 47: _t->setFps(*reinterpret_cast< int*>(_v)); break;
        case 48: _t->setCanError(*reinterpret_cast< bool*>(_v)); break;
        case 49: _t->setEngineHours(*reinterpret_cast< float*>(_v)); break;
        case 50: _t->setFogLightsFrontActive(*reinterpret_cast< bool*>(_v)); break;
        case 51: _t->setFogLightsRearActive(*reinterpret_cast< bool*>(_v)); break;
        case 52: _t->setSteeringFault(*reinterpret_cast< bool*>(_v)); break;
        case 53: _t->setWasherFluidLow(*reinterpret_cast< bool*>(_v)); break;
        case 54: _t->setBrakePadWear(*reinterpret_cast< bool*>(_v)); break;
        case 55: _t->setRainLightSensor(*reinterpret_cast< bool*>(_v)); break;
        case 56: _t->setWinterMode(*reinterpret_cast< bool*>(_v)); break;
        case 57: _t->setInfoMessage(*reinterpret_cast< bool*>(_v)); break;
        case 58: _t->setGlowPlugActive(*reinterpret_cast< bool*>(_v)); break;
        case 59: _t->setFrostWarning(*reinterpret_cast< bool*>(_v)); break;
        case 60: _t->setKeyDetected(*reinterpret_cast< bool*>(_v)); break;
        case 61: _t->setKeyBatteryLow(*reinterpret_cast< bool*>(_v)); break;
        case 62: _t->setDistanceWarning(*reinterpret_cast< bool*>(_v)); break;
        case 63: _t->setClutchPedal(*reinterpret_cast< bool*>(_v)); break;
        case 64: _t->setBrakePedal(*reinterpret_cast< bool*>(_v)); break;
        case 65: _t->setSteeringLock(*reinterpret_cast< bool*>(_v)); break;
        case 66: _t->setHighBeamActive(*reinterpret_cast< bool*>(_v)); break;
        case 67: _t->setTpmsWarning(*reinterpret_cast< bool*>(_v)); break;
        case 68: _t->setExteriorLightFault(*reinterpret_cast< bool*>(_v)); break;
        case 69: _t->setDpfWarning(*reinterpret_cast< bool*>(_v)); break;
        case 70: _t->setTrailerConnected(*reinterpret_cast< bool*>(_v)); break;
        case 71: _t->setAirSuspensionWarning(*reinterpret_cast< bool*>(_v)); break;
        case 72: _t->setLaneAssist(*reinterpret_cast< bool*>(_v)); break;
        case 73: _t->setCatalystOverheat(*reinterpret_cast< bool*>(_v)); break;
        case 74: _t->setAdaptiveHeadlights(*reinterpret_cast< bool*>(_v)); break;
        case 75: _t->setHeadlightLevelFault(*reinterpret_cast< bool*>(_v)); break;
        case 76: _t->setSpoilerFault(*reinterpret_cast< bool*>(_v)); break;
        case 77: _t->setConvertibleRoofFault(*reinterpret_cast< bool*>(_v)); break;
        case 78: _t->setWaterInFuel(*reinterpret_cast< bool*>(_v)); break;
        case 79: _t->setAirFilterClogged(*reinterpret_cast< bool*>(_v)); break;
        case 80: _t->setEcoMode(*reinterpret_cast< bool*>(_v)); break;
        case 81: _t->setHillDescentControl(*reinterpret_cast< bool*>(_v)); break;
        case 82: _t->setOverheatWarning(*reinterpret_cast< bool*>(_v)); break;
        case 83: _t->setFuelFilterFault(*reinterpret_cast< bool*>(_v)); break;
        case 84: _t->setTransmissionFault(*reinterpret_cast< bool*>(_v)); break;
        case 85: _t->setSpeedLimiter(*reinterpret_cast< bool*>(_v)); break;
        case 86: _t->setSuspensionDamping(*reinterpret_cast< bool*>(_v)); break;
        case 87: _t->setLowOilPressure(*reinterpret_cast< bool*>(_v)); break;
        case 88: _t->setFrontDefrost(*reinterpret_cast< bool*>(_v)); break;
        case 89: _t->setRearDefrost(*reinterpret_cast< bool*>(_v)); break;
        case 90: _t->setAutoWipe(*reinterpret_cast< bool*>(_v)); break;
        case 91: _t->setStabilityControlOff(*reinterpret_cast< bool*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    } else if (_c == QMetaObject::BindableProperty) {
    }
}

const QMetaObject *VehicleData::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *VehicleData::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_CLASSVehicleDataENDCLASS.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int VehicleData::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 92)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 92;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 92)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 92;
    }else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::BindableProperty
            || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 92;
    }
    return _id;
}

// SIGNAL 0
void VehicleData::speedChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void VehicleData::rpmChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void VehicleData::gearChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void VehicleData::fuelLevelChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void VehicleData::temperatureChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}

// SIGNAL 5
void VehicleData::rangeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 5, nullptr);
}

// SIGNAL 6
void VehicleData::odometerChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 6, nullptr);
}

// SIGNAL 7
void VehicleData::tripDistanceChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 7, nullptr);
}

// SIGNAL 8
void VehicleData::checkEngineChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 8, nullptr);
}

// SIGNAL 9
void VehicleData::absFaultChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 9, nullptr);
}

// SIGNAL 10
void VehicleData::espFaultChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 10, nullptr);
}

// SIGNAL 11
void VehicleData::doorsOpenChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 11, nullptr);
}

// SIGNAL 12
void VehicleData::hoodOpenChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 12, nullptr);
}

// SIGNAL 13
void VehicleData::trunkOpenChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 13, nullptr);
}

// SIGNAL 14
void VehicleData::lowBeamChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 14, nullptr);
}

// SIGNAL 15
void VehicleData::highBeamChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 15, nullptr);
}

// SIGNAL 16
void VehicleData::fogLightsFrontChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 16, nullptr);
}

// SIGNAL 17
void VehicleData::fogLightsRearChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 17, nullptr);
}

// SIGNAL 18
void VehicleData::hazardLightsChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 18, nullptr);
}

// SIGNAL 19
void VehicleData::parkingBrakeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 19, nullptr);
}

// SIGNAL 20
void VehicleData::lowFuelWarningChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 20, nullptr);
}

// SIGNAL 21
void VehicleData::lowOilPressureWarningChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 21, nullptr);
}

// SIGNAL 22
void VehicleData::highEngineTempWarningChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 22, nullptr);
}

// SIGNAL 23
void VehicleData::seatbeltUnfastenedChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 23, nullptr);
}

// SIGNAL 24
void VehicleData::airbagFaultChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 24, nullptr);
}

// SIGNAL 25
void VehicleData::batteryFaultChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 25, nullptr);
}

// SIGNAL 26
void VehicleData::cruiseControlActiveChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 26, nullptr);
}

// SIGNAL 27
void VehicleData::leftSignalActiveChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 27, nullptr);
}

// SIGNAL 28
void VehicleData::rightSignalActiveChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 28, nullptr);
}

// SIGNAL 29
void VehicleData::tpmsTempsChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 29, nullptr);
}

// SIGNAL 30
void VehicleData::tpmsPressuresChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 30, nullptr);
}

// SIGNAL 31
void VehicleData::navigationDistanceChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 31, nullptr);
}

// SIGNAL 32
void VehicleData::navigationAngleChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 32, nullptr);
}

// SIGNAL 33
void VehicleData::currentTrackChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 33, nullptr);
}

// SIGNAL 34
void VehicleData::connectedPhoneNameChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 34, nullptr);
}

// SIGNAL 35
void VehicleData::signalStrengthChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 35, nullptr);
}

// SIGNAL 36
void VehicleData::currentArtistChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 36, nullptr);
}

// SIGNAL 37
void VehicleData::currentAlbumChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 37, nullptr);
}

// SIGNAL 38
void VehicleData::albumArtChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 38, nullptr);
}

// SIGNAL 39
void VehicleData::isPlayingChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 39, nullptr);
}

// SIGNAL 40
void VehicleData::trackCurrentTimeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 40, nullptr);
}

// SIGNAL 41
void VehicleData::trackTotalTimeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 41, nullptr);
}

// SIGNAL 42
void VehicleData::callStatusChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 42, nullptr);
}

// SIGNAL 43
void VehicleData::callerNameChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 43, nullptr);
}

// SIGNAL 44
void VehicleData::callerNumberChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 44, nullptr);
}

// SIGNAL 45
void VehicleData::callDurationChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 45, nullptr);
}

// SIGNAL 46
void VehicleData::cpuLoadChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 46, nullptr);
}

// SIGNAL 47
void VehicleData::fpsChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 47, nullptr);
}

// SIGNAL 48
void VehicleData::canErrorChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 48, nullptr);
}

// SIGNAL 49
void VehicleData::engineHoursChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 49, nullptr);
}

// SIGNAL 50
void VehicleData::fogLightsFrontActiveChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 50, nullptr);
}

// SIGNAL 51
void VehicleData::fogLightsRearActiveChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 51, nullptr);
}

// SIGNAL 52
void VehicleData::steeringFaultChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 52, nullptr);
}

// SIGNAL 53
void VehicleData::washerFluidLowChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 53, nullptr);
}

// SIGNAL 54
void VehicleData::brakePadWearChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 54, nullptr);
}

// SIGNAL 55
void VehicleData::rainLightSensorChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 55, nullptr);
}

// SIGNAL 56
void VehicleData::winterModeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 56, nullptr);
}

// SIGNAL 57
void VehicleData::infoMessageChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 57, nullptr);
}

// SIGNAL 58
void VehicleData::glowPlugActiveChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 58, nullptr);
}

// SIGNAL 59
void VehicleData::frostWarningChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 59, nullptr);
}

// SIGNAL 60
void VehicleData::keyDetectedChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 60, nullptr);
}

// SIGNAL 61
void VehicleData::keyBatteryLowChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 61, nullptr);
}

// SIGNAL 62
void VehicleData::distanceWarningChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 62, nullptr);
}

// SIGNAL 63
void VehicleData::clutchPedalChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 63, nullptr);
}

// SIGNAL 64
void VehicleData::brakePedalChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 64, nullptr);
}

// SIGNAL 65
void VehicleData::steeringLockChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 65, nullptr);
}

// SIGNAL 66
void VehicleData::highBeamActiveChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 66, nullptr);
}

// SIGNAL 67
void VehicleData::tpmsWarningChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 67, nullptr);
}

// SIGNAL 68
void VehicleData::exteriorLightFaultChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 68, nullptr);
}

// SIGNAL 69
void VehicleData::dpfWarningChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 69, nullptr);
}

// SIGNAL 70
void VehicleData::trailerConnectedChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 70, nullptr);
}

// SIGNAL 71
void VehicleData::airSuspensionWarningChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 71, nullptr);
}

// SIGNAL 72
void VehicleData::laneAssistChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 72, nullptr);
}

// SIGNAL 73
void VehicleData::catalystOverheatChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 73, nullptr);
}

// SIGNAL 74
void VehicleData::adaptiveHeadlightsChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 74, nullptr);
}

// SIGNAL 75
void VehicleData::headlightLevelFaultChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 75, nullptr);
}

// SIGNAL 76
void VehicleData::spoilerFaultChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 76, nullptr);
}

// SIGNAL 77
void VehicleData::convertibleRoofFaultChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 77, nullptr);
}

// SIGNAL 78
void VehicleData::waterInFuelChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 78, nullptr);
}

// SIGNAL 79
void VehicleData::airFilterCloggedChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 79, nullptr);
}

// SIGNAL 80
void VehicleData::ecoModeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 80, nullptr);
}

// SIGNAL 81
void VehicleData::hillDescentControlChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 81, nullptr);
}

// SIGNAL 82
void VehicleData::overheatWarningChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 82, nullptr);
}

// SIGNAL 83
void VehicleData::fuelFilterFaultChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 83, nullptr);
}

// SIGNAL 84
void VehicleData::transmissionFaultChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 84, nullptr);
}

// SIGNAL 85
void VehicleData::speedLimiterChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 85, nullptr);
}

// SIGNAL 86
void VehicleData::suspensionDampingChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 86, nullptr);
}

// SIGNAL 87
void VehicleData::lowOilPressureChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 87, nullptr);
}

// SIGNAL 88
void VehicleData::frontDefrostChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 88, nullptr);
}

// SIGNAL 89
void VehicleData::rearDefrostChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 89, nullptr);
}

// SIGNAL 90
void VehicleData::autoWipeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 90, nullptr);
}

// SIGNAL 91
void VehicleData::stabilityControlOffChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 91, nullptr);
}
QT_WARNING_POP
