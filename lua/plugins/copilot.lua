return {
	{
		"github/copilot.vim",
		name = "copilot",
		lazy = false,
		keys = {
			{
				"<leader>cp",
				":Copilot panel<CR>",
				desc = "Open Copilot Panel",
			},
		},
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken",
		-- toggle chat on leader cc
		keys = {
			{
				"<leader>cc",
				":CopilotChat<CR>",
				desc = "Open Copilot Chat",
			},
		},
	},
}
