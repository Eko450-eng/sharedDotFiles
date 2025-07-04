return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    animate = {enabled = true},
    bigfile = { enabled = true },
    bufdelete = { enabled = false },
    dashboard = { 
        preset = {
            keys = {
                  { icon = " ", key = "f", desc = "Find the File", action = ":lua Snacks.dashboard.pick('files')" },
                  { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                  { icon = " ", key = "b", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                  { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                  { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                  { icon = " ", key = "s", desc = "Restore Session", action = "<cmd>SessionRestore<CR>" },
                  { icon = " ", key = "p", desc = "Projects", action = "<cmd>Telescope project<CR>" },
                  { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
                  { icon = " ", key = "q", desc = "Quit", action = ":qa" },
            },
            header = [[
                           ▓█████  ██ ▄█▀ ▒█████                 
                           ▓█   ▀  ██▄█▒ ▒██▒  ██▒               
                           ▒███   ▓███▄░ ▒██░  ██▒               
                           ▒▓█  ▄ ▓██ █▄ ▒██   ██░               
                           ░▒████▒▒██▒ █▄░ ████▓▒░               
                           ░░ ▒░ ░▒ ▒▒ ▓▒░ ▒░▒░▒░                
                            ░ ░  ░░ ░▒ ▒░  ░ ▒ ▒░                
                              ░   ░ ░░ ░ ░ ░ ░ ▒                 
                              ░  ░░  ░       ░ ░                 
            ]]
        }
    },
    debug = { enabled = true },
    dim = { 
        enabled = true 
    },
    gitbrowse = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    lazygit = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = false },
    words = { enabled = true },
  },
}
