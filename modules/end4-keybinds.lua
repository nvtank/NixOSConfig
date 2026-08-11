hl.bind("CTRL+SUPER+ALT+Slash", hl.dsp.exec_cmd("xdg-open ~/.config/hypr/custom/keybinds.lua"), { description = "Edit user keybinds" })

-- Preserve the workspace shortcuts used in the previous desktop workflow.
hl.bind("CTRL + ALT + Left", hl.dsp.focus({ workspace = "r-1" }), { description = "Workspace: Previous" })
hl.bind("CTRL + ALT + Right", hl.dsp.focus({ workspace = "r+1" }), { description = "Workspace: Next" })
hl.bind("CTRL + Grave", hl.dsp.focus({ workspace = "previous" }), { description = "Workspace: Last used" })
