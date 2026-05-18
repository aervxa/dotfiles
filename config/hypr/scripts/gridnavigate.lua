local grid_targets = {
    left = function(workspace)
        if workspace > 1 then
            return workspace - 1
        end
        return workspace
    end,
    right = function(workspace)
        if workspace < 9 then
            return workspace + 1
        end
        return workspace
    end,
    top = function(workspace)
        if workspace > 3 then
            return workspace - 3
        end
        return workspace
    end,
    bottom = function(workspace)
        if workspace <= 6 then
            return workspace + 3
        end
        return workspace
    end,
}

local function grid_animation_style(side)
    if side == "top" or side == "bottom" then
        return "slidevert"
    end
    return "slide"
end

return function(side, move_active_window)
    return function()
        local workspace = hl.get_active_workspace()
        if not workspace or not workspace.id then
            return
        end

        local target_for = grid_targets[side]
        if not target_for then
            return
        end

        local target = target_for(workspace.id)

        hl.animation({
            leaf = "workspaces",
            enabled = true,
            speed = 5,
            bezier = "overshot",
            style = grid_animation_style(side),
        })

        if move_active_window then
            hl.dispatch(hl.dsp.window.move({ workspace = target }))
        else
            hl.dispatch(hl.dsp.focus({ workspace = target }))
        end
    end
end
