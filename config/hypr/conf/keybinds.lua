local gamemode = require("scripts/gamemode")
local gridnavigate = require("scripts/gridnavigate")

-------------
--- EXECS ---
-------------

local dpms_off = function()
  hl.timer(function()
    hl.dispatch(hl.dsp.dpms({ action = "disable" }))
  end, { timeout = 1000, type = "oneshot" })
end

hl.bind("SUPER + T", hl.dsp.exec_cmd("kitty"))                                                                      -- terminal
hl.bind("SUPER + E", hl.dsp.exec_cmd("nautilus --new-window"))                                                      -- file manager
hl.bind("SUPER + SHIFT + C", hl.dsp.exec_cmd("hyprpicker --autocopy"))                                              -- color picker
hl.bind("SUPER + R", hl.dsp.exec_cmd("pkill -fx 'rofi -show drun' || (pkill rofi; rofi -show drun)"))               -- run launcher
hl.bind("SUPER + Tab", hl.dsp.exec_cmd("pkill -fx 'rofi -show window' || (pkill rofi; rofi -show window)"))         -- window switcher
hl.bind("SUPER + CTRL + SHIFT + Q", hl.dsp.exec_cmd("hyprlock"))                                                    -- lock screen
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("grimblast -f save area - | wl-copy"))                                 -- screenshot
hl.bind("SUPER + CTRL + SHIFT + C", hl.dsp.exec_cmd("grimblast -f save area - | tesseract stdin stdout | wl-copy")) -- OCR
hl.bind("SUPER + A", hl.dsp.exec_cmd("swaync-client -t"))                                                           -- notification center
hl.bind("SUPER + ALT + B", hl.dsp.exec_cmd("~/.config/hypr/scripts/mic-loopback"))                                  -- mic loopback
hl.bind("SUPER + CTRL + SHIFT + Escape", dpms_off, { locked = true })                                               -- dmps off
hl.bind("SUPER + G", function() hl.plugin.hyprexpo.expo("toggle") end)                                              -- expo overview
hl.bind("SUPER + ALT + G", gamemode)                                                                                -- game mode

------------------
--- WORKSPACES ---
------------------

-- move workspace focus
hl.bind("SUPER + CTRL + right", gridnavigate("right"))
hl.bind("SUPER + CTRL + left", gridnavigate("left"))
hl.bind("SUPER + CTRL + up", gridnavigate("top"))
hl.bind("SUPER + CTRL + down", gridnavigate("bottom"))
-- via ijkl
hl.bind("SUPER + CTRL + I", gridnavigate("top"))
hl.bind("SUPER + CTRL + J", gridnavigate("left"))
hl.bind("SUPER + CTRL + K", gridnavigate("bottom"))
hl.bind("SUPER + CTRL + L", gridnavigate("right"))
-- via [1-9]
hl.bind("SUPER + grave", hl.dsp.focus({ workspace = 5 })) -- default one
for i = 1, 9 do
  hl.bind("SUPER + " .. i, hl.dsp.focus({ workspace = i }))
end

-- move windows
hl.bind("SUPER + CTRL + SHIFT + right", gridnavigate("right", true))
hl.bind("SUPER + CTRL + SHIFT + left", gridnavigate("left", true))
hl.bind("SUPER + CTRL + SHIFT + up", gridnavigate("top", true))
hl.bind("SUPER + CTRL + SHIFT + down", gridnavigate("bottom", true))
-- via ijkl
hl.bind("SUPER + CTRL + SHIFT + I", gridnavigate("top", true))
hl.bind("SUPER + CTRL + SHIFT + J", gridnavigate("left", true))
hl.bind("SUPER + CTRL + SHIFT + K", gridnavigate("bottom", true))
hl.bind("SUPER + CTRL + SHIFT + L", gridnavigate("right", true))
-- via [1-9]
hl.bind("SUPER + SHIFT + grave", hl.dsp.window.move({ workspace = 5 })) -- default one
for i = 1, 9 do
  hl.bind("SUPER + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

-- special workspaces
hl.bind("SUPER + ALT + Q", hl.dsp.window.move({ workspace = "+0" })) -- move to current regular workspace (reset lol)
hl.bind("SUPER + S", hl.dsp.workspace.toggle_special("spotify"))
hl.bind("SUPER + ALT + S", hl.dsp.window.move({ workspace = "special:spotify" }))
hl.bind("SUPER + C", hl.dsp.workspace.toggle_special("discord"))
hl.bind("SUPER + ALT + C", hl.dsp.window.move({ workspace = "special:discord" }))
hl.bind("SUPER + W", hl.dsp.workspace.toggle_special("obsidian"))
hl.bind("SUPER + ALT + W", hl.dsp.window.move({ workspace = "special:obsidian" }))

---------------
--- WINDOWS ---
---------------

-- Move window focus
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + left", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + up", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down", hl.dsp.focus({ direction = "down" }))
-- or ijkl
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + I", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "down" }))

-- actions
hl.bind("SUPER + Q", hl.dsp.window.close())                                                                 -- close
hl.bind("SUPER + V", hl.dsp.window.float({ action = "toggle" }))                                            -- toggle float
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })                                        -- drag via LMB
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })                                      -- resize via RMB
hl.bind("SUPER + D", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))                   -- maximize
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))                  -- fullscreen
hl.bind("SUPER + ALT + F", hl.dsp.window.fullscreen_state({ internal = 0, client = 3, action = "toggle" })) -- fake fullscreen
hl.bind("SUPER + P", hl.dsp.window.pin())                                                                   -- pin window

-- layout related
hl.bind("SUPER + SHIFT + J", hl.dsp.layout("swapprev"))                      -- swap previous window
hl.bind("SUPER + SHIFT + L", hl.dsp.layout("swapnext"))                      -- swap next window
hl.bind("SUPER + SHIFT + I", hl.dsp.layout("swapprev"))                      -- swap previous window
hl.bind("SUPER + SHIFT + K", hl.dsp.layout("swapnext"))                      -- swap next window
hl.bind("SUPER + O", hl.dsp.layout("orientationnext"), { repeating = true }) -- toggle orientation
hl.bind("SUPER + minus", hl.dsp.layout("mfact -0.02"), { repeating = true }) -- master window size decrease
hl.bind("SUPER + equal", hl.dsp.layout("mfact +0.02"), { repeating = true }) -- master window size increase

-------------
--- MEDIA ---
-------------

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("swayosd-client --output-volume raise"), { locked = true })  -- raise volume
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("swayosd-client --output-volume lower"), { locked = true })  -- lower volume
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"), { locked = true })   -- toggle mute
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("swayosd-client --input-volume mute-toggle"), { locked = true }) -- toggle mic mute
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })                        -- pause
hl.bind("SUPER + ALT + P", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })                       -- pause via keyboard
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })                         -- play
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })                           -- previous track
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })                               -- next track

------------
--- MISC ---
------------

hl.bind("SUPER + CTRL + ALT + SHIFT + Delete", hl.dsp.exit()) -- exit hyprland
