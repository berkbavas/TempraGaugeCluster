import QtQuick 2.0
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

import ".."
import "../Components"

CircularGauge {
    minimumValue: 0
    maximumValue: 100
    stepSize: 0.001

    style: CircularGaugeStyle {
        id: style
        minimumValueAngle: -90
        maximumValueAngle: 0
        tickmarkStepSize: 25
        labelStepSize: 50
        minorTickmarkCount: 3
        labelInset: 0.25 * outerRadius
        tickmarkInset: 0
        minorTickmarkInset: 0

        tickmark: Rectangle {
            color: Constants.tickmarkColor
            width: styleData.value % 10 === 0 ? 4 / 100 * outerRadius : 2 / 100 * outerRadius
            height: 12 / 100 * outerRadius
            antialiasing: true
        }

        minorTickmark: Rectangle {
            color: Constants.tickmarkColor
            width: 2 / 100 * outerRadius
            height: 6 / 100 * outerRadius
            antialiasing: true
        }

        tickmarkLabel: TickmarkLabel {
            font.pixelSize: Math.max(6, outerRadius * 0.125)
            text: {
                if (styleData.value === 0)
                    return "0"
                else if (styleData.value === 50)
                    return "1/2"
                else if (styleData.value === 100)
                    return "1"
                else
                    return styleData.value
            }
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
                source: "qrc:/Resources/Images/fuel.svg"
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
        }
    }
}
