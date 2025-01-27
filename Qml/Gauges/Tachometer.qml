import QtQuick 2.0
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

import ".."
import "../Components"

CircularGauge {
    value: root.value
    minimumValue: 0
    maximumValue: 80
    stepSize: 0.001

    style: CircularGaugeStyle {
        id: style
        minimumValueAngle: -130
        maximumValueAngle: 130
        tickmarkStepSize: 5
        labelStepSize: 10
        minorTickmarkCount: 5
        labelInset: 22 / 100 * outerRadius
        tickmarkInset: 0
        minorTickmarkInset: 0

        tickmark: Rectangle {
            y: -border.width
            color: Constants.tickmarkColor
            width: styleData.value % 10 === 0 ? 6 / 100 * outerRadius : 6 / 100 * outerRadius
            height: 16.5 / 100 * outerRadius
            antialiasing: true
            border.color: "#000000"
            border.width: 2 / 100 * outerRadius
        }

        minorTickmark: Rectangle {
            color: Constants.tickmarkColor
            width: 1.5 / 100 * outerRadius
            height: 6 / 100 * outerRadius
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

            Foreground {
                outerRadius: style.outerRadius
                anchors.centerIn: background
            }

            Canvas {
                anchors.fill: parent
                onPaint: {
                    var ctx = getContext("2d")
                    ctx.reset()

                    ctx.lineWidth = 4 / 90 * outerRadius

                    ctx.beginPath()
                    ctx.arc(outerRadius, outerRadius, outerRadius - ctx.lineWidth / 2 - 8 / 100 * outerRadius, degreesToRadians(valueToAngle(60) - 90), degreesToRadians(valueToAngle(80.25) - 90))
                    ctx.strokeStyle = "#D32300"
                    ctx.stroke()
                    ctx.closePath()

                    ctx.beginPath()
                    ctx.arc(outerRadius, outerRadius, outerRadius - ctx.lineWidth / 2 - 8 / 100 * outerRadius, degreesToRadians(valueToAngle(53.5) - 90), degreesToRadians(valueToAngle(60) - 90))
                    ctx.strokeStyle = "#FFC90E"
                    ctx.stroke()
                    ctx.closePath()
                }
            }

            Text {
                x: 0
                y: 0.60 * outerRadius
                width: 2 * outerRadius
                font.family: Constants.font
                font.pixelSize: Math.max(6, outerRadius * 0.065)
                text: "ELECTRONIC"
                antialiasing: true
                color: Constants.labelColor
                font.weight: Font.Black
                horizontalAlignment: Text.AlignHCenter
            }

            Text {
                x: 0
                y: 1.55 * outerRadius
                width: 2 * outerRadius
                font.family: Constants.font
                font.pixelSize: Math.max(6, outerRadius * 0.065)
                text: "x 100"
                antialiasing: true
                color: Constants.labelColor
                font.weight: Font.Black
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }

    function degreesToRadians(degrees) {
        return degrees * (Math.PI / 180)
    }
}
