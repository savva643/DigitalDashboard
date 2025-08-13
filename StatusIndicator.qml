import QtQuick 2.15

Row {
    property string text: ""
    property bool status: false

    spacing: 8

    Rectangle {
        width: 12
        height: 12
        radius: 6
        color: status ? "#4CAF50" : "#F44336"
        anchors.verticalCenter: parent.verticalCenter

        SequentialAnimation on opacity {
            running: status
            loops: Animation.Infinite
            NumberAnimation { to: 0.5; duration: 1000 }
            NumberAnimation { to: 1.0; duration: 1000 }
        }
    }

    Text {
        text: parent.text
        font.pixelSize: 12
        color: status ? "#4CAF50" : "#F44336"
        anchors.verticalCenter: parent.verticalCenter
    }
}
