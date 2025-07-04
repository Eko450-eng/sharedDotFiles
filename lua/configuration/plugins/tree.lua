-- return {
--     "nvim-tree/nvim-tree.lua",
--     cmd = { "NvimTreeToggle", "NvimTreeFocus" },
--     config = function(_, opts)
--         require("nvim-tree").setup {
--             view = {adaptive_size = true},
--             git = {
--                 enable = true,
--             },
--
--             -- Key setting for transparency
--             hijack_netrw = true,
--             hijack_unnamed_buffer_when_opening = false,
--
--             renderer = {
--                 group_empty = true,
--                 highlight_git = true,
--                 icons = {
--                     show = {
--                         git = true,
--                     },
--                 },
--             },
--         }
--     end,
-- }


return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- not strictly required, but recommended
    "nvim-tree/nvim-web-devicons", 
    "MunifTanjim/nui.nvim",
    -- Optional image support in preview window: See `# Preview Mode` for more information
    {"3rd/image.nvim", opts = {}}, 
  },
  lazy = false, -- neo-tree will lazily load itself
  ---@module "neo-tree"
  ---@type neotree.Config?
  opts = {
    -- fill any relevant options here
    group_empty_dirs = true,
  },
  config = function()
      require("neo-tree").setup({
          filesystem = {
              group_empty_dirs = true,
          },
      })
  end
}
