
local V = {
    ["K"] = { ":m'<-2<CR>gv=gv", "move selection up" },
    ["J"] = { ":m'>+1<CR>gv=gv", "move selection down" },
    ["("] = { "c()<C-c>P", "surround with '()'" },
    ["{"] = { "c{}<C-c>P", "surround with '{}'" },
    ["["] = { "c[]<C-c>P", "surround with '[]'" },
    ["'"] = { "c''<C-c>P", "surround with single quotes" },
    ['"'] = { 'c""<C-c>P", "surround with double quotes' },
    ["`"] = { 'c``<C-c>P", "surround with tacks' },
    ["<leader>d"] = { '"_d', "delete into void" },
    ["<leader>p"] = { '"_p', "paste and delete previous into void" },
    ["<"] = { "<gv", "Indent line" },
    [">"] = { ">gv", "Indent line" },

    ["<leader>ca"] = {
        function()
            vim.lsp.buf.code_action()
        end,
        "LSP code action",
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

runMapping("v", V)
