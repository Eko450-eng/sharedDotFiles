return {
    'MeanderingProgrammer/markdown.nvim',
    main = "render-markdown",
    opts = function()
        -- Toggle `- [ ]` and `- [x]` in the current line
        function ToggleCheckbox()
          -- Get the current line
          local line = vim.api.nvim_get_current_line()

          -- Check if it contains `- [ ]` and replace with `- [x]`
          if line:match("%- %[%s%]") then
            line = line:gsub("%- %[%s%]", "- [x]")
          -- Otherwise, check if it contains `- [x]` and replace with `- [ ]`
          elseif line:match("%- %[x%]") then
            line = line:gsub("%- %[x%]", "- [ ]")
          end

          -- Set the updated line
          vim.api.nvim_set_current_line(line)
        end
        vim.api.nvim_set_keymap("n", "<leader>t", ":lua ToggleCheckbox()<CR>", { noremap = true, silent = true })
    end,
    name = "render-markdown",
    dependencies = {'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons'},
}
