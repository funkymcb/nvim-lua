return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = {
                -- low level
                'c', 'go', 'rust',
                -- scripty
                'bash', 'lua', 'vim', 'vimdoc', 'query',
                -- rest
                'http', 'json',
                -- android
                'java', 'kotlin',
                -- web
                'html', 'css', 'javascript',
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
        })
    end
}
