return {
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		keys = {
			{
				"<leader>fg",
				"<cmd>Telescope live_grep<cr>",
				desc = "Telescope live grep"
			},
			{
				"<leader>ff",
				"<cmd>Telescope find_files<cr>",
				desc = "Telescope find files"
			},
			{
				"<leader>fs",
				"<cmd>Telescope grep_string<cr>",
				desc = "Telescope grep string"
			}
		},
		opts = {
			defaults = {
				color_devicons = true,

				mappings = {
					i = {
						["<Tab>"] = "file_split",
						["<C-s>"] = "file_vsplit"
					},
				},
			},
		}

	}
}
