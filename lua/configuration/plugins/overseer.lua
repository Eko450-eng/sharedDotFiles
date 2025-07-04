return {
    "stevearc/overseer.nvim",
    config = function()
        require("overseer").setup()
        vim.keymap.set("n", "<leader>b", function()
          require("overseer").run_template({ name = "Gradle Build" })
        end)
    end
}   
