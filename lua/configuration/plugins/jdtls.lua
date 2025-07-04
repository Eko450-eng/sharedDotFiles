return {
    "mfussenegger/nvim-jdtls",
    config = function()
        vim.api.nvim_create_autocmd("FileType", {
          pattern = "java",
          callback = function()
            local jdtls = require("jdtls")
            local home = os.getenv("HOME")
            local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

            jdtls.start_or_attach({
              cmd = { "jdtls" },
              root_dir = require("jdtls.setup").find_root({ '.git', 'mvnw', 'gradlew' }),
              workspace_folder = workspace_folder,
              settings = { java = {} },
            })
          end,
        })
    end
}
