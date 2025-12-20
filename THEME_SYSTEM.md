# Система тем и конструктор приборной панели

## Описание

Система позволяет создавать и настраивать темы для цифровой приборной панели. Каждая тема определяет расположение, стиль и QML файлы для всех виджетов.

---

## Структура темы (JSON)

### Основная структура:

```json
{
  "name": "Название темы",
  "version": "1.0",
  "description": "Описание темы",
  
  "layout": {
    "refWidth": 1300,
    "refHeight": 700,
    "refGaugeSize": 400,
    "refCenterWidth": 400,
    "refCenterHeight": 440,
    "minScale": 0.5
  },
  
  "statusBar": {
    "enabled": true,
    "position": "top",
    "qmlPath": "components/StatusBar.qml"
  },
  
  "centerDisplay": {
    "enabled": true,
    "qmlPath": "components/CentralDisplay.qml",
    "width": 400,
    "height": 440
  },
  
  "sideGauges": {
    "left": {
      "enabled": true,
      "qmlPath": "components/CircularGauge.qml",
      "type": "rpm",
      "width": 400,
      "height": 400,
      "properties": {
        "minValue": 0,
        "maxValue": 8,
        "unit": "x1000",
        "label": "RPM",
        "accentColor": "#00E0FF",
        "dangerThreshold": 0.75
      },
      "requiredProperties": ["value"],
      "dataBinding": "vehicleData.rpm"
    },
    "right": {
      "enabled": true,
      "qmlPath": "components/CircularGauge.qml",
      "type": "speed",
      "width": 400,
      "height": 400,
      "properties": {
        "minValue": 0,
        "maxValue": 220,
        "unit": "km/h",
        "label": "SPEED",
        "accentColor": "#00E0FF",
        "dangerThreshold": 0.9
      },
      "requiredProperties": ["value"],
      "dataBinding": "vehicleData.speed"
    }
  },
  
  "warningIcons": {
    "enabled": true,
    "position": "bottom",
    "qmlPath": "components/WarningIcons.qml"
  },
  
  "turnSignals": {
    "enabled": true,
    "left": {
      "qmlPath": "components/TurnSignal.qml",
      "dataBinding": "vehicleData.leftSignalActive"
    },
    "right": {
      "qmlPath": "components/TurnSignal.qml",
      "dataBinding": "vehicleData.rightSignalActive"
    }
  }
}
```

---

## Использование конструктора

### Открытие конструктора:

1. Нажмите кнопку меню (☰) в правом верхнем углу приборной панели
2. Откроется окно конструктора

### Возможности конструктора:

#### Левая панель - Элементы:
- **Status Bar** - Верхняя/нижняя строка статуса
- **Center Display** - Центральный дисплей
- **Left Gauge (RPM)** - Левый датчик оборотов
- **Right Gauge (Speed)** - Правый датчик скорости
- **Warning Icons** - Иконки предупреждений

Для каждого элемента можно:
- Включить/выключить (Switch)
- Настроить параметры (клик по элементу)

#### Центральная панель - Настройки элемента:

При клике на элемент открываются его настройки:

**Status Bar:**
- Позиция (top/bottom)
- Замена QML файла

**Center Display:**
- Ширина и высота
- Замена QML файла

**Side Gauges (RPM/Speed):**
- Ширина и высота
- Цвет акцента (accentColor)
- Замена QML файла

**Warning Icons:**
- Позиция (top/bottom/left/right)
- Замена QML файла

#### Правая панель - Темы:

- Список доступных тем
- Клик по теме - загрузка темы
- Кнопка "Создать новую тему"

---

## Замена QML файлов виджетов

### Процесс замены:

1. Нажмите "Изменить QML файл" для нужного элемента
2. Выберите новый QML файл
3. Система проверит наличие обязательных свойств
4. Если валидация прошла - виджет обновится

### Обязательные свойства для виджетов:

#### Speed/RPM Gauge:
- `value` - значение датчика
- `vehicleData` - доступ к данным автомобиля

#### Center Display:
- `vehicleData` - доступ к данным автомобиля

#### Status Bar:
- `vehicleData` - доступ к данным автомобиля

#### Warning Icons:
- `vehicleData` - доступ к данным автомобиля

#### Turn Signal:
- `active` - активен ли поворотник
- `direction` - направление (left/right)

---

## Создание собственной темы

### Шаг 1: Создание JSON файла

Создайте файл в папке `themes/` с расширением `.json`

### Шаг 2: Определение структуры

Скопируйте структуру из `default.json` и измените нужные параметры

### Шаг 3: Настройка виджетов

Для каждого виджета укажите:
- `enabled` - включен ли виджет
- `qmlPath` - путь к QML файлу
- `properties` - свойства виджета
- `dataBinding` - привязка к данным

### Шаг 4: Сохранение

Сохраните файл в папке `themes/`

---

## Примеры тем

### 1. Default Theme (default.json)
- Стандартная конфигурация
- Два датчика (RPM и Speed)
- Центральный дисплей
- Статус бар сверху
- Иконки предупреждений снизу

### 2. Sport Theme (sport.json)
- Красные акценты
- Увеличенные датчики
- Уменьшенный центральный дисплей
- Максимальная скорость 280 км/ч

### 3. Minimal Theme (minimal.json)
- Только один датчик скорости справа
- Минималистичный дизайн
- Упрощенная конфигурация

---

## Создание кастомных QML виджетов

### Шаблон для Speed/RPM Gauge:

```qml
import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: customGauge
    
    // Обязательные свойства
    property real value: 0
    property real minValue: 0
    property real maxValue: 100
    property string unit: ""
    property string label: ""
    property color accentColor: "#00E0FF"
    property real dangerThreshold: 0.8
    
    // Доступ к данным
    property var vehicleData: vehicleData
    
    // Ваш кастомный код виджета
    Rectangle {
        anchors.fill: parent
        // ...
    }
}
```

### Шаблон для Center Display:

```qml
import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: customCenterDisplay
    
    // Обязательные свойства
    property var vehicleData: vehicleData
    
    // Ваш кастомный код виджета
    Rectangle {
        anchors.fill: parent
        // ...
    }
}
```

---

## Валидация виджетов

Система автоматически проверяет наличие обязательных свойств при замене QML файла:

- ✅ Файл существует
- ✅ Содержит обязательные свойства
- ✅ Правильный синтаксис QML

Если валидация не прошла - виджет не будет загружен, в консоли появится предупреждение.

---

## Сохранение и загрузка тем

### Сохранение:
- Нажмите "Сохранить" в конструкторе
- Тема сохранится в текущий файл

### Загрузка:
- Выберите тему из списка справа
- Тема загрузится автоматически
- Приборная панель обновится

---

## Технические детали

### ThemeManager (C++)
- Класс для управления темами
- Загрузка/сохранение JSON файлов
- Валидация виджетов
- Регистрируется в QML как `themeManager`

### Dashboard.qml
- Динамически загружает виджеты из темы
- Использует Loader для каждого виджета
- Применяет свойства из конфигурации
- Автоматически обновляется при изменении темы

### DashboardConstructor.qml
- Окно конструктора
- Редактирование конфигурации темы
- Замена QML файлов
- Сохранение изменений

---

## Рекомендации

1. **Всегда создавайте резервные копии** тем перед редактированием
2. **Тестируйте виджеты** перед заменой в теме
3. **Используйте валидацию** для проверки обязательных свойств
4. **Храните кастомные QML файлы** в отдельной папке
5. **Документируйте изменения** в описании темы

---

## Структура папок

```
DigitalDashboard/
├── themes/
│   ├── default.json
│   ├── sport.json
│   └── minimal.json
├── components/
│   ├── DashboardConstructor.qml
│   ├── MenuButton.qml
│   └── ... (другие виджеты)
└── custom-widgets/  (рекомендуется создать)
    └── ... (ваши кастомные виджеты)
```

