return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup {
      keymaps = {
        ["<C-h>"] = false,
        ["<M-h>"] = "actions.select_split",
      },
      columns = { "icon" },
      default_file_explorer = true,
      view_options = {
        show_hidden = true,
      },
    }
    -- Open parent director in current window
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    -- Open directory in floating window
    vim.keymap.set("n", "<space>-", require("oil").toggle_float)
  end,
}
