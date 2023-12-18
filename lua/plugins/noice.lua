return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    config = function()
        require('noice').setup({
            cmdline = {
                view = 'cmdline'
            },
            lsp = {
                signature = {
                    enabled = false
                },
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                }
            },
            presets = {
                bottom_search = true,
            },

        })
        require("telescope").load_extension("noice")
        vim.keymap.set('n', '<leader>fn', ':Noice telescope<CR>')
    end
}
