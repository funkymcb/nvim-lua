return {
    {
        -- tokyo
        'folke/tokyonight.nvim',
        name = 'tokyo',
        config = function()
            vim.cmd.colorscheme 'tokyonight-storm'
        end
    },
    {
        "xiyaowong/transparent.nvim",
        config = function()
            require('transparent').setup({})
            require('transparent').clear_prefix('NeoTree')
        end,
    }
}
