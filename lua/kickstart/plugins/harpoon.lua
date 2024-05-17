return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()
        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end
        
            require("telescope.pickers").new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths,
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
            }):find()
        end
        
        vim.keymap.set("n", "<leader>je", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })

        vim.keymap.set("n", "<leader>ja", function() harpoon:list():add() end, { desc = "Harpoon a file" })
        vim.keymap.set("n", "<leader>jr", function() harpoon:list():remove() end, { desc = "Release a file" })
--        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Show the loot" })
--
        vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = "Toggle to prev buffer"})
        vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, { desc = "Toggle to next buffer"})
    end,
}
