-----------------
--- AUTOSTART ---
-----------------

local autostart = require("scripts/autostart")

hl.on("hyprland.start", function()
  hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1") -- Load polkit-gnome (authentication agent)
  hl.exec_cmd("wl-clip-persist --clipboard regular")                       -- Start wl-clip-persist (persisting clipboard)
  hl.exec_cmd("waybar")                                                    -- Start waybar (status bar)
  hl.exec_cmd("hypridle")                                                  -- Start hypridle
  hl.exec_cmd("hyprpm reload")                                             -- Load hypr plugins
  hl.exec_cmd("awww-daemon")                                               -- Load swww (wallpaper backend)
  hl.exec_cmd("openrgb -p default")                                        -- Load main OpenRGB profile
  hl.exec_cmd("fcitx5 -rd")                                                -- Load fcitx5 (input method framework)
  hl.exec_cmd("playerctld daemon")                                         -- Load playerctl's daemon to keep track of last played app
  hl.exec_cmd("swaync")                                                    -- Load swaync (notification center)
  hl.exec_cmd("swayosd-server")                                            -- Load swayosd server for swayosd-cilent usage

  autostart()

  hl.dispatch(hl.dsp.focus({ workspace = 5 })) -- Launch to main workspace
end)
