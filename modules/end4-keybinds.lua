hl.bind("CTRL+SUPER+ALT+Slash", hl.dsp.exec_cmd("xdg-open ~/.config/hypr/custom/keybinds.lua"), { description = "Edit user keybinds" })

-- Preserve the workspace shortcuts used in the previous desktop workflow.
hl.bind("CTRL + ALT + Left", hl.dsp.focus({ workspace = "r-1" }), { description = "Workspace: Previous" })
hl.bind("CTRL + ALT + Right", hl.dsp.focus({ workspace = "r+1" }), { description = "Workspace: Next" })
hl.bind("CTRL + Grave", hl.dsp.focus({ workspace = "previous" }), { description = "Workspace: Last used" })

-- Reliable capture shortcuts that do not depend on Quickshell IPC. Remove the
-- upstream bindings first so one key press never launches multiple tools.
hl.unbind("Print")
hl.unbind("CTRL + Print")
hl.unbind("SUPER + SHIFT + S")
hl.unbind("SUPER + SHIFT + R")
hl.unbind("CTRL + ALT + R")

hl.bind("Print", hl.dsp.exec_cmd("end4-screenshot region"),
    { locked = true, description = "Utilities: Select region screenshot" })
hl.bind("CTRL + Print", hl.dsp.exec_cmd("end4-screenshot output"),
    { locked = true, description = "Utilities: Screenshot active monitor" })
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("end4-screen-record region"),
    { locked = true, description = "Utilities: Start/stop region recording" })
hl.bind("ALT + Print", hl.dsp.exec_cmd("end4-screen-record output"),
    { locked = true, description = "Utilities: Start/stop monitor recording" })
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("end4-screenshot region"),
    { locked = true, description = "Utilities: Select region screenshot" })
hl.bind("SUPER + SHIFT + R", hl.dsp.exec_cmd("end4-screen-record region"),
    { locked = true, description = "Utilities: Start/stop region recording" })
hl.bind("CTRL + ALT + R", hl.dsp.exec_cmd("end4-screen-record output"),
    { locked = true, description = "Utilities: Start/stop monitor recording" })
