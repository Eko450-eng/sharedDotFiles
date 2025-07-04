local I = {
    -- go to  beginning and end
    ["<C-b>"] = { "<ESC>^i", "Beginning of line" },
    ["<C-e>"] = { "<End>", "End of line" },
    ["<C-j>"] = {
      function()
        local ls = require("luasnip")
        if ls.jumpable(1) then
          ls.jump(1)
        end
      end,
      "Jump to next snippet placeholder"
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

runMapping("i", I)
