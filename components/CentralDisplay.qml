import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: centralDisplay
    color: "#1A1D21"
    radius: 12
    border.color: "#2D3138"
    border.width: 2
    property int currentIndex: 0

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        // Content area
        SwipeView {
            id: swipeView
            Layout.fillWidth: true
            Layout.fillHeight: true
            interactive: true
            clip: true
            currentIndex: centralDisplay.currentIndex

            GearWidget { }
            MusicPlayerWidget { }
            CarDoorsWidget { }
            CallStatusWidget { }

            onCurrentIndexChanged: {
                centralDisplay.currentIndex = currentIndex
                console.log("Current swipe index", currentIndex)
            }
        }

        // Navigation dots
        Row {
            Layout.alignment: Qt.AlignHCenter
            spacing: 8

            Repeater {
                model: 4

                Rectangle {
                    width: 8
                    height: 8
                    radius: 4
                    color: swipeView.currentIndex === index ? "#00E0FF" : "#555555"

                    Behavior on color {
                        ColorAnimation { duration: 150 }
                    }
                }
            }
        }
    }

    // Glass effect overlay
    Rectangle {
        anchors.fill: parent
        radius: parent.radius
        color: "transparent"
        border.color: "#FFFFFF"
        border.width: 1
        opacity: 0.05
    }
}
