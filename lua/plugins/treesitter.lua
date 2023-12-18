return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
        ensure_installed = {
            -- low level
            'c', 'go', 'rust',
            -- scripty
            'bash', 'lua', 'vim', 'vimdoc', 'query',
            -- android
            'java', 'kotlin',
            -- web
            'html', 'css', 'javascript', 'typescirpt',
            -- devops
            'terraform', 'yaml'
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
