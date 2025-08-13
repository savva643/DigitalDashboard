import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    id: callWidget

    property var callData: null

    Rectangle {
        anchors.fill: parent
        color: "#1A1D21"
        radius: 12

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 20
            spacing: 15

            // Заголовок
            Text {
                text: "CALL STATUS"
                font {
                    pixelSize: 18
                    family: "Roboto"
                    weight: Font.Bold
                }
                color: "#00E0FF"
                Layout.alignment: Qt.AlignHCenter
            }

            // Основная информация о звонке
            ColumnLayout {
                Layout.fillWidth: true
                spacing: 10

                // Имя контакта/номера
                Text {
                    text: callData ? callData.contactName : "No active call"
                    font {
                        pixelSize: 22
                        family: "Roboto"
                        weight: Font.Bold
                    }
                    color: "white"
                    Layout.alignment: Qt.AlignHCenter
                    elide: Text.ElideRight
                    maximumLineCount: 1
                    Layout.maximumWidth: parent.width
                }

                // Статус звонка
                Text {
                    text: {
                        if (!callData) return ""
                        switch(callData.status) {
                            case "incoming": return "Incoming call"
                            case "outgoing": return "Calling..."
                            case "active": return "Call in progress"
                            case "ended": return "Call ended"
                            case "missed": return "Missed call"
                            case "rejected": return "Call rejected"
                            default: return callData.status
                        }
                    }
                    font.pixelSize: 16
                    color: {
                        if (!callData) return "gray"
                        switch(callData.status) {
                            case "incoming": return "#00E0FF"
                            case "outgoing": return "#00E0FF"
                            case "active": return "#4CAF50"
                            case "ended": return "gray"
                            case "missed": return "#FF5555"
                            case "rejected": return "#FF9800"
                            default: return "white"
                        }
                    }
                    Layout.alignment: Qt.AlignHCenter
                }

                // Длительность звонка
                Text {
                    visible: callData && (callData.status === "active" || callData.status === "ended")
                    text: {
                        if (!callData) return ""
                        var secs = callData.duration % 60
                        var mins = Math.floor(callData.duration / 60)
                        return mins + ":" + (secs < 10 ? "0" + secs : secs)
                    }
                    font.pixelSize: 14
                    color: "#AAAAAA"
                    Layout.alignment: Qt.AlignHCenter
                }
            }

            // Анимация звонка
            Item {
                Layout.fillWidth: true
                Layout.preferredHeight: 60
                visible: callData && (callData.status === "incoming" || callData.status === "outgoing")

                Row {
                    anchors.centerIn: parent
                    spacing: 15

                    Repeater {
                        model: 3

                        Rectangle {
                            width: 15
                            height: 15
                            radius: width/2
                            color: "#00E0FF"

                            SequentialAnimation on opacity {
                                running: callWidget.visible
                                loops: Animation.Infinite
                                NumberAnimation { from: 0.3; to: 1.0; duration: 1000; easing.type: Easing.InOutQuad }
                                PauseAnimation { duration: index * 200 }
                            }

                            SequentialAnimation on scale {
                                running: callWidget.visible
                                loops: Animation.Infinite
                                NumberAnimation { from: 0.8; to: 1.2; duration: 1000; easing.type: Easing.InOutQuad }
                                PauseAnimation { duration: index * 200 }
                            }
                        }
                    }
                }
            }

            // Иконка статуса
            Item {
                Layout.fillWidth: true
                Layout.preferredHeight: 80
                Layout.alignment: Qt.AlignHCenter

                Image {
                    id: statusIcon
                    anchors.centerIn: parent
                    width: 60
                    height: 60
                    source: {
                        if (!callData) return ""
                        switch(callData.status) {
                            case "incoming": return "qrc:/images/call_incoming.png"
                            case "outgoing": return "qrc:/images/call_outgoing.png"
                            case "active": return "qrc:/images/call_active.png"
                            case "ended": return "qrc:/images/call_ended.png"
                            case "missed": return "qrc:/images/call_missed.png"
                            case "rejected": return "qrc:/images/call_rejected.png"
                            default: return ""
                        }
                    }
                    fillMode: Image.PreserveAspectFit

                    RotationAnimation on rotation {
                        running: callData && callData.status === "active"
                        from: 0
                        to: 360
                        duration: 8000
                        loops: Animation.Infinite
                    }
                }
            }
        }
    }
}
