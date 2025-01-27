import QtQuick 2.0
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

import ".."
import "../Components"

CircularGauge {
    minimumValue: 50
    maximumValue: 130
    stepSize: 0.001

    style: CircularGaugeStyle {
        id: style
        minimumValueAngle: -90
        maximumValueAngle: 0
        tickmarkStepSize: 20
        labelStepSize: 40
        minorTickmarkCount: 3
        labelInset: 0.25 * outerRadius
        tickmarkInset: 0
        minorTickmarkInset: 0

        tickmark: Rectangle {
            color: Constants.tickmarkColor
            width: (styleData.value - 50) % 40 === 0 ? 4 / 100 * outerRadius : 2 / 100 * outerRadius
            height: 12 / 100 * outerRadius
            antialiasing: true
        }

        minorTickmark: Rectangle {
            color: Constants.tickmarkColor
            width: 2 / 100 * outerRadius
            height: 6 / 100 * outerRadius
            antialiasing: true
        }

        tickmarkLabel: Text {
            font.family: Constants.font
            font.pixelSize: Math.max(6, outerRadius * 0.125)
            text: styleData.value
            antialiasing: true
            color: Constants.tickmarkColor
            font.weight: Font.Black
        }

        foreground: Foreground {
            outerRadius: style.outerRadius
        }

        needle: Needle {
            outerRadius: style.outerRadius
        }

        background: Item {
            width: 2 * outerRadius
            height: 2 * outerRadius

            Image {
                id: image
                x: 1.150 * outerRadius
                y: -0.05 * outerRadius
                width: 0.175 * outerRadius
                height: 0.175 * outerRadius
                source: "qrc:/Resources/Images/temperature.svg"
                antialiasing: true
                fillMode: Image.PreserveAspectFit
                visible: false
            }

            ColorOverlay {
                id: overlay
                anchors.fill: image
                source: image
                color: "#FFFFFF"
                antialiasing: true
            }

            Text {
                x: 1.150 * outerRadius
                y: 0.170 * outerRadius
                font.family: Constants.font
                font.pixelSize: Math.max(6, outerRadius * 0.125)
                text: "°C"
                antialiasing: true
                color: Constants.labelColor
                font.weight: Font.Black
            }
        }
    }
}
