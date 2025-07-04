local X = {
    ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', "Dont copy replaced text", opts = { silent = true } },
}

local function createNMap(mode, key, func, d, opts)
    vim.keymap.set(mode, key, func, { desc = d, opts })
end

local function runMapping(mode, mappings)
    for key, value in pairs(mappings) do
        createNMap(mode, key, value[1], value[2], value[3])
    end
end

runMapping("x", X)
