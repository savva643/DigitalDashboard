import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: menuButton
    width: 50
    height: 50
    radius: 25
    color: mouseArea.pressed ? "#333333" : "#2D2D2D"
    border.color: "#00E0FF"
    border.width: 2
    
    signal clicked()
    
    Text {
        anchors.centerIn: parent
        text: "☰"
        font.pixelSize: 24
        color: "#00E0FF"
    }
    
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: menuButton.clicked()
    }
}

