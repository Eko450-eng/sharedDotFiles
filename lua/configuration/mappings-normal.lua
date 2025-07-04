local N = {
    -- NOTE: Develop
    ["<leader>p"] = {"<CMD>lua require('snacks').dim.enable()<CR>", "Enable Snacks dim"},
    ["<leader>fm"] = {
        function()
            vim.lsp.buf.format { async = true }
        end,
        "LSP formatting",
    },
    ["<leader>lf"] = {
        function()
            vim.diagnostic.open_float { border = "rounded" }
        end,
        "Floating diagnostic",
    },

    ["<leader>q"] = {
        function()
            vim.diagnostic.setloclist()
        end,
        "Diagnostic setloclist",
    },

    -- Rust Specific
    ["<leader>lt"] = { "<cmd> RustLsp debuggables last<CR>", "Rust debugger" },
    ["<leader>ll"] = { "<cmd> RustLsp runnables last<CR>", "Rust runner" },
    ["<leader>bk"] = { "<cmd> RustLsp codeAction<CR>", "Open Codeactions for Rust" },

    -- All others
    ["<leader>rn"] = {"<CMD>lua vim.lsp.buf.rename()<CR>", "Rename variable"},
    ["<leader>ca"] ={ "<CMD>lua vim.lsp.buf.code_action()<CR>", "Codea actions"},
    ["<leader>gd"] ={ "<CMD>lua vim.lsp.buf.definition()<CR>", "go to definition"},
    ["<leader>gi"] ={ "<CMD>lua vim.lsp.buf.implementation()<CR>", "go to implementation"},
    ["<leader>K"] = { "<CMD>lua vim.lsp.buf.hover()<CR>", "hover code"},
    ["<leader>k"] = {
        function()
            vim.diagnostic.goto_prev()
        end,
        "Previous Error",
    },

    ["<leader>j"] = {
        function()
            vim.diagnostic.goto_next()
        end,
        "Next Error",
    },
    -- ["<leader>gr"] = {} require("telescope.builtin").lsp_references, {})

    -- NOTE: DAP
    ["<leader>dr"] = {
        function()
            require("dapui").toggle()
        end,
        "evaluate selection",
    },
    ["<leader>y"] = { "<cmd> DapStepOut<CR>", "Step Out" },
    ["<leader>i"] = { "<cmd> DapStepInto<CR>", "Step Into" },
    ["<leader>J"] = { "<cmd> DapStepOver<CR>", "Step Over" },
    ["<leader>,"] = { "<cmd> DapNew<CR>", "DapNew" },
    ["<leader>l"] = { "<cmd> DapContinue<CR>", "Continue" },
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint<CR>", "Toggle Breakpoint" },

    -- NOTE: Window and file management
    ["<leader>M"] = { "<cmd>marks<CR>", "Show Marks" },
    ["<leader>z"] = { "<cmd>vsplit<CR>", "Vertical Split" },
    ["<S-Tab>"] = { "<cmd> bnext<CR>", "Next Buffer" },
    ["<Tab>"] = { "<cmd> bprev<CR>", "Previous Buffer" },
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Open NvimTree" },
    -- ["<leader>E"] = { "<cmd> Oil<CR>", "Open Oil" },
    ["<leader>E"] = { "<cmd> Neotree toggle float<CR>", "Open Oil" },
    ["<leader>e"] = { "<cmd> Neotree toggle left<CR>", "Open NvimTree" },
    ["<leader>h"] = { ":bd<CR>", "Kill tab" },
    ["<leader>w"] = { ":q<CR>", "Exit nvim" },
    ["n"] = { "nzzzv", "find next occurrence" },
    ["N"] = { "Nzzzv", "find previous occurrence" },
    ["<leader>fs"] = { "<cmd> :w <CR>", "Save file" },

    -- NOTE: Move window
    ["<C-h>"] = { "<C-w>h", "Window left" },
    ["<C-l>"] = { "<C-w>l", "Window right" },
    ["<C-j>"] = { "<C-w>j", "Window down" },
    ["<C-k>"] = { "<C-w>k", "Window up" },
    
    -- NOTE: Buffer manipulation
    ["<leader>d"] = { '"_d', "delete into void" },
    ["<Esc>"] = { "<cmd> noh <CR>", "Clear highlights" },
    ["<C-s>"] = { "<cmd> w <CR>", "Save file" },
    -- ["<leader>p"] = { "<cmd> :LspRestart <CR>", "Restart LSP" },

    -- NOTE: Commenting
    ["<leader>/"] = { "<cmd> CBccbox<CR>", "Comment Box" },
    ["<leader>sf"] = { "<cmd> Telescope buffers<CR>", "Kill Buffer" },

    -- NOTE: Git
    ["<leader>gg"] = { 
        function()
            require('snacks').lazygit.open()
        end,
        "Open LazyGit" },
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status" },
    -- GitSigns
    ["<leader>rh"] = {
        function()
            require("gitsigns").reset_hunk()
        end,
        "Reset hunk",
    },

    ["<leader>ph"] = {
        function()
            require("gitsigns").preview_hunk()
        end,
        "Preview hunk",
    },

    ["<leader>gb"] = {
        function()
            package.loaded.gitsigns.blame_line()
        end,
        "Blame line",
    },

    ["<leader>td"] = {
        function()
            require("gitsigns").toggle_deleted()
        end,
        "Toggle deleted",
    },
    -- Navigation through hunks
    ["]c"] = {
        function()
            if vim.wo.diff then
                return "]c"
            end
            vim.schedule(function()
                require("gitsigns").next_hunk()
            end)
            return "<Ignore>"
        end,
        "Jump to next hunk",
        opts = { expr = true },
    },

    ["[c"] = {
        function()
            if vim.wo.diff then
                return "[c"
            end
            vim.schedule(function()
                require("gitsigns").prev_hunk()
            end)
            return "<Ignore>"
        end,
        "Jump to prev hunk",
        opts = { expr = true },
    },

    -- NOTE: DB Querying
    ["<leader>df"] = { "<cmd> DBUIFindBuffer<CR>", "Find in Database" },
    ["<leader>dR"] = { "<cmd> DBUIRenameBuffer<CR>", "Rename DB" },
    ["<leader>dl"] = { "<cmd> DBUILastQueryInfo<CR>", "Last query ingo" },

    -- NOTE: Telescope
    ["<leader>P"] = { "<cmd> Telescope project <CR>", "Projects view" },
    ["<C-t>"] = { "<cmd> TodoTelescope <CR>", "View Todos and Comments" },
    ["<leader>B"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
    ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },
    -- ["<leader>ma"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },

    -- NOTE: AI
    ["<M-j>"] = { "<cmd> ChatGPT<CR>", "Toggle ChatGPT" },
    ["<M-k>"] = { "<cmd> ChatGPTCompleteCode<CR>", "ChatGPT CompleteCode" },


    -- NOTE: Terminal
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


    -- NOTE: WhichKey
    ["<leader>KK"] = {
        function()
            vim.cmd "WhichKey"
        end,
        "Which-key all keymaps",
    },
    ["<leader>kk"] = {
        function()
            local input = vim.fn.input "WhichKey: "
            vim.cmd("WhichKey " .. input)
        end,
        "Which-key query lookup",
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
runMapping("n", N)
