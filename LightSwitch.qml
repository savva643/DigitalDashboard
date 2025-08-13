import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    property string text: ""
    property bool active: false
    property bool blinking: false

    //signal toggled()

    width: 160
    height: 40
    radius: 8
    color: active ? "#4CAF50" : "#404040"
    border.color: active ? "#66BB6A" : "#606060"
    border.width: 1

    Behavior on color { ColorAnimation { duration: 200 } }

    Row {
        anchors.centerIn: parent
        spacing: 8

        Text {
            text: "💡"
            font.pixelSize: 16
            anchors.verticalCenter: parent.verticalCenter
            opacity: active ? 1.0 : 0.3

            SequentialAnimation on opacity {
                running: blinking && active
                loops: Animation.Infinite
                NumberAnimation { to: 0.3; duration: 300 }
                NumberAnimation { to: 1.0; duration: 300 }
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
