return {
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = { "BufReadPost", "BufNewFile" },
		cmd = "TodoTelescope",
		opts = {},
		keys = {
			{
				"<leader>ft",
				"<cmd>TodoTelescope<cr>",
				desc = "Todo Telescope",
			},
		},
	},
}
