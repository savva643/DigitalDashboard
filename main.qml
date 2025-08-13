import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

ApplicationWindow {
    id: mainWindow
    width: 1024
    height: 600
    visible: true
    title: qsTr("Digital Dashboard")
    Material.theme: Material.Dark
    Material.accent: Material.Green

    Dashboard {
        anchors.fill: parent
    }

    Component.onCompleted: {
        var component = Qt.createComponent("DebugWindow.qml");
        if (component.status === Component.Ready) {
            var debugWin = component.createObject(mainWindow, {
                vehicleData: vehicleData  // Передаём VehicleData в DebugWindow
            });
            debugWin.show();
        } else {
            console.error("Failed to load DebugWindow:", component.errorString());
        }
    }
}
