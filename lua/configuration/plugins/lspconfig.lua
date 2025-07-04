return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
        config = function(_, opts)
            require("mason").setup({})
            opts.ensure_installed = opts.ensure_installed or {}
            vim.list_extend(opts.ensure_installed, { 
                "kotlin_language_server",
                "jdtls",
                "nil",
                "svelte",
                "css-lsp",
                "html-lsp",
                "lua-language-server",
                "rust-analyzer",
                "typescript-language-server",
                "svelte-language-server",
                "slint-lsp",
                "zls",
                "clangd",
                "codelldb",
                "gopls",
                "biome"
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

            lspconfig.clangd.setup({})
            lspconfig.kotlin_language_server.setup({})
            lspconfig.rust_analyzer.setup({})
            lspconfig.gopls.setup({})
            
            lspconfig.nil_ls.setup({
                on_attach = function(client, bufnr)
                    client.server_capabilities.documentFormattingProvider = true
                end,
                settings = {
                     ["nil"] = {
                        formatting = {
                            command = {"nixpkgs-fmt"}
                        }
                    }
                }
            }) 

            lspconfig.slint_lsp.setup{}
            lspconfig.svelte.setup({}) 

            vim.filetype.add({
              extension = {
                svelte = "svelte",
              },
              filename = {},
              pattern = {},
            })

            -- lspconfig.zls.setup({
            --     filetypes = { 'zig', 'zig.zon', 'zon' },
            --     settings = {
            --         zig = {
            --           known_folders = {
            --             vim.fn.expand('${HOME}/.cache/zig/p/')
            --           },
            --           global_cache_path = vim.fn.system('zig env cache-dir'):gsub('\n', '')
            --         }
            --       }
            -- })
            lspconfig.zls.setup({
              settings = {
                zls = {
                  enable_autofix = false,
                  enable_inlay_hints = true,
                  inlay_hints_show_builtin = true,
                  inlay_hints_exclude_single_argument = true,
                  inlay_hints_hide_redundant_param_names = false,
                  inlay_hints_hide_redundant_param_names_last_token = false,
                  warn_style = true,
                  highlight_global_var_declarations = true,
                },
              },
            })

            lspconfig.ts_ls.setup({
                on_attach = function(client)
                    client.server_capabilities.documentFormattingProvider = false
                end,
                filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'svete'},
            })


            lspconfig.biome.setup({})
        end
    },
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                ["javascript"] = { "biome" },
                ["javascriptreact"] = { "biome" },
                ["typescript"] = { "biome" },
                ["typescriptreact"] = { "biome" },
                ["json"] = { "biome" },
                ["svelte"] = { "biome" },
            },
            formatters = {
                biome = {
                    command = "biome",
                    args = { "format", "--write", "--stdin-file-path", "$FILENAME" },
                    stdin = true,
                }
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true
            }
        }
    },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ['<Tab>'] = cmp.mapping.select_next_item(),
                    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                    ['<C-o>'] = cmp.mapping.open_docs(),
                }),

                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },

                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }, {
                    { name = "buffer" },
                }
                ),
            })
        end
    }
}
