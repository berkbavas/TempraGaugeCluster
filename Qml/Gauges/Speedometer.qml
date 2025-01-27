import QtQuick 2.0
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

import ".."
import "../Components"

CircularGauge {
    value: root.value
    minimumValue: 0
    maximumValue: 200
    stepSize: 0.001

    style: CircularGaugeStyle {
        id: style
        minimumValueAngle: -130
        maximumValueAngle: 130
        tickmarkStepSize: 10
        labelStepSize: 20
        minorTickmarkCount: 4
        labelInset: 22 / 100 * outerRadius
        tickmarkInset: 0 / 100 * outerRadius
        minorTickmarkInset: 0 / 100 * outerRadius

        tickmark: Rectangle {
            color: Constants.tickmarkColor
            width: styleData.value % 10 === 0 ? 2 / 100 * outerRadius : 1 / 100 * outerRadius
            height: 10 / 100 * outerRadius
            antialiasing: true
        }

        minorTickmark: Rectangle {
            color: Constants.tickmarkColor
            width: 1 / 100 * outerRadius
            height: 5 / 100 * outerRadius
            antialiasing: true
        }

        tickmarkLabel: TickmarkLabel {
            font.pixelSize: Math.max(6, outerRadius * 0.125)
            text: styleData.value
        }

        foreground: Foreground {
            outerRadius: style.outerRadius
        }

        needle: Needle {
            outerRadius: style.outerRadius
        }

        background: Item {
            id: background
            width: 2 * outerRadius
            height: 2 * outerRadius

            Text {
                x: 0
                y: 1.5 * outerRadius
                width: 2 * outerRadius
                font.family: Constants.font
                font.pixelSize: Math.max(6, outerRadius * 0.1)
                text: "km/h"
                antialiasing: true
                color: Constants.labelColor
                font.weight: Font.Black
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }
}
