#ifndef THEMEMANAGER_H
#define THEMEMANAGER_H

#include <QObject>
#include <QString>
#include <QJsonObject>
#include <QJsonDocument>
#include <QFile>
#include <QDir>

class ThemeManager : public QObject {
    Q_OBJECT
    
    Q_PROPERTY(QString currentThemePath READ currentThemePath WRITE setCurrentThemePath NOTIFY currentThemeChanged)
    Q_PROPERTY(QJsonObject currentTheme READ currentTheme NOTIFY currentThemeChanged)
    
public:
    explicit ThemeManager(QObject *parent = nullptr);
    
    QString currentThemePath() const { return m_currentThemePath; }
    void setCurrentThemePath(const QString &path);
    
    QJsonObject currentTheme() const { return m_currentTheme; }
    
    // Загрузка темы из JSON файла
    Q_INVOKABLE bool loadTheme(const QString &themePath);
    
    // Сохранение темы в JSON файл
    Q_INVOKABLE bool saveTheme(const QString &themePath, const QJsonObject &theme);
    
    // Получение списка доступных тем
    Q_INVOKABLE QStringList getAvailableThemes();
    
    // Валидация виджета
    Q_INVOKABLE bool validateWidget(const QString &widgetType, const QString &qmlPath);
    
    // Получение обязательных свойств для виджета
    Q_INVOKABLE QStringList getRequiredProperties(const QString &widgetType);
    
signals:
    void currentThemeChanged();
    
private:
    QString m_currentThemePath;
    QJsonObject m_currentTheme;
    QString m_themesDirectory;
    
    QJsonObject loadJsonFile(const QString &filePath);
    bool saveJsonFile(const QString &filePath, const QJsonObject &json);
    QStringList getRequiredPropertiesForWidget(const QString &widgetType);
};

#endif // THEMEMANAGER_H

