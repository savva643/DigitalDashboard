import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: signal
    property alias direction: directionIcon.source
    property bool active: false
    property int blinkInterval: 700

    width: 42
    height: 42
    visible: true  // Всегда видимый
    opacity: active ? 1 : 0  // Начальное состояние

    Image {
        id: directionIcon
        anchors.centerIn: parent
        width: 36
        height: 36
        fillMode: Image.PreserveAspectFit
    }

    // Основная анимация мерцания
    SequentialAnimation {
        id: blinkAnimation
        running: active
        loops: Animation.Infinite

        NumberAnimation {
            target: signal
            property: "opacity"
            from: 1
            to: 0.3
            duration: blinkInterval / 2
            easing.type: Easing.InOutQuad
        }

        NumberAnimation {
            target: signal
            property: "opacity"
            from: 0.3
            to: 1
            duration: blinkInterval / 2
            easing.type: Easing.InOutQuad
        }
    }

    // Анимация для плавного исчезновения
    SequentialAnimation {
        id: fadeOutAnimation
        running: false

        // Завершаем текущий цикл мерцания (если был в фазе затемнения)
        NumberAnimation {
            target: signal
            property: "opacity"
            to: 0
            duration: {
                // Рассчитываем оставшееся время до завершения текущего цикла
                var currentTime = blinkAnimation.currentTime % blinkInterval;
                if (currentTime < blinkInterval/2) {
                    // Если в фазе затемнения
                    return blinkInterval/2 - currentTime;
                } else {
                    // Если в фазе появления
                    return blinkInterval - currentTime + blinkInterval/2;
                }
            }
            easing.type: Easing.InOutQuad
        }

        onStopped: {
            signal.opacity = 0;
        }
    }

    onActiveChanged: {
        if (active) {
            fadeOutAnimation.stop();
            blinkAnimation.start();
            opacity = 1;
        } else {
            blinkAnimation.stop();
            fadeOutAnimation.start();
        }
    }
}
