-- Local overrides managed by /etc/nixos.
-- Keep the base illogical-impulse config available while selecting end4-pC.
hl.env("qsConfig", "end4-pC")

-- end4-pC embeds Settings in the running shell; its old standalone
-- settings.qml path no longer exists.
settingsApp = "qs -c $qsConfig ipc call settings open"
