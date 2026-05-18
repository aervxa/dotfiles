-------------
--- RULES ---
-------------

-- See https://wiki.hypr.land/Configuring/Window-Rules/ for more
-- See https://wiki.hypr.land/Configuring/Workspace-Rules/ for workspace rules

hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})

-- Open Discord and Spotify in it's own workspace
hl.window_rule({ match = { class = "Spotify" }, workspace = "special:spotify" })
hl.window_rule({ match = { class = "discord|vesktop" }, workspace = "special:discord" })
hl.window_rule({ match = { class = "obsidian" }, workspace = "special:obsidian" })

-- Padding for workspaces
hl.workspace_rule({ workspace = "special:spotify", gaps_out = { top = 128, right = 256, bottom = 128, left = 256 } })
hl.workspace_rule({ workspace = "special:discord", gaps_out = { top = 32, right = 64, bottom = 32, left = 64 } })
hl.workspace_rule({ workspace = "special:obsidian", gaps_out = { top = 64, right = 128, bottom = 64, left = 128 } })

-- Float apps
-- windowrule = match:float true, center on
local floating_classes = {
    "org.pulseaudio.pavucontrol",
    "blueman-manager",
    "org.fcitx.fcitx5-config-qt",
    "org.openrgb.OpenRGB",
    "org.gnome.clocks",
    "org.gnome.Calculator",
    "Waydroid",
    "firewall-config",
}

for _, class in ipairs(floating_classes) do
    hl.window_rule({ match = { class = class }, float = true })
end

-- Float devtools
hl.window_rule({ match = { title = "DevTools" }, float = true, size = "1024 640" })

-- Float popups
hl.window_rule({ match = { title = "(?i).*(save|open|select).*" }, float = true })
hl.window_rule({ match = { class = "xdg-desktop-portal-gtk" }, float = true })

-- PIP
local pip_title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$"
hl.window_rule({ match = { title = pip_title }, float = true })
hl.window_rule({ match = { title = pip_title }, keep_aspect_ratio = true })
hl.window_rule({ match = { title = pip_title }, move = "(monitor_w*.73) (monitor_h*.72)" })
hl.window_rule({ match = { title = pip_title }, size = "(monitor_w*.25) (monitor_h*.25)" })
hl.window_rule({ match = { title = pip_title }, pin = true })

-- Set app specific size for apps
hl.window_rule({ match = { class = "org.pulseaudio.pavucontrol" }, size = "768 512" })
hl.window_rule({ match = { class = "org.gnome.clocks" }, size = "512 768" })
hl.window_rule({ match = { class = "blueman-manager" }, size = "512 384" })
hl.window_rule({ match = { class = "Waydroid" }, size = "448 896" })

-- Emoji picker
hl.window_rule({ match = { title = "im-emoji-picker" }, no_focus = true })
hl.window_rule({ match = { title = "im-emoji-picker" }, center = true })

-- make polkit behave like windows UAC
hl.window_rule({ match = { class = "polkit-gnome-authentication-agent-1" }, stay_focused = true })
hl.window_rule({ match = { class = "polkit-gnome-authentication-agent-1" }, dim_around = 1 })
hl.window_rule({ match = { class = "polkit-gnome-authentication-agent-1" }, pin = true })

-- Blur waybar
hl.layer_rule({ match = { namespace = "waybar" }, blur = true })
hl.layer_rule({ match = { namespace = "waybar" }, blur_popups = true })
hl.layer_rule({ match = { namespace = "waybar" }, ignore_alpha = 0 })

-- Blur hypr-dock
hl.layer_rule({ match = { namespace = "hypr-dock" }, blur = true })
hl.layer_rule({ match = { namespace = "hypr-dock" }, blur_popups = true })
hl.layer_rule({ match = { namespace = "hypr-dock" }, ignore_alpha = 0 })
hl.layer_rule({ match = { namespace = "dock-popup" }, blur = true })
hl.layer_rule({ match = { namespace = "dock-popup" }, ignore_alpha = 0 })

-- Blur swaync
hl.layer_rule({ match = { namespace = "swaync-notification-window" }, blur = true })
hl.layer_rule({ match = { namespace = "swaync-notification-window" }, ignore_alpha = 0 })
hl.layer_rule({ match = { namespace = "swaync-notification-window" }, animation = "slide right" })
hl.layer_rule({ match = { namespace = "swaync-control-center" }, blur = true })
hl.layer_rule({ match = { namespace = "swaync-control-center" }, ignore_alpha = 0 })
hl.layer_rule({ match = { namespace = "swaync-control-center" }, animation = "slide right" })

-- Blur rofi
hl.layer_rule({ match = { namespace = "rofi" }, blur = true })
hl.layer_rule({ match = { namespace = "rofi" }, xray = true })
hl.layer_rule({ match = { namespace = "rofi" }, ignore_alpha = 0 })

-- No anim for screenshot layers
hl.layer_rule({ match = { namespace = "hyprpicker|selection" }, no_anim = true })
