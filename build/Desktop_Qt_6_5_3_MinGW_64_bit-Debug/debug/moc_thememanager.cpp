/****************************************************************************
** Meta object code from reading C++ file 'thememanager.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.5.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../thememanager.h"
#include <QtCore/qmetatype.h>

#if __has_include(<QtCore/qtmochelpers.h>)
#include <QtCore/qtmochelpers.h>
#else
QT_BEGIN_MOC_NAMESPACE
#endif


#include <memory>

#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'thememanager.h' doesn't include <QObject>."
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
struct qt_meta_stringdata_CLASSThemeManagerENDCLASS_t {};
static constexpr auto qt_meta_stringdata_CLASSThemeManagerENDCLASS = QtMocHelpers::stringData(
    "ThemeManager",
    "currentThemeChanged",
    "",
    "loadTheme",
    "themePath",
    "saveTheme",
    "theme",
    "getAvailableThemes",
    "validateWidget",
    "widgetType",
    "qmlPath",
    "getRequiredProperties",
    "currentThemePath",
    "currentTheme"
);
#else  // !QT_MOC_HAS_STRING_DATA
struct qt_meta_stringdata_CLASSThemeManagerENDCLASS_t {
    uint offsetsAndSizes[28];
    char stringdata0[13];
    char stringdata1[20];
    char stringdata2[1];
    char stringdata3[10];
    char stringdata4[10];
    char stringdata5[10];
    char stringdata6[6];
    char stringdata7[19];
    char stringdata8[15];
    char stringdata9[11];
    char stringdata10[8];
    char stringdata11[22];
    char stringdata12[17];
    char stringdata13[13];
};
#define QT_MOC_LITERAL(ofs, len) \
    uint(sizeof(qt_meta_stringdata_CLASSThemeManagerENDCLASS_t::offsetsAndSizes) + ofs), len 
Q_CONSTINIT static const qt_meta_stringdata_CLASSThemeManagerENDCLASS_t qt_meta_stringdata_CLASSThemeManagerENDCLASS = {
    {
        QT_MOC_LITERAL(0, 12),  // "ThemeManager"
        QT_MOC_LITERAL(13, 19),  // "currentThemeChanged"
        QT_MOC_LITERAL(33, 0),  // ""
        QT_MOC_LITERAL(34, 9),  // "loadTheme"
        QT_MOC_LITERAL(44, 9),  // "themePath"
        QT_MOC_LITERAL(54, 9),  // "saveTheme"
        QT_MOC_LITERAL(64, 5),  // "theme"
        QT_MOC_LITERAL(70, 18),  // "getAvailableThemes"
        QT_MOC_LITERAL(89, 14),  // "validateWidget"
        QT_MOC_LITERAL(104, 10),  // "widgetType"
        QT_MOC_LITERAL(115, 7),  // "qmlPath"
        QT_MOC_LITERAL(123, 21),  // "getRequiredProperties"
        QT_MOC_LITERAL(145, 16),  // "currentThemePath"
        QT_MOC_LITERAL(162, 12)   // "currentTheme"
    },
    "ThemeManager",
    "currentThemeChanged",
    "",
    "loadTheme",
    "themePath",
    "saveTheme",
    "theme",
    "getAvailableThemes",
    "validateWidget",
    "widgetType",
    "qmlPath",
    "getRequiredProperties",
    "currentThemePath",
    "currentTheme"
};
#undef QT_MOC_LITERAL
#endif // !QT_MOC_HAS_STRING_DATA
} // unnamed namespace

Q_CONSTINIT static const uint qt_meta_data_CLASSThemeManagerENDCLASS[] = {

 // content:
      11,       // revision
       0,       // classname
       0,    0, // classinfo
       6,   14, // methods
       2,   68, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: name, argc, parameters, tag, flags, initial metatype offsets
       1,    0,   50,    2, 0x06,    3 /* Public */,

 // methods: name, argc, parameters, tag, flags, initial metatype offsets
       3,    1,   51,    2, 0x02,    4 /* Public */,
       5,    2,   54,    2, 0x02,    6 /* Public */,
       7,    0,   59,    2, 0x02,    9 /* Public */,
       8,    2,   60,    2, 0x02,   10 /* Public */,
      11,    1,   65,    2, 0x02,   13 /* Public */,

 // signals: parameters
    QMetaType::Void,

 // methods: parameters
    QMetaType::Bool, QMetaType::QString,    4,
    QMetaType::Bool, QMetaType::QString, QMetaType::QJsonObject,    4,    6,
    QMetaType::QStringList,
    QMetaType::Bool, QMetaType::QString, QMetaType::QString,    9,   10,
    QMetaType::QStringList, QMetaType::QString,    9,

 // properties: name, type, flags
      12, QMetaType::QString, 0x00015103, uint(0), 0,
      13, QMetaType::QJsonObject, 0x00015001, uint(0), 0,

       0        // eod
};

Q_CONSTINIT const QMetaObject ThemeManager::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_CLASSThemeManagerENDCLASS.offsetsAndSizes,
    qt_meta_data_CLASSThemeManagerENDCLASS,
    qt_static_metacall,
    nullptr,
    qt_incomplete_metaTypeArray<qt_meta_stringdata_CLASSThemeManagerENDCLASS_t,
        // property 'currentThemePath'
        QtPrivate::TypeAndForceComplete<QString, std::true_type>,
        // property 'currentTheme'
        QtPrivate::TypeAndForceComplete<QJsonObject, std::true_type>,
        // Q_OBJECT / Q_GADGET
        QtPrivate::TypeAndForceComplete<ThemeManager, std::true_type>,
        // method 'currentThemeChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'loadTheme'
        QtPrivate::TypeAndForceComplete<bool, std::false_type>,
        QtPrivate::TypeAndForceComplete<const QString &, std::false_type>,
        // method 'saveTheme'
        QtPrivate::TypeAndForceComplete<bool, std::false_type>,
        QtPrivate::TypeAndForceComplete<const QString &, std::false_type>,
        QtPrivate::TypeAndForceComplete<const QJsonObject &, std::false_type>,
        // method 'getAvailableThemes'
        QtPrivate::TypeAndForceComplete<QStringList, std::false_type>,
        // method 'validateWidget'
        QtPrivate::TypeAndForceComplete<bool, std::false_type>,
        QtPrivate::TypeAndForceComplete<const QString &, std::false_type>,
        QtPrivate::TypeAndForceComplete<const QString &, std::false_type>,
        // method 'getRequiredProperties'
        QtPrivate::TypeAndForceComplete<QStringList, std::false_type>,
        QtPrivate::TypeAndForceComplete<const QString &, std::false_type>
    >,
    nullptr
} };

void ThemeManager::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<ThemeManager *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->currentThemeChanged(); break;
        case 1: { bool _r = _t->loadTheme((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 2: { bool _r = _t->saveTheme((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<QJsonObject>>(_a[2])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 3: { QStringList _r = _t->getAvailableThemes();
            if (_a[0]) *reinterpret_cast< QStringList*>(_a[0]) = std::move(_r); }  break;
        case 4: { bool _r = _t->validateWidget((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<QString>>(_a[2])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 5: { QStringList _r = _t->getRequiredProperties((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1])));
            if (_a[0]) *reinterpret_cast< QStringList*>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (ThemeManager::*)();
            if (_t _q_method = &ThemeManager::currentThemeChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 0;
                return;
            }
        }
    }else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<ThemeManager *>(_o);
        (void)_t;
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = _t->currentThemePath(); break;
        case 1: *reinterpret_cast< QJsonObject*>(_v) = _t->currentTheme(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<ThemeManager *>(_o);
        (void)_t;
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setCurrentThemePath(*reinterpret_cast< QString*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    } else if (_c == QMetaObject::BindableProperty) {
    }
}

const QMetaObject *ThemeManager::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *ThemeManager::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_CLASSThemeManagerENDCLASS.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int ThemeManager::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 6)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 6)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 6;
    }else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::BindableProperty
            || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    }
    return _id;
}

// SIGNAL 0
void ThemeManager::currentThemeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}
QT_WARNING_POP
