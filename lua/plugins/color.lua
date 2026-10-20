return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
				integrations = {
					gitsigns = true,
					telescope = {
						enabled = true,
					},
					lualine = true,
				},
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
