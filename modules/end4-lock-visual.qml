import QtQuick
import QtQuick.Layouts
import Quickshell.Services.UPower
import qs
import qs.services
import qs.modules.common
import qs.modules.common.widgets
import qs.modules.common.functions

Item {
    id: root

    property date now: new Date()
    readonly property real edgeMargin: Math.max(32, width * 0.045)
    readonly property string displayName: Config.options.profile.displayName === ""
        ? SystemInfo.username
        : Config.options.profile.displayName

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: root.now = new Date()
    }

    // A restrained cinematic veil keeps text legible without hiding the wall.
    Rectangle {
        anchors.fill: parent
        color: Qt.rgba(0.015, 0.018, 0.028, 0.16)
    }

    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop { position: 0.0; color: Qt.rgba(0.01, 0.02, 0.04, 0.58) }
            GradientStop { position: 0.48; color: Qt.rgba(0.01, 0.02, 0.04, 0.12) }
            GradientStop { position: 1.0; color: Qt.rgba(0.01, 0.02, 0.04, 0.30) }
        }
    }

    // Oversized orbital accents give the layout a recognizable silhouette.
    Rectangle {
        width: Math.min(root.width * 0.44, 760)
        height: width
        radius: width / 2
        anchors {
            left: parent.left
            leftMargin: -width * 0.54
            verticalCenter: parent.verticalCenter
        }
        color: "transparent"
        border.width: 2
        border.color: ColorUtils.applyAlpha(Appearance.colors.colPrimary, 0.32)
    }

    Rectangle {
        width: Math.min(root.width * 0.28, 480)
        height: width
        radius: width / 2
        anchors {
            right: parent.right
            rightMargin: -width * 0.45
            top: parent.top
            topMargin: -width * 0.38
        }
        color: ColorUtils.applyAlpha(Appearance.colors.colPrimary, 0.07)
        border.width: 1
        border.color: ColorUtils.applyAlpha(Appearance.colors.colPrimary, 0.22)
    }

    RowLayout {
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            topMargin: Math.max(24, root.height * 0.035)
            leftMargin: root.edgeMargin
            rightMargin: root.edgeMargin
        }

        Rectangle {
            Layout.preferredWidth: brandRow.implicitWidth + 28
            Layout.preferredHeight: 38
            radius: height / 2
            color: ColorUtils.applyAlpha(Appearance.colors.colLayer0, 0.30)
            border.width: 1
            border.color: ColorUtils.applyAlpha(Appearance.colors.colOutline, 0.28)

            Row {
                id: brandRow
                anchors.centerIn: parent
                spacing: 9

                Rectangle {
                    anchors.verticalCenter: parent.verticalCenter
                    width: 8
                    height: 8
                    radius: 4
                    color: Appearance.colors.colPrimary
                }

                StyledText {
                    text: "NIXOS  /  SECURE SESSION"
                    font.family: Appearance.font.family.monospace
                    font.pixelSize: 12
                    font.weight: Font.DemiBold
                    font.letterSpacing: 1.2
                    color: Appearance.colors.colOnLayer0
                }
            }
        }

        Item { Layout.fillWidth: true }

        Row {
            spacing: 10

            MaterialSymbol {
                anchors.verticalCenter: parent.verticalCenter
                text: "shield_lock"
                fill: 1
                iconSize: 20
                color: Appearance.colors.colPrimary
            }

            StyledText {
                anchors.verticalCenter: parent.verticalCenter
                text: SystemInfo.hostname.toUpperCase()
                font.family: Appearance.font.family.monospace
                font.pixelSize: 12
                font.letterSpacing: 1
                color: Appearance.colors.colOnLayer0
            }
        }
    }

    Column {
        id: heroClock
        width: Math.min(720, root.width * 0.56)
        spacing: -8
        anchors {
            left: parent.left
            leftMargin: root.edgeMargin
            verticalCenter: parent.verticalCenter
            verticalCenterOffset: -54
        }

        StyledText {
            text: Qt.formatTime(root.now, "HH:mm")
            font.family: Appearance.font.family.expressive
            font.pixelSize: Math.max(82, Math.min(164, root.width * 0.095))
            font.weight: Font.Light
            font.letterSpacing: -5
            color: Appearance.colors.colOnLayer0
        }

        Row {
            spacing: 14

            Rectangle {
                anchors.verticalCenter: parent.verticalCenter
                width: 54
                height: 3
                radius: 2
                color: Appearance.colors.colPrimary
            }

            StyledText {
                anchors.verticalCenter: parent.verticalCenter
                text: Qt.formatDate(root.now, "dddd, d MMMM yyyy")
                font.family: Appearance.font.family.main
                font.pixelSize: Math.max(18, Math.min(28, root.width * 0.017))
                font.weight: Font.Medium
                color: Appearance.colors.colOnLayer0
            }
        }

        StyledText {
            topPadding: 26
            text: "Welcome back, " + root.displayName
            font.family: Appearance.font.family.main
            font.pixelSize: Math.max(16, Math.min(22, root.width * 0.014))
            color: ColorUtils.applyAlpha(Appearance.colors.colOnLayer0, 0.72)
        }
    }

    // This glass dock frames the existing, security-tested auth controls.
    Rectangle {
        id: authDock
        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
            bottomMargin: 16
        }
        width: Math.min(parent.width - 48, 1180)
        height: 104
        radius: 34
        color: ColorUtils.applyAlpha(Appearance.colors.colLayer0, 0.26)
        border.width: 1
        border.color: ColorUtils.applyAlpha(Appearance.colors.colOutline, 0.30)

        Rectangle {
            anchors {
                left: parent.left
                leftMargin: 16
                verticalCenter: parent.verticalCenter
            }
            width: 4
            height: 44
            radius: 2
            color: Appearance.colors.colPrimary
        }

        StyledText {
            anchors {
                left: parent.left
                leftMargin: 34
                bottom: parent.bottom
                bottomMargin: 12
            }
            text: "ENTER TO UNLOCK  •  ESC TO CLEAR"
            font.family: Appearance.font.family.monospace
            font.pixelSize: 10
            font.letterSpacing: 0.8
            color: ColorUtils.applyAlpha(Appearance.colors.colOnLayer0, 0.48)
        }

        Row {
            anchors {
                right: parent.right
                rightMargin: 24
                bottom: parent.bottom
                bottomMargin: 10
            }
            spacing: 8

            MaterialSymbol {
                anchors.verticalCenter: parent.verticalCenter
                text: Battery.isCharging ? "bolt" : "battery_android_full"
                iconSize: 16
                color: Battery.isLow && !Battery.isCharging
                    ? Appearance.colors.colError
                    : Appearance.colors.colPrimary
            }

            StyledText {
                anchors.verticalCenter: parent.verticalCenter
                text: Battery.available ? Math.round(Battery.percentage * 100) + "%" : "AC"
                font.family: Appearance.font.family.monospace
                font.pixelSize: 11
                color: ColorUtils.applyAlpha(Appearance.colors.colOnLayer0, 0.66)
            }
        }
    }
}
