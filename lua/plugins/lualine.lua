return {
    'nvim-lualine/lualine.nvim',
    opts = {
        options = {
            theme = 'tokyonight',
            disabled_filetypes = {
                statusline = { 'neo-tree' },
                winbar = { 'neo-tree' }
            }
        }
    }
}
