return {
	{
		"lewis6991/gitsigns.nvim",
		name = "gitsigns",
		lazy = false,
		keys = {
			{
				"<leader>gb",
				"<cmd>Gitsigns blame<cr>",
				desc = "Gitsigns blame",
			}
		},
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
			},
			numhl = true,
			current_line_blame = true,
			current_line_blame_opts = {
				delay = 0,
				virt_text_pos = "right_align",
				virt_text_priority = 1000,
			},
		}
	},
	{
		"kdheepak/lazygit.nvim",
		name = "lazygit",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{
				"<leader>gs",
				"<cmd>LazyGit<cr>",
				desc = "Lazygit open"
			}
		}
	},
}
