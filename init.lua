vim.g.mapleader = ' '

local function bind(opt, outer_opt)
    outer_opt = outer_opt or {noremap = true}
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force", outer_opts, opts or {})
        vim.keymap.set(op, lhs, rhs, opts)
    end
end

require('configuration.lazy')
require('configuration.options')
require('configuration.mappings')
require('configuration.mappings-insert')
require('configuration.mappings-normal')
require('configuration.mappings-terminal')
require('configuration.mappings-visual')

vim.cmd([[colorscheme catppuccin-mocha]])

vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]

vim.opt.clipboard = 'unnamedplus'
