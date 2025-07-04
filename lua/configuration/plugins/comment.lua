return {
    {
        "numToStr/Comment.nvim",
        dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
        config = function()
            require("Comment").setup {
                pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
            }
        end,
    },
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        lazy = true,
        opts = {
          enable_autocmd = false,
          languages = {
            svelte = {
              __default = '<!-- %s -->',
              jsx_element = '{/* %s */}',
              jsx_fragment = '{/* %s */}',
              jsx_attribute = '// %s',
              comment = '// %s',
              typescript = '// %s',
              javascript = '// %s',
            },
          },
        },
    },
}
