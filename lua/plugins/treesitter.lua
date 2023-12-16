return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
        ensure_installed = { 'c', 'go', 'lua', 'rust', 'vim', 'vimdoc', 'query' },
        highlight = { enable = true },
        indent = { enable = true },
        rainbow = {
            enable = true,
            extended_mode = true,
            max_file_lines = nil,
        }
    }
}
