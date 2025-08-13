import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    property string text: ""
    property bool active: false

    signal toggled()

    width: 160
    height: 40
    radius: 8
    color: active ? "#F44336" : "#404040"
    border.color: active ? "#FF6B6B" : "#606060"
    border.width: 1

    Behavior on color { ColorAnimation { duration: 200 } }

    Row {
        anchors.centerIn: parent
        spacing: 8

        Rectangle {
            width: 8
            height: 8
            radius: 4
            color: active ? "#FFFFFF" : "#808080"
            anchors.verticalCenter: parent.verticalCenter

            SequentialAnimation on opacity {
                running: active
                loops: Animation.Infinite
                NumberAnimation { to: 0.3; duration: 500 }
                NumberAnimation { to: 1.0; duration: 500 }
            }
        }

        Text {
            text: parent.parent.text
            color: active ? "#FFFFFF" : "#B0B0B0"
            font.pixelSize: 11
            font.weight: Font.Medium
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: parent.toggled()
    }
}
