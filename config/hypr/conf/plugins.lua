local colors = require("colors")

hl.config({
    plugin = {
        hyprexpo = {
            columns = 3,
            gap_size = 8,
            bg_col = colors.background,
            workspace_method = "first 1",
        },
    },
})
