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
		config = function()
			vim.keymap.set("i", "<C-l>", 'copilot#Accept("<CR>")', {
				expr = true,
				replace_keycodes = false,
			})
			vim.g.copilot_no_tab_map = true

			-- enable copilot for specific filetypes
			vim.g.copilot_filetypes = {
				["*"] = false,
				["lua"] = true,
				["python"] = true,
				["javascript"] = true,
				["typescript"] = true,
				["go"] = true,
				["rust"] = true,
				["java"] = true,
				["c"] = true,
				["cpp"] = true,
			}
		end,
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
