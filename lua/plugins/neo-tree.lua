return {
	-- neo-tree
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"s1n7ax/nvim-window-picker",
	},
	opts = {
		close_if_last_window = true,
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
				hide_gitignored = false,
				hide_hidden = false,
			},
			follow_current_file = {
				enabled = true,
			},
		},
		window = {
			width = 30,
			mappings = {
				["i"] = "open_split",
			},
		},
	},
	keys = {
		{
			"<C-f>",
			"<cmd>Neotree toggle<cr>",
			desc = "Neotree toggle"
		}
	}
}
