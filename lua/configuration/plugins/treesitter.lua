return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        -- "svelte",
        -- "typescript",
        -- "javascript",
        -- "html",
        -- "css",
      })

      -- Ensure highlighting is enabled by default
      -- opts.highlight = {
      --   enable = true,
      --   additional_vim_regex_highlighting = false,
      -- }

      -- Ensure proper Svelte context detection
      opts.indent = {
        enable = true,
      }
    end,
    -- config = function(_, opts)
    --   require("nvim-treesitter.configs").setup(opts)
    --   -- Create an autocommand group for Svelte
    --   -- local svelte_group = vim.api.nvim_create_augroup("SvelteAutocmds", { clear = true })
    --   
    --   -- Auto-enable TreeSitter highlighting for Svelte files
    --   -- vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    --   --   group = svelte_group,
    --   --   pattern = "*.svelte",
    --   --   callback = function()
    --   --     vim.cmd("TSBufEnable highlight")
    --   --     -- Ensure proper filetype is set
    --   --     vim.bo.filetype = "svelte"
    --   --   end,
    --   -- })
    -- end,
  }
}
