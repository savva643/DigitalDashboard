# Руководство по интеграции навигации и карт

## Проблема

Вы правильно заметили проблему: **нельзя напрямую передать карту** из разных навигационных приложений (Google Maps, Яндекс.Карты, Waze и т.д.), так как у каждого приложения свой API и формат данных.

## Решение: Универсальный протокол передачи навигационных данных

### Подход, используемый в современных автомобилях

В современных автомобилях (BMW, Mercedes, Audi, Tesla и др.) используется **универсальный протокол передачи навигационных данных**, который работает независимо от приложения навигации.

---

## 🎯 Рекомендуемый подход

### 1. Не нужно создавать свой навигатор

**Вы НЕ должны создавать свой навигатор.** Вместо этого вы должны получать **навигационные данные** от любого приложения навигации через универсальный протокол.

### 2. Что передавать от магнитолы

Магнитола должна передавать **только данные**, а не саму карту:

#### Основные данные:
1. **Текущее местоположение** (GPS координаты)
   - Широта (latitude)
   - Долгота (longitude)
   - Точность (accuracy)
   - Скорость движения
   - Направление (heading)

2. **Маршрут** (Route)
   - Точка отправления (origin)
   - Точка назначения (destination)
   - Промежуточные точки (waypoints)
   - Список поворотов (turn-by-turn instructions)

3. **Следующий маневр** (Next Maneuver)
   - Расстояние до поворота (distance)
   - Угол поворота (angle)
   - Название улицы
   - Тип маневра (поворот налево, направо, прямо и т.д.)

4. **Информация о маршруте**
   - Общее расстояние до пункта назначения
   - Оставшееся время (ETA)
   - Текущая скорость движения
   - Информация о пробках

---

## 📡 Протоколы передачи данных

### Вариант 1: Android Auto / Apple CarPlay протокол

Современные магнитолы используют стандартизированные протоколы:

#### Android Auto Navigation Protocol:
```json
{
  "currentLocation": {
    "latitude": 55.7558,
    "longitude": 37.6173,
    "accuracy": 10,
    "speed": 60,
    "heading": 45
  },
  "route": {
    "origin": {
      "latitude": 55.7558,
      "longitude": 37.6173,
      "address": "Москва, Красная площадь"
    },
    "destination": {
      "latitude": 55.7520,
      "longitude": 37.6155,
      "address": "Москва, Кремль"
    },
    "waypoints": [],
    "totalDistance": 5000,
    "totalTime": 600,
    "instructions": [
      {
        "distance": 200,
        "angle": 90,
        "streetName": "Тверская улица",
        "maneuver": "turn_right",
        "icon": "turn_right.png"
      }
    ]
  },
  "nextManeuver": {
    "distance": 200,
    "angle": 90,
    "streetName": "Тверская улица",
    "maneuver": "turn_right"
  }
}
```

### Вариант 2: Кастомный протокол через CAN-шину или Serial/USB

Если магнитола не поддерживает Android Auto/CarPlay, можно создать свой протокол:

#### Структура данных:
```cpp
struct NavigationData {
    // Текущее местоположение
    double currentLatitude;
    double currentLongitude;
    float currentSpeed;
    float currentHeading;
    
    // Следующий маневр
    float navigationDistance;  // расстояние до поворота в метрах
    float navigationAngle;      // угол поворота в градусах
    char nextStreetName[64];    // название следующей улицы
    int maneuverType;           // тип маневра (0=прямо, 1=налево, 2=направо, и т.д.)
    
    // Маршрут
    double destinationLatitude;
    double destinationLongitude;
    float totalDistance;        // общее расстояние в метрах
    int totalTime;              // оставшееся время в секундах
    int eta;                    // время прибытия (Unix timestamp)
    
    // Пробки
    bool hasTraffic;
    int trafficDelay;           // задержка из-за пробок в секундах
};
```

---

## 🗺️ Отображение карты на приборной панели

### Вариант 1: Использовать готовые карты (рекомендуется)

**Не рисуйте карту сами!** Используйте готовые библиотеки:

#### Для Qt/QML:
- **QtLocation** - встроенная библиотека Qt для карт
- **Mapbox GL** - через WebView или нативный плагин
- **OpenStreetMap** - через QtLocation или OsmScout

#### Пример с QtLocation:
```qml
import QtLocation 5.15
import QtPositioning 5.15

Map {
    id: map
    anchors.fill: parent
    
    plugin: Plugin {
        name: "osm" // OpenStreetMap
    }
    
    center: QtPositioning.coordinate(
        vehicleData.currentLatitude,
        vehicleData.currentLongitude
    )
    zoomLevel: 15
    
    // Маршрут
    MapPolyline {
        path: routeCoordinates // координаты маршрута
        line.color: "#00E0FF"
        line.width: 5
    }
    
    // Текущее местоположение
    MapCircle {
        center: QtPositioning.coordinate(
            vehicleData.currentLatitude,
            vehicleData.currentLongitude
        )
        radius: 20
        color: "#4CAF50"
        border.color: "white"
        border.width: 2
    }
    
    // Пункт назначения
    MapCircle {
        center: QtPositioning.coordinate(
            vehicleData.destinationLatitude,
            vehicleData.destinationLongitude
        )
        radius: 30
        color: "#FF5555"
        border.color: "white"
        border.width: 2
    }
}
```

### Вариант 2: Минималистичный виджет (без карты)

Если не хотите показывать карту, можно показывать только:
- Стрелку направления
- Расстояние до поворота
- Название следующей улицы
- Текстовые инструкции

Это уже реализовано в вашем проекте через `navigationDistance` и `navigationAngle`.

---

## 🔌 Интеграция с магнитолой

### Сценарий 1: Магнитола с Android Auto / CarPlay

Если магнитола поддерживает Android Auto или CarPlay:

1. **Магнитола получает данные** от навигационного приложения через стандартный протокол
2. **Магнитола передает данные** на приборную панель через:
   - CAN-шину (специальные сообщения)
   - USB/Serial порт
   - Wi-Fi/Bluetooth
   - Внутренняя шина автомобиля

3. **Приборная панель получает данные** и отображает их

### Сценарий 2: Магнитола без Android Auto / CarPlay

Если магнитола не поддерживает стандартные протоколы:

1. **Создайте приложение-мост** на магнитоле, которое:
   - Подключается к навигационному приложению через Accessibility API (Android) или Screen Capture (iOS)
   - Парсит данные с экрана навигации
   - Передает данные на приборную панель

2. **Или используйте API навигационных приложений:**
   - Google Maps API (если приложение использует его)
   - Яндекс.Карты API
   - Waze API (если доступен)

---

## 📋 Что нужно добавить в VehicleData

### Новые свойства:

```cpp
// Навигация - текущее местоположение
Q_PROPERTY(double currentLatitude READ currentLatitude WRITE setCurrentLatitude NOTIFY currentLatitudeChanged)
Q_PROPERTY(double currentLongitude READ currentLongitude WRITE setCurrentLongitude NOTIFY currentLongitudeChanged)
Q_PROPERTY(float currentSpeed READ currentSpeed WRITE setCurrentSpeed NOTIFY currentSpeedChanged)
Q_PROPERTY(float currentHeading READ currentHeading WRITE setCurrentHeading NOTIFY currentHeadingChanged)

// Навигация - следующий маневр (уже есть)
Q_PROPERTY(float navigationDistance READ navigationDistance WRITE setNavigationDistance NOTIFY navigationDistanceChanged)
Q_PROPERTY(float navigationAngle READ navigationAngle WRITE setNavigationAngle NOTIFY navigationAngleChanged)
Q_PROPERTY(QString nextStreetName READ nextStreetName WRITE setNextStreetName NOTIFY nextStreetNameChanged)
Q_PROPERTY(int maneuverType READ maneuverType WRITE setManeuverType NOTIFY maneuverTypeChanged)

// Навигация - маршрут
Q_PROPERTY(double destinationLatitude READ destinationLatitude WRITE setDestinationLatitude NOTIFY destinationLatitudeChanged)
Q_PROPERTY(double destinationLongitude READ destinationLongitude WRITE setDestinationLongitude NOTIFY destinationLongitudeChanged)
Q_PROPERTY(float routeTotalDistance READ routeTotalDistance WRITE setRouteTotalDistance NOTIFY routeTotalDistanceChanged)
Q_PROPERTY(int routeTotalTime READ routeTotalTime WRITE setRouteTotalTime NOTIFY routeTotalTimeChanged)
Q_PROPERTY(int routeETA READ routeETA WRITE setRouteETA NOTIFY routeETAChanged)

// Навигация - пробки
Q_PROPERTY(bool hasTraffic READ hasTraffic WRITE setHasTraffic NOTIFY hasTrafficChanged)
Q_PROPERTY(int trafficDelay READ trafficDelay WRITE setTrafficDelay NOTIFY trafficDelayChanged)
```

---

## 🚗 Как это делают в других машинах

### Tesla
- Использует собственный навигатор на базе Google Maps
- Данные передаются через внутреннюю сеть автомобиля
- Карта отображается на центральном экране

### BMW iDrive
- Поддерживает Android Auto и Apple CarPlay
- Получает навигационные данные через стандартные протоколы
- Отображает инструкции на приборной панели и HUD

### Mercedes MBUX
- Интегрирован с различными навигационными приложениями
- Использует универсальный протокол для передачи данных
- Отображает карту на нескольких экранах

### Общий подход:
1. **Стандартизация протокола** - используют универсальные форматы данных
2. **Абстракция от приложения** - не зависят от конкретного навигационного приложения
3. **Минимальный набор данных** - передают только необходимую информацию
4. **Готовые библиотеки карт** - используют QtLocation, Mapbox, или собственные решения

---

## 💡 Рекомендации для вашего проекта

### Этап 1: Минимальная реализация (текущая)
✅ Уже реализовано:
- `navigationDistance` - расстояние до поворота
- `navigationAngle` - угол поворота

### Этап 2: Расширенная навигация
⬜ Добавить:
- Название следующей улицы
- Тип маневра (поворот налево/направо)
- Общее расстояние до пункта назначения
- ETA (время прибытия)

### Этап 3: Карта (опционально)
⬜ Добавить:
- Отображение карты через QtLocation
- Текущее местоположение
- Маршрут на карте
- Пункт назначения

### Этап 4: Интеграция с магнитолой
⬜ Реализовать:
- Протокол передачи данных от магнитолы
- Парсинг данных навигации
- Обновление VehicleData

---

## 🔧 Пример реализации протокола

### На стороне магнитолы (псевдокод):

```python
# Магнитола получает данные от навигационного приложения
def get_navigation_data():
    # Получаем данные от Google Maps / Яндекс.Карты и т.д.
    nav_data = navigation_app.get_current_data()
    
    # Формируем универсальный формат
    data = {
        "currentLocation": {
            "lat": nav_data.current_lat,
            "lon": nav_data.current_lon,
            "speed": nav_data.speed,
            "heading": nav_data.heading
        },
        "nextManeuver": {
            "distance": nav_data.next_turn_distance,
            "angle": nav_data.next_turn_angle,
            "streetName": nav_data.next_street_name,
            "maneuverType": nav_data.maneuver_type
        },
        "route": {
            "totalDistance": nav_data.total_distance,
            "totalTime": nav_data.total_time,
            "eta": nav_data.eta
        }
    }
    
    # Передаем на приборную панель через CAN/USB/Wi-Fi
    send_to_dashboard(data)
```

### На стороне приборной панели:

```cpp
// Получаем данные от магнитолы
void receiveNavigationData(const NavigationData& data) {
    // Обновляем VehicleData
    vehicleData->setCurrentLatitude(data.currentLatitude);
    vehicleData->setCurrentLongitude(data.currentLongitude);
    vehicleData->setNavigationDistance(data.nextManeuver.distance);
    vehicleData->setNavigationAngle(data.nextManeuver.angle);
    vehicleData->setNextStreetName(data.nextManeuver.streetName);
    vehicleData->setRouteTotalDistance(data.route.totalDistance);
    vehicleData->setRouteTotalTime(data.route.totalTime);
    // и т.д.
}
```

---

---

## 🚗 Реализация для кастомного Android лаунчера

### Архитектура решения

Для кастомного Android лаунчера с синхронизацией навигации между магнитолой и приборной панелью рекомендуется следующая архитектура:

```
┌─────────────────────────────────────────────────────────────┐
│                    Android Магнитола                         │
│  ┌──────────────────────────────────────────────────────┐   │
│  │  Кастомный Лаунчер (Launcher Activity)               │   │
│  │  - Отображает карту и навигацию                      │   │
│  │  - Позволяет задавать маршрут                         │   │
│  └──────────────────────────────────────────────────────┘   │
│                        ↓                                     │
│  ┌──────────────────────────────────────────────────────┐   │
│  │  Navigation Service (Background Service)             │   │
│  │  - Получает данные от навигационного приложения      │   │
│  │  - Синхронизирует данные между магнитолой и ПП       │   │
│  │  - Передает данные на приборную панель               │   │
│  └──────────────────────────────────────────────────────┘   │
│                        ↓                                     │
│  ┌──────────────────────────────────────────────────────┐   │
│  │  Navigation Data Provider                             │   │
│  │  - Единый источник данных для магнитолы и ПП         │   │
│  │  - SharedPreferences / Room Database                 │   │
│  └──────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
                        ↓ (USB/Serial/CAN/Wi-Fi)
┌─────────────────────────────────────────────────────────────┐
│              Цифровая Приборная Панель                      │
│  ┌──────────────────────────────────────────────────────┐   │
│  │  Navigation Receiver                                │   │
│  │  - Получает данные от магнитолы                     │   │
│  │  - Обновляет VehicleData                            │   │
│  └──────────────────────────────────────────────────────┘   │
│                        ↓                                     │
│  ┌──────────────────────────────────────────────────────┐   │
│  │  Navigation Widget                                   │   │
│  │  - Отображает навигацию на приборной панели          │   │
│  └──────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
```

### ✅ Рекомендуемый способ: Android Service + Shared Data Provider

**Преимущества:**
- ✅ Один источник данных для магнитолы и приборной панели
- ✅ Не мешают друг другу - оба читают из одного источника
- ✅ Простая реализация
- ✅ Надежная синхронизация
- ✅ Работает в фоне

---

## 📱 Реализация на Android (Магнитола)

### 1. NavigationDataProvider (Singleton)

Единый источник данных для всей системы:

```kotlin
// NavigationDataProvider.kt
class NavigationDataProvider private constructor(context: Context) {
    companion object {
        @Volatile
        private var INSTANCE: NavigationDataProvider? = null
        
        fun getInstance(context: Context): NavigationDataProvider {
            return INSTANCE ?: synchronized(this) {
                INSTANCE ?: NavigationDataProvider(context.applicationContext).also { 
                    INSTANCE = it 
                }
            }
        }
    }
    
    private val sharedPrefs = context.getSharedPreferences("navigation_data", Context.MODE_PRIVATE)
    private val listeners = mutableListOf<NavigationDataListener>()
    
    // Данные навигации
    data class NavigationData(
        var currentLatitude: Double = 0.0,
        var currentLongitude: Double = 0.0,
        var currentSpeed: Float = 0f,
        var currentHeading: Float = 0f,
        var navigationDistance: Float = 0f,
        var navigationAngle: Float = 0f,
        var nextStreetName: String = "",
        var maneuverType: Int = 0,
        var destinationLatitude: Double = 0.0,
        var destinationLongitude: Double = 0.0,
        var routeTotalDistance: Float = 0f,
        var routeTotalTime: Int = 0,
        var routeETA: Long = 0,
        var hasActiveRoute: Boolean = false
    )
    
    private var currentData = NavigationData()
    
    // Обновление данных
    fun updateNavigationData(data: NavigationData) {
        currentData = data
        
        // Сохраняем в SharedPreferences для персистентности
        saveToSharedPrefs(data)
        
        // Уведомляем всех слушателей
        listeners.forEach { it.onNavigationDataChanged(data) }
        
        // Отправляем на приборную панель
        sendToDashboard(data)
    }
    
    // Получение текущих данных
    fun getCurrentData(): NavigationData = currentData
    
    // Подписка на изменения
    fun addListener(listener: NavigationDataListener) {
        listeners.add(listener)
    }
    
    fun removeListener(listener: NavigationDataListener) {
        listeners.remove(listener)
    }
    
    interface NavigationDataListener {
        fun onNavigationDataChanged(data: NavigationData)
    }
    
    private fun saveToSharedPrefs(data: NavigationData) {
        sharedPrefs.edit().apply {
            putFloat("currentLatitude", data.currentLatitude.toFloat())
            putFloat("currentLongitude", data.currentLongitude.toFloat())
            putFloat("currentSpeed", data.currentSpeed)
            putFloat("currentHeading", data.currentHeading)
            putFloat("navigationDistance", data.navigationDistance)
            putFloat("navigationAngle", data.navigationAngle)
            putString("nextStreetName", data.nextStreetName)
            putInt("maneuverType", data.maneuverType)
            putFloat("destinationLatitude", data.destinationLatitude.toFloat())
            putFloat("destinationLongitude", data.destinationLongitude.toFloat())
            putFloat("routeTotalDistance", data.routeTotalDistance)
            putInt("routeTotalTime", data.routeTotalTime)
            putLong("routeETA", data.routeETA)
            putBoolean("hasActiveRoute", data.hasActiveRoute)
            apply()
        }
    }
    
    private fun sendToDashboard(data: NavigationData) {
        // Отправка на приборную панель через выбранный протокол
        DashboardCommunication.sendNavigationData(data)
    }
}
```

### 2. NavigationService (Background Service)

Сервис, который получает данные от навигационного приложения:

```kotlin
// NavigationService.kt
class NavigationService : Service() {
    private val dataProvider = NavigationDataProvider.getInstance(this)
    private var navigationAppListener: NavigationAppListener? = null
    
    override fun onCreate() {
        super.onCreate()
        // Инициализация слушателя навигационного приложения
        navigationAppListener = createNavigationListener()
    }
    
    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        startListeningToNavigation()
        return START_STICKY // Перезапускается при падении
    }
    
    private fun startListeningToNavigation() {
        // Вариант 1: Через Accessibility Service (для чтения с экрана)
        // Вариант 2: Через BroadcastReceiver (если приложение отправляет broadcasts)
        // Вариант 3: Через NotificationListenerService (чтение уведомлений навигации)
        // Вариант 4: Прямая интеграция с навигационным приложением (если есть API)
        
        // Пример: слушаем уведомления навигации
        listenToNavigationNotifications()
    }
    
    private fun listenToNavigationNotifications() {
        // Парсим уведомления от Google Maps / Яндекс.Карты
        // Извлекаем данные о маршруте и следующем маневре
    }
    
    private fun createNavigationListener(): NavigationAppListener {
        return object : NavigationAppListener {
            override fun onLocationUpdate(lat: Double, lon: Double, speed: Float, heading: Float) {
                val data = dataProvider.getCurrentData().copy(
                    currentLatitude = lat,
                    currentLongitude = lon,
                    currentSpeed = speed,
                    currentHeading = heading
                )
                dataProvider.updateNavigationData(data)
            }
            
            override fun onNextManeuver(distance: Float, angle: Float, streetName: String, maneuverType: Int) {
                val data = dataProvider.getCurrentData().copy(
                    navigationDistance = distance,
                    navigationAngle = angle,
                    nextStreetName = streetName,
                    maneuverType = maneuverType
                )
                dataProvider.updateNavigationData(data)
            }
            
            override fun onRouteUpdate(totalDistance: Float, totalTime: Int, eta: Long) {
                val data = dataProvider.getCurrentData().copy(
                    routeTotalDistance = totalDistance,
                    routeTotalTime = totalTime,
                    routeETA = eta,
                    hasActiveRoute = true
                )
                dataProvider.updateNavigationData(data)
            }
            
            override fun onRouteCanceled() {
                val data = dataProvider.getCurrentData().copy(
                    hasActiveRoute = false
                )
                dataProvider.updateNavigationData(data)
            }
        }
    }
    
    interface NavigationAppListener {
        fun onLocationUpdate(lat: Double, lon: Double, speed: Float, heading: Float)
        fun onNextManeuver(distance: Float, angle: Float, streetName: String, maneuverType: Int)
        fun onRouteUpdate(totalDistance: Float, totalTime: Int, eta: Long)
        fun onRouteCanceled()
    }
}
```

### 3. DashboardCommunication (Отправка на приборную панель)

Класс для отправки данных на приборную панель:

```kotlin
// DashboardCommunication.kt
object DashboardCommunication {
    // Вариант 1: USB Serial (рекомендуется)
    private var usbSerial: UsbSerialPort? = null
    
    // Вариант 2: CAN-шина
    private var canBus: CanBus? = null
    
    // Вариант 3: Wi-Fi / TCP Socket
    private var tcpSocket: Socket? = null
    
    fun sendNavigationData(data: NavigationDataProvider.NavigationData) {
        // Формируем пакет данных
        val packet = createNavigationPacket(data)
        
        // Отправляем через выбранный протокол
        when (getCommunicationMethod()) {
            CommunicationMethod.USB_SERIAL -> sendViaUsb(packet)
            CommunicationMethod.CAN_BUS -> sendViaCan(packet)
            CommunicationMethod.WIFI -> sendViaWifi(packet)
        }
    }
    
    private fun createNavigationPacket(data: NavigationDataProvider.NavigationData): ByteArray {
        // Бинарный протокол для эффективной передачи
        val buffer = ByteBuffer.allocate(128)
        buffer.putDouble(data.currentLatitude)
        buffer.putDouble(data.currentLongitude)
        buffer.putFloat(data.currentSpeed)
        buffer.putFloat(data.currentHeading)
        buffer.putFloat(data.navigationDistance)
        buffer.putFloat(data.navigationAngle)
        buffer.put(data.nextStreetName.toByteArray(Charsets.UTF_8))
        buffer.putInt(data.maneuverType)
        buffer.putDouble(data.destinationLatitude)
        buffer.putDouble(data.destinationLongitude)
        buffer.putFloat(data.routeTotalDistance)
        buffer.putInt(data.routeTotalTime)
        buffer.putLong(data.routeETA)
        buffer.put(if (data.hasActiveRoute) 1.toByte() else 0.toByte())
        return buffer.array()
    }
    
    enum class CommunicationMethod {
        USB_SERIAL,
        CAN_BUS,
        WIFI
    }
}
```

### 4. Launcher Activity (UI на магнитоле)

Активность лаунчера, которая отображает карту:

```kotlin
// MainLauncherActivity.kt
class MainLauncherActivity : AppCompatActivity() {
    private val dataProvider = NavigationDataProvider.getInstance(this)
    private lateinit var mapView: MapView
    
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_launcher)
        
        mapView = findViewById(R.id.mapView)
        
        // Подписываемся на обновления данных
        dataProvider.addListener(object : NavigationDataProvider.NavigationDataListener {
            override fun onNavigationDataChanged(data: NavigationDataProvider.NavigationData) {
                // Обновляем карту на магнитоле
                updateMap(data)
            }
        })
        
        // Запускаем сервис навигации
        startService(Intent(this, NavigationService::class.java))
    }
    
    private fun updateMap(data: NavigationDataProvider.NavigationData) {
        // Обновляем отображение карты на магнитоле
        mapView.updateLocation(data.currentLatitude, data.currentLongitude)
        mapView.updateRoute(data)
        mapView.updateNextManeuver(data.navigationDistance, data.navigationAngle, data.nextStreetName)
    }
    
    fun onRouteSet(destination: LatLng) {
        // Когда пользователь задает маршрут на магнитоле
        val data = dataProvider.getCurrentData().copy(
            destinationLatitude = destination.latitude,
            destinationLongitude = destination.longitude,
            hasActiveRoute = true
        )
        dataProvider.updateNavigationData(data)
        
        // Запускаем навигацию в выбранном приложении
        startNavigation(destination)
    }
}
```

---

## 🖥️ Реализация на приборной панели (Qt/C++)

### 1. NavigationReceiver (Получение данных)

```cpp
// NavigationReceiver.h
class NavigationReceiver : public QObject {
    Q_OBJECT
    
public:
    explicit NavigationReceiver(QObject *parent = nullptr);
    
private slots:
    void onDataReceived(const QByteArray &data);
    void parseNavigationPacket(const QByteArray &packet);
    
signals:
    void navigationDataUpdated(const NavigationData &data);
    
private:
    QSerialPort *serialPort; // или CAN, или TCP Socket
    VehicleData *vehicleData;
};

// NavigationReceiver.cpp
void NavigationReceiver::onDataReceived(const QByteArray &data) {
    parseNavigationPacket(data);
}

void NavigationReceiver::parseNavigationPacket(const QByteArray &packet) {
    QDataStream stream(packet);
    stream.setByteOrder(QDataStream::LittleEndian);
    
    NavigationData navData;
    stream >> navData.currentLatitude;
    stream >> navData.currentLongitude;
    stream >> navData.currentSpeed;
    stream >> navData.currentHeading;
    stream >> navData.navigationDistance;
    stream >> navData.navigationAngle;
    stream >> navData.nextStreetName;
    stream >> navData.maneuverType;
    stream >> navData.destinationLatitude;
    stream >> navData.destinationLongitude;
    stream >> navData.routeTotalDistance;
    stream >> navData.routeTotalTime;
    stream >> navData.routeETA;
    stream >> navData.hasActiveRoute;
    
    // Обновляем VehicleData
    if (vehicleData) {
        vehicleData->setCurrentLatitude(navData.currentLatitude);
        vehicleData->setCurrentLongitude(navData.currentLongitude);
        vehicleData->setNavigationDistance(navData.navigationDistance);
        vehicleData->setNavigationAngle(navData.navigationAngle);
        vehicleData->setNextStreetName(navData.nextStreetName);
        // и т.д.
    }
    
    emit navigationDataUpdated(navData);
}
```

### 2. NavigationWidget (Отображение на ПП)

```qml
// NavigationWidget.qml
Item {
    id: navWidget
    
    // Отображает навигацию на приборной панели
    // Использует данные из vehicleData
    
    Text {
        text: vehicleData.nextStreetName || "Нет активного маршрута"
        color: "white"
    }
    
    Text {
        text: Math.round(vehicleData.navigationDistance) + " м"
        color: "#00E0FF"
    }
    
    // Стрелка направления
    Image {
        source: "qrc:/images/nav_arrow.png"
        rotation: vehicleData.navigationAngle
    }
}
```

---

## 🔄 Схема работы

### Сценарий: Пользователь задает маршрут на магнитоле

1. **Пользователь на магнитоле:**
   - Открывает карту в лаунчере
   - Выбирает пункт назначения
   - Нажимает "Начать навигацию"

2. **Лаунчер (MainLauncherActivity):**
   - Вызывает `onRouteSet(destination)`
   - Обновляет `NavigationDataProvider`
   - Запускает навигационное приложение (Google Maps / Яндекс.Карты)

3. **NavigationService:**
   - Слушает данные от навигационного приложения
   - Парсит информацию о маршруте и следующем маневре
   - Обновляет `NavigationDataProvider`

4. **NavigationDataProvider:**
   - Сохраняет данные в SharedPreferences
   - Уведомляет всех слушателей (лаунчер + отправка на ПП)
   - Отправляет данные на приборную панель через `DashboardCommunication`

5. **Приборная панель:**
   - Получает данные через `NavigationReceiver`
   - Обновляет `VehicleData`
   - Виджет навигации автоматически обновляется через QML bindings

6. **Результат:**
   - ✅ Навигация отображается на магнитоле
   - ✅ Навигация отображается на приборной панели
   - ✅ Оба используют один источник данных
   - ✅ Не мешают друг другу

---

## 🎯 Выбор протокола передачи данных

### Рекомендация: **USB Serial** (для начала)

**Преимущества:**
- ✅ Простая реализация
- ✅ Надежная связь
- ✅ Низкая задержка
- ✅ Не требует настройки сети

**Недостатки:**
- ❌ Требует физического подключения

### Альтернативы:

1. **CAN-шина** (если есть доступ)
   - ✅ Стандарт автомобильной индустрии
   - ✅ Надежность
   - ❌ Сложнее в реализации

2. **Wi-Fi / TCP Socket**
   - ✅ Гибкость
   - ✅ Легко отлаживать
   - ❌ Требует настройки сети
   - ❌ Возможны задержки

3. **Bluetooth**
   - ✅ Беспроводная связь
   - ❌ Ограниченная скорость
   - ❌ Возможны задержки

---

## 📝 Итог

1. **НЕ создавайте свой навигатор** - используйте данные от существующих приложений
2. **Передавайте только данные**, а не карту
3. **Используйте универсальный протокол** для совместимости с разными приложениями
4. **Для отображения карты** используйте готовые библиотеки (QtLocation, Mapbox)
5. **Минимальный набор данных** для начала: расстояние, угол, название улицы

**Для кастомного Android лаунчера:**
- ✅ Используйте `NavigationDataProvider` как единый источник данных
- ✅ `NavigationService` получает данные от навигационного приложения
- ✅ Лаунчер и приборная панель читают из одного источника
- ✅ Они не мешают друг другу - просто отображают одни и те же данные
- ✅ Передача данных через USB Serial (или CAN/Wi-Fi)

Ваш текущий подход с `navigationDistance` и `navigationAngle` - правильный! Просто расширьте его дополнительными данными по мере необходимости.

