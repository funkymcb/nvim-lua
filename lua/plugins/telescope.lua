return {
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			local builtin = require('telescope.builtin')
			vim.keymap.set("n", "<leader>fg", builtin.live_grep)
			vim.keymap.set("n", "<leader>fs", builtin.grep_string)
			vim.keymap.set("n", "<leader>ff", builtin.find_files)
			vim.keymap.set("n", "<leader>fm", builtin.marks)
			vim.keymap.set("n", "<leader>fb", builtin.buffers)

			local actions = require("telescope.actions")
			require("telescope").setup({
				defaults = {
					color_devicons = true,

					mappings = {
						i = {
							["<Tab>"] = actions.file_split, -- workaround for <c-i>
							["<C-s>"] = actions.file_vsplit,
						},
					},
				},
			})
		end,
	}
}
