return {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
	keys = {
		{
			"<leader>fg",
			"<cmd>Telescope live_grep<cr>",
			desc = "Telescope live grep",
		},
		{
			"<leader>ff",
			"<cmd>Telescope find_files<cr>",
			desc = "Telescope find files",
		},
		{
			"<leader>fd",
			"<cmd>Telescope lsp_document_symbols<cr>",
			desc = "Telescope find document symbols (eg. functions)",
		},
		{
			"<leader>fs",
			"<cmd>Telescope grep_string<cr>",
			desc = "Telescope grep string",
		},
	},
	opts = {
		defaults = {
			color_devicons = true,

			mappings = {
				i = {
					["<Tab>"] = "file_split",
					["<C-s>"] = "file_vsplit",
				},
			},
		},
	}
}
