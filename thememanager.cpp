#include "thememanager.h"
#include <QStandardPaths>
#include <QDebug>

ThemeManager::ThemeManager(QObject *parent)
    : QObject(parent)
{
    // Определяем директорию с темами (относительно исполняемого файла)
    m_themesDirectory = QDir::currentPath() + "/themes";
    
    // Создаем директорию если её нет
    QDir dir;
    if (!dir.exists(m_themesDirectory)) {
        dir.mkpath(m_themesDirectory);
    }
}

void ThemeManager::setCurrentThemePath(const QString &path) {
    if (m_currentThemePath != path) {
        m_currentThemePath = path;
        loadTheme(path);
        emit currentThemeChanged();
    }
}

bool ThemeManager::loadTheme(const QString &themePath) {
    QString fullPath = themePath;
    
    // Если путь относительный, добавляем директорию тем
    if (!QFileInfo(fullPath).isAbsolute()) {
        fullPath = m_themesDirectory + "/" + themePath;
    }
    
    QJsonObject theme = loadJsonFile(fullPath);
    
    if (!theme.isEmpty()) {
        m_currentTheme = theme;
        m_currentThemePath = themePath;
        emit currentThemeChanged();
        return true;
    }
    
    return false;
}

bool ThemeManager::saveTheme(const QString &themePath, const QJsonObject &theme) {
    QString fullPath = themePath;
    
    // Если путь относительный, добавляем директорию тем
    if (!QFileInfo(fullPath).isAbsolute()) {
        fullPath = m_themesDirectory + "/" + themePath;
    }
    
    return saveJsonFile(fullPath, theme);
}

QStringList ThemeManager::getAvailableThemes() {
    QStringList themes;
    QDir themesDir(m_themesDirectory);
    
    if (themesDir.exists()) {
        QStringList filters;
        filters << "*.json";
        QFileInfoList files = themesDir.entryInfoList(filters, QDir::Files);
        
        for (const QFileInfo &fileInfo : files) {
            themes << fileInfo.fileName();
        }
    }
    
    return themes;
}

bool ThemeManager::validateWidget(const QString &widgetType, const QString &qmlPath) {
    // Проверяем существование файла
    QFile file(qmlPath);
    if (!file.exists()) {
        qWarning() << "Widget file does not exist:" << qmlPath;
        return false;
    }
    
    // Читаем файл и проверяем наличие обязательных свойств
    if (file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        QString content = file.readAll();
        QStringList requiredProps = getRequiredProperties(widgetType);
        
        for (const QString &prop : requiredProps) {
            if (!content.contains(prop)) {
                qWarning() << "Widget" << qmlPath << "missing required property:" << prop;
                return false;
            }
        }
        
        return true;
    }
    
    return false;
}

QStringList ThemeManager::getRequiredProperties(const QString &widgetType) {
    return getRequiredPropertiesForWidget(widgetType);
}

QJsonObject ThemeManager::loadJsonFile(const QString &filePath) {
    QFile file(filePath);
    
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qWarning() << "Failed to open theme file:" << filePath;
        return QJsonObject();
    }
    
    QByteArray data = file.readAll();
    file.close();
    
    QJsonParseError error;
    QJsonDocument doc = QJsonDocument::fromJson(data, &error);
    
    if (error.error != QJsonParseError::NoError) {
        qWarning() << "JSON parse error:" << error.errorString();
        return QJsonObject();
    }
    
    return doc.object();
}

bool ThemeManager::saveJsonFile(const QString &filePath, const QJsonObject &json) {
    QFile file(filePath);
    
    if (!file.open(QIODevice::WriteOnly | QIODevice::Text)) {
        qWarning() << "Failed to open file for writing:" << filePath;
        return false;
    }
    
    QJsonDocument doc(json);
    file.write(doc.toJson(QJsonDocument::Indented));
    file.close();
    
    return true;
}

QStringList ThemeManager::getRequiredPropertiesForWidget(const QString &widgetType) {
    // Определяем обязательные свойства для каждого типа виджета
    if (widgetType == "speed" || widgetType == "rpm") {
        return QStringList() << "value" << "vehicleData";
    } else if (widgetType == "centerDisplay") {
        return QStringList() << "vehicleData";
    } else if (widgetType == "statusBar") {
        return QStringList() << "vehicleData";
    } else if (widgetType == "warningIcons") {
        return QStringList() << "vehicleData";
    } else if (widgetType == "turnSignal") {
        return QStringList() << "active" << "direction";
    }
    
    return QStringList();
}

