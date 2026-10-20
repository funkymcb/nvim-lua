return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = function()
			local C = require("catppuccin.palettes").get_palette("mocha")
			local transparent_bg = "NONE"

			local theme = {
				normal = {
					a = { bg = C.lavender, fg = C.mantle, gui = "bold" },
					b = { bg = C.surface0, fg = C.lavender },
					c = { bg = transparent_bg, fg = C.text },
				},
				insert = {
					a = { bg = C.green, fg = C.base, gui = "bold" },
					b = { bg = C.surface0, fg = C.green },
				},
				terminal = {
					a = { bg = C.green, fg = C.base, gui = "bold" },
					b = { bg = C.surface0, fg = C.green },
				},
				command = {
					a = { bg = C.peach, fg = C.base, gui = "bold" },
					b = { bg = C.surface0, fg = C.peach },
				},
				visual = {
					a = { bg = C.mauve, fg = C.base, gui = "bold" },
					b = { bg = C.surface0, fg = C.mauve },
				},
				replace = {
					a = { bg = C.red, fg = C.base, gui = "bold" },
					b = { bg = C.surface0, fg = C.red },
				},
				inactive = {
					a = { bg = transparent_bg, fg = C.lavender },
					b = { bg = transparent_bg, fg = C.surface1, gui = "bold" },
					c = { bg = transparent_bg, fg = C.overlay0 },
				},
			}

			return {
				options = {
					theme = theme,
				},
			}
		end,
	},
}
