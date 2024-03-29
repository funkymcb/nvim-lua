return {
    {
        "nvim-telescope/telescope.nvim",
        name = "telescope",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            function vim.getVisualSelection()
                vim.cmd('noau normal! "vy"')
                local text = vim.fn.getreg("v")
                vim.fn.setreg("v", {})

                text = string.gsub(text, "\n", "")
                if #text > 0 then
                    return text
                else
                    return ""
                end
            end

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>fg", builtin.live_grep)
            vim.keymap.set("n", "<leader>fs", builtin.grep_string)
            vim.keymap.set("n", "<leader>ff", builtin.find_files)
            vim.keymap.set("n", "<leader>fm", builtin.marks)
            vim.keymap.set("n", "<leader>fb", builtin.buffers)
            vim.keymap.set("n", "<leader>fc", builtin.git_commits)

            vim.keymap.set("v", "<leader>cc", function()
                local text = vim.getVisualSelection()
                builtin.live_grep({ default_text = text })
            end, { noremap = true, silent = true })

            local actions = require("telescope.actions")
            require("telescope").setup({
                defaults = {
                    color_devicons = true,

                    mappings = {
                        i = {
                            ["<Tab>"] = actions.file_split, -- workaround for <c-i>
                            ["<C-s>"] = actions.file_vsplit,
                        },
                    },
                },
            })
            require("telescope").load_extension("lazygit")
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
}
