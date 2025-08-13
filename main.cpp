#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "VehicleData.h"
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    VehicleData vehicleData;
    engine.rootContext()->setContextProperty("vehicleData", &vehicleData);
    // Загружаем главный QML-файл
    const QUrl url(u"qrc:/main.qml"_qs);
    engine.load(url);

    return app.exec();
}
