return {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
        local highlight = {
            "IndentBlanklineIndent1",
            "IndentBlanklineIndent2",
            "IndentBlanklineIndent3",
            "IndentBlanklineIndent4",
            "IndentBlanklineIndent5",
            "IndentBlanklineIndent6",
            "IndentBlanklineIndent7",
            "IndentBlanklineIndent8",
        }

        local hooks = require "ibl.hooks"
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "IndentBlanklineIndent1", { fg = "#303030"})
            vim.api.nvim_set_hl(0, "IndentBlanklineIndent2", { fg = "#404040"})
            vim.api.nvim_set_hl(0, "IndentBlanklineIndent3", { fg = "#505050"})
            vim.api.nvim_set_hl(0, "IndentBlanklineIndent4", { fg = "#606060"})
            vim.api.nvim_set_hl(0, "IndentBlanklineIndent5", { fg = "#707070"})
            vim.api.nvim_set_hl(0, "IndentBlanklineIndent6", { fg = "#808080"})
            vim.api.nvim_set_hl(0, "IndentBlanklineIndent7", { fg = "#909090"})
            vim.api.nvim_set_hl(0, "IndentBlanklineIndent8", { fg = "#9a9a9a"})
            vim.api.nvim_set_hl(0, "CurrentIndentHighlight", { fg = "#adffb8"})
        end)

        require('ibl').setup({
            indent = {
                highlight = highlight,
            },
            scope = {
                highlight = "CurrentIndentHighlight"
            }
        })
    end
}
