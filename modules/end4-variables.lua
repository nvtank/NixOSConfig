-- Local overrides managed by /etc/nixos.
-- Keep the base illogical-impulse config available while selecting end4-pC.
hl.env("qsConfig", "end4-pC")

-- Prefer the system-themed Kitty terminal. Foot remains installed as a safe
-- fallback and can still be launched explicitly.
terminal = "kitty --single-instance"

-- Use the complete GNOME control center for network/Bluetooth management.
-- GNOME normally refuses to start outside its own desktop unless this value
-- is supplied explicitly.
settingsApp = "env XDG_CURRENT_DESKTOP=GNOME gnome-control-center"
