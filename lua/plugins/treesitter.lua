return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
        ensure_installed = {
            -- low level
            'c', 'go', 'rust',
            -- scripty
            'lua', 'vim', 'vimdoc', 'query',
            -- android
            'java', 'kotlin',
            -- web
            'html', 'css', 'javascript', 'typescirpt'
        },
        highlight = { enable = true },
        indent = { enable = true },
        rainbow = {
            enable = true,
            extended_mode = true,
            max_file_lines = nil,
        }
    }
}
