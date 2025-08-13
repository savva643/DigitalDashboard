import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    property string title: ""
   // property alias content: contentLoader.sourceComponent
    default property alias children: contentColumn.children

    color: "#2D2D2D"
    radius: 12
    height: contentColumn.height + 32



    ColumnLayout {
        id: contentColumn
        anchors.fill: parent
        anchors.margins: 16
        spacing: 12

        Text {
            text: title
            font.pixelSize: 16
            font.weight: Font.Bold
            color: "#00BCD4"
            Layout.fillWidth: true
        }

        Rectangle {
            Layout.fillWidth: true
            height: 1
            color: "#404040"
        }
    }
}
