import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.0

import "Gauges"
import "Components"

Window {
    id: window
    width: 1280
    height: 720
    visible: true
    color: "#000000"
    minimumWidth: 640
    minimumHeight: 480

    property double scaling: 2 * Math.min(width / 1920, height / 1080)

    FontLoader {
        source: "qrc:/Resources/Fonts/InriaSans/InriaSans-Bold.ttf"
    }

    FontLoader {
        source: "qrc:/Resources/Fonts/Roboto/Roboto-Bold.ttf"
    }

    Item {
        id: container
        x: 0
        y: 0
        anchors.fill: parent

        // Row {
        //     spacing: 16 * scaling
        //     anchors.horizontalCenter: row.horizontalCenter
        //     anchors.top: row.top

        //     Indicator {
        //         type: "headlight"
        //         size: 32 * scaling
        //         indicatorColor: "#20CFFF"
        //     }

        //     Indicator {
        //         type: "lamp"
        //         size: 32 * scaling
        //         indicatorColor: "#57FA62"
        //     }
        // }

        Column {
            id: column
            anchors.top: row.top
            anchors.right: row.left
            anchors.topMargin: 16 * scaling

            Fuelmeter {
                id: fuelmeter
                width: 160 * scaling
                height: 160 * scaling
                value: drivingData.fuelTank
            }

            TemperatureMeter {
                id: temperatureMeter
                width: 160 * scaling
                height: 160 * scaling
                value: drivingData.temperature
            }
        }

        Row {
            id: row
            anchors.centerIn: container
            anchors.horizontalCenterOffset: 48 * scaling
            spacing: 48 * scaling

            Speedometer {
                id: speedometer
                width: 320 * scaling
                height: 320 * scaling
                value: drivingData.speed
            }

            Tachometer {
                id: tachometer
                width: 320 * scaling
                height: 320 * scaling
                value: drivingData.throttle
            }
        }
    }
}
