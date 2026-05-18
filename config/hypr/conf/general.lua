local colors = require("colors")

----------------
--- MONITORS ---
----------------

-- See https://wiki.hypr.land/Configuring/Monitors/
hl.monitor({
    output = "DP-2",
    mode = "1920x1080@180",
    position = "auto",
    scale = "auto",
})

---------------------
--- LOOK AND FEEL ---
---------------------

hl.config({
    -- https://wiki.hypr.land/Configuring/Variables/#general
    general = {
        gaps_in = 4,
        gaps_out = 8,

        border_size = 2,

        -- https://wiki.hypr.land/Configuring/Variables/#variable-types for info about colors
        col = {
            active_border = { colors = { colors.primary, colors.secondary }, angle = 45 },
            inactive_border = colors.outline_variant,
        },

        -- Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "master",
        no_focus_fallback = true,
    },

    -- https://wiki.hypr.land/Configuring/Variables/#decoration
    decoration = {
        rounding = 8,

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = colors.shadow,
        },

        -- https://wiki.hypr.land/Configuring/Variables/#blur
        blur = {
            enabled = true,
            size = 4,
            passes = 3,
            noise = 0.02,
            new_optimizations = true,
            special = true,
            popups = true,
        },
    },

    -- See https://wiki.hypr.land/Configuring/Master-Layout/ for more
    master = {
        new_on_top = true,
    },

    -------------
    --- INPUT ---
    -------------

    -- https://wiki.hypr.land/Configuring/Variables/#input
    input = {
        kb_layout = "us,ara",
        kb_variant = "",
        kb_model = "",
        kb_options = "grp:ralt_rshift_toggle,ctrl:nocaps",
        kb_rules = "",
        accel_profile = "flat",
    },

    misc = {
        key_press_enables_dpms = true,
        focus_on_activate = true,
    },
})
