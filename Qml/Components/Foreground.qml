import QtQuick 2.0

Item {
    id: root

    property double outerRadius: 0

    Rectangle {
        width: 0.16 * root.outerRadius
        height: 0.16 * root.outerRadius
        radius: 0.08 * root.outerRadius
        anchors.centerIn: root

        gradient: Gradient {

            GradientStop {
                position: 0.0
                color: "#1f1f1f"
            }

            GradientStop {
                position: 1.0
                color: "#101010"
            }
        }
    }
}
