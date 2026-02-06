return {
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = false,
		opts = {},
		config = function()
			require("todo-comments").setup()
			require("telescope").load_extension("todo-comments")
		end,
		keys = {
			{
				"<leader>ft",
				"<cmd>TodoTelescope<cr>",
				desc = "Todo Telescope",
			},
		},
	},
}
