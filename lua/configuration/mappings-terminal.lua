
local T = {
    ["<A-h>"] = {
        function()
            require("nvterm.terminal").toggle "float"
        end,
        "Toggle floating term",
    },

    ["<A-v>"] = {
        function()
            require("nvterm.terminal").toggle "vertical"
        end,
        "Toggle vertical term",
    },
}

local function createNMap(mode, key, func, d, opts)
    vim.keymap.set(mode, key, func, { desc = d, opts })
end

local function runMapping(mode, mappings)
    for key, value in pairs(mappings) do
        createNMap(mode, key, value[1], value[2], value[3])
    end
end
runMapping("t", T)
