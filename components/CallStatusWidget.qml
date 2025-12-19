import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    id: callWidget

    // Функция форматирования времени
    function formatTime(seconds) {
        if (seconds < 0) seconds = 0
        var hours = Math.floor(seconds / 3600)
        var mins = Math.floor((seconds % 3600) / 60)
        var secs = seconds % 60
        
        if (hours > 0) {
            return hours + ":" + (mins < 10 ? "0" + mins : mins) + ":" + (secs < 10 ? "0" + secs : secs)
        } else {
            return mins + ":" + (secs < 10 ? "0" + secs : secs)
        }
    }

    // Получаем статус звонка
    property int callStatus: vehicleData ? vehicleData.callStatus : 0 // 0: NoCall
    property bool hasActiveCall: callStatus === 1 || callStatus === 2 || callStatus === 3 // Incoming, Outgoing, Active
    property bool isIncoming: callStatus === 1
    property bool isOutgoing: callStatus === 2
    property bool isActive: callStatus === 3

    // Timer для отсчета длительности активного звонка
    Timer {
        id: callDurationTimer
        interval: 1000
        running: isActive && vehicleData
        repeat: true
        onTriggered: {
            if (vehicleData) {
                vehicleData.callDuration = vehicleData.callDuration + 1
            }
        }
    }

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

                // Иконка статуса (крупная)
                Item {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 100
                    Layout.alignment: Qt.AlignHCenter

                    Rectangle {
                        anchors.centerIn: parent
                        width: 80
                        height: 80
                        radius: 40
                        color: {
                            if (isIncoming) return "#00E0FF"
                            if (isOutgoing) return "#00E0FF"
                            if (isActive) return "#4CAF50"
                            return "#666666"
                        }
                        border.color: "white"
                        border.width: 3
                        opacity: hasActiveCall ? 1.0 : 0.3

                        Text {
                            anchors.centerIn: parent
                            text: {
                                if (isIncoming) return "📞"
                                if (isOutgoing) return "📲"
                                if (isActive) return "📱"
                                return "📵"
                            }
                            font.pixelSize: 40
                        }

                        // Анимация для входящего/исходящего звонка
                        SequentialAnimation on scale {
                            running: (isIncoming || isOutgoing) && hasActiveCall
                            loops: Animation.Infinite
                            NumberAnimation { to: 1.2; duration: 500; easing.type: Easing.InOutQuad }
                            NumberAnimation { to: 1.0; duration: 500; easing.type: Easing.InOutQuad }
                        }

                        SequentialAnimation on opacity {
                            running: (isIncoming || isOutgoing) && hasActiveCall
                            loops: Animation.Infinite
                            NumberAnimation { to: 0.6; duration: 500; easing.type: Easing.InOutQuad }
                            NumberAnimation { to: 1.0; duration: 500; easing.type: Easing.InOutQuad }
                        }
                    }
                }

                // Имя контакта/номера
                Text {
                    text: {
                        if (!vehicleData) return "No active call"
                        if (vehicleData.callerName && vehicleData.callerName.length > 0) {
                            return vehicleData.callerName
                        }
                        if (vehicleData.callerNumber && vehicleData.callerNumber.length > 0) {
                            return vehicleData.callerNumber
                        }
                        return "Unknown"
                    }
                    font {
                        pixelSize: 24
                        family: "Roboto"
                        weight: Font.Bold
                    }
                    color: "white"
                    Layout.alignment: Qt.AlignHCenter
                    elide: Text.ElideRight
                    maximumLineCount: 1
                    Layout.maximumWidth: parent.width
                }

                // Номер телефона (если есть имя)
                Text {
                    visible: vehicleData && vehicleData.callerName && vehicleData.callerName.length > 0 && 
                             vehicleData.callerNumber && vehicleData.callerNumber.length > 0
                    text: vehicleData ? vehicleData.callerNumber : ""
                    font.pixelSize: 16
                    color: "#AAAAAA"
                    Layout.alignment: Qt.AlignHCenter
                }

                // Статус звонка
                Text {
                    text: {
                        if (!vehicleData) return ""
                        switch(callStatus) {
                            case 1: return "Входящий звонок"
                            case 2: return "Исходящий звонок..."
                            case 3: return "Разговор"
                            case 4: return "Звонок завершен"
                            case 5: return "Пропущенный звонок"
                            case 6: return "Звонок отклонен"
                            default: return "Нет активных звонков"
                        }
                    }
                    font.pixelSize: 16
                    color: {
                        if (isIncoming || isOutgoing) return "#00E0FF"
                        if (isActive) return "#4CAF50"
                        if (callStatus === 5) return "#FF5555"
                        if (callStatus === 6) return "#FF9800"
                        return "#AAAAAA"
                    }
                    Layout.alignment: Qt.AlignHCenter
                }

                // Длительность звонка
                Text {
                    visible: isActive && vehicleData
                    text: formatTime(vehicleData ? vehicleData.callDuration : 0)
                    font {
                        pixelSize: 20
                        family: "Roboto"
                        weight: Font.Bold
                    }
                    color: "#4CAF50"
                    Layout.alignment: Qt.AlignHCenter
                }
            }

            // Анимация звонка (пульсация)
            Item {
                Layout.fillWidth: true
                Layout.preferredHeight: 40
                visible: (isIncoming || isOutgoing) && hasActiveCall

                Row {
                    anchors.centerIn: parent
                    spacing: 12

                    Repeater {
                        model: 3

                        Rectangle {
                            width: 12
                            height: 12
                            radius: 6
                            color: "#00E0FF"

                            SequentialAnimation on opacity {
                                running: (isIncoming || isOutgoing) && hasActiveCall
                                loops: Animation.Infinite
                                NumberAnimation { from: 0.3; to: 1.0; duration: 1000; easing.type: Easing.InOutQuad }
                                PauseAnimation { duration: index * 200 }
                            }

                            SequentialAnimation on scale {
                                running: (isIncoming || isOutgoing) && hasActiveCall
                                loops: Animation.Infinite
                                NumberAnimation { from: 0.8; to: 1.2; duration: 1000; easing.type: Easing.InOutQuad }
                                PauseAnimation { duration: index * 200 }
                            }
                        }
                    }
                }
            }

            // Кнопки управления звонком
            RowLayout {
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter
                spacing: 15
                visible: hasActiveCall

                // Кнопка "Ответить" (только для входящего)
                Button {
                    visible: isIncoming
                    Layout.preferredWidth: 80
                    Layout.preferredHeight: 80
                    background: Rectangle {
                        color: parent.pressed ? Qt.darker("#4CAF50", 1.2) : "#4CAF50"
                        radius: 40
                        border.color: "white"
                        border.width: 2
                    }
                    contentItem: Text {
                        text: "✓"
                        font.pixelSize: 32
                        color: "white"
                        anchors.centerIn: parent
                    }
                    onClicked: {
                        if (vehicleData) {
                            vehicleData.callStatus = 3 // ActiveCall
                            vehicleData.callDuration = 0 // Сброс таймера
                        }
                    }
                }

                // Кнопка "Отклонить" (только для входящего)
                Button {
                    visible: isIncoming
                    Layout.preferredWidth: 80
                    Layout.preferredHeight: 80
                    background: Rectangle {
                        color: parent.pressed ? Qt.darker("#F44336", 1.2) : "#F44336"
                        radius: 40
                        border.color: "white"
                        border.width: 2
                    }
                    contentItem: Text {
                        text: "✕"
                        font.pixelSize: 32
                        color: "white"
                        anchors.centerIn: parent
                    }
                    onClicked: {
                        if (vehicleData) {
                            vehicleData.callStatus = 6 // CallRejected
                            vehicleData.callDuration = 0
                        }
                    }
                }

                // Кнопка "Завершить" (для активного или исходящего)
                Button {
                    visible: isActive || isOutgoing
                    Layout.preferredWidth: 80
                    Layout.preferredHeight: 80
                    background: Rectangle {
                        color: parent.pressed ? Qt.darker("#F44336", 1.2) : "#F44336"
                        radius: 40
                        border.color: "white"
                        border.width: 2
                    }
                    contentItem: Text {
                        text: "✕"
                        font.pixelSize: 32
                        color: "white"
                        anchors.centerIn: parent
                    }
                    onClicked: {
                        if (vehicleData) {
                            if (isActive) {
                                vehicleData.callStatus = 4 // CallEnded
                            } else {
                                vehicleData.callStatus = 0 // NoCall
                            }
                            vehicleData.callDuration = 0
                        }
                    }
                }

                // Кнопка "Удержать" (только для активного)
                Button {
                    visible: isActive
                    Layout.preferredWidth: 60
                    Layout.preferredHeight: 60
                    background: Rectangle {
                        color: parent.pressed ? Qt.darker("#FF9800", 1.2) : "#FF9800"
                        radius: 30
                        border.color: "white"
                        border.width: 2
                    }
                    contentItem: Text {
                        text: "⏸"
                        font.pixelSize: 24
                        color: "white"
                        anchors.centerIn: parent
                    }
                    onClicked: {
                        // Здесь можно добавить логику удержания звонка
                        // Пока просто логируем
                        console.log("Call on hold")
                    }
                }
            }

            // Сообщение когда нет звонка
            Text {
                visible: !hasActiveCall
                text: "Нет активных звонков"
                font.pixelSize: 16
                color: "#666666"
                Layout.alignment: Qt.AlignHCenter
                Layout.fillHeight: true
            }
        }
    }
}
