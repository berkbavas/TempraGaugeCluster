import QtQuick 2.0

Canvas {
    property double outerRadius: 0

    y: 0.025 * height
    width: 4.5 / 90 * outerRadius
    height: 90 / 90 * outerRadius
    antialiasing: true

    onPaint: {
        let ctx = getContext('2d')

        let gradient = ctx.createLinearGradient(0, height / 2, width, height / 2)
        gradient.addColorStop(0, '#FFFFFF')
        gradient.addColorStop(1, '#CFCFCF')
        ctx.fillStyle = gradient

        ctx.beginPath()
        ctx.moveTo(0.2 * width, 0)
        ctx.lineTo(0.8 * width, 0)
        ctx.lineTo(width, height)
        ctx.lineTo(0, height)
        ctx.closePath()
        ctx.fill()
    }
}
