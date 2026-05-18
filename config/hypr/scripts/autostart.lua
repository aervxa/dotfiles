local workspace = 1

return function()
    hl.exec_cmd("missioncenter", { workspace = workspace, float = true, size = "1088 704", move = "768 64" })
    hl.exec_cmd("imv ~/.face", { workspace = workspace, float = true, size = "256 256", move = "256 448" })
    hl.exec_cmd("kitty -o tab_bar_style=hidden sh -c 'pfetch;read'", { workspace = workspace, float = true, size = "384 192", move = "128 128" })
    hl.exec_cmd("kitty sh -c cava", { workspace = workspace, float = true, size = "1024 192", move = "832 800" })
    hl.exec_cmd("kitty", { workspace = workspace, float = true, size = "512 160", move = "128 832" })
end
