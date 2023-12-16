return {
    {
        'lewis6991/gitsigns.nvim',
        name = 'gitsigns',
        opts = {
            signs = {
                add = { text = '+' },
                change = { text = '~' }
            },
            numhl = true,
            current_line_blame = true,
            current_line_blame_opts = {
                delay = 0,
                virt_text_pos = 'right_align'
            }
        }
    },
    {
        'kdheepak/lazygit.nvim',
        name = 'lazygit',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        config = function()
            vim.keymap.set('n', '<leader>gs', ':LazyGit<CR>')
        end
    }
}
