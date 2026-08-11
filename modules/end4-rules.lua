-- Local window rules managed by /etc/nixos.
-- Upstream disables blur for all application windows; opt Kitty back in so
-- its translucent background receives the compositor's real blur effect.
hl.window_rule({ match = { class = "^(kitty)$" }, no_blur = false })
