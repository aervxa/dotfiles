local enabled = false

local function apply(settings)
    hl.config({
        animations = {
            enabled = settings.animations_enabled,
        },
        decoration = {
            fullscreen_opacity = settings.fullscreen_opacity,
            rounding = settings.rounding,
            shadow = {
                enabled = settings.shadow_enabled,
            },
            blur = {
                enabled = settings.blur_enabled,
            },
        },
        general = {
            gaps_in = settings.gaps_in,
            gaps_out = settings.gaps_out,
            border_size = settings.border_size,
        },
    })

    hl.animation({
        leaf = "borderangle",
        enabled = settings.borderangle_enabled,
        speed = 24,
        bezier = "liner",
        style = "loop",
    })
end

return function()
    enabled = not enabled

    if enabled then
        apply({
            animations_enabled = false,
            borderangle_enabled = false,
            shadow_enabled = false,
            blur_enabled = false,
            fullscreen_opacity = 1.0,
            gaps_in = 0,
            gaps_out = 0,
            border_size = 1,
            rounding = 0,
        })
        hl.exec_cmd([[hyprctl notify 1 5000 "rgb(40a02b)" "Gamemode [ON]"]])
    else
        apply({
            animations_enabled = true,
            borderangle_enabled = true,
            shadow_enabled = true,
            blur_enabled = true,
            fullscreen_opacity = 1.0,
            gaps_in = 4,
            gaps_out = 8,
            border_size = 2,
            rounding = 8,
        })
        hl.exec_cmd([[hyprctl notify 1 5000 "rgb(d20f39)" "Gamemode [OFF]"]])
    end
end
