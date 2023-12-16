return {
    'nvim-lualine/lualine.nvim',
    opts = {
        options = {
            theme = 'tokyonight',
            -- section_separators = '', -- workaround for missing intro on startup
            disabled_filetypes = {
                statusline = { 'neo-tree' },
                winbar = { 'neo-tree' }
            }
        }
    }
}
