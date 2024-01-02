return {
	"epwalsh/obsidian.nvim",
	config = true,
	opts = {
		templates = {
			subdir = "Hacking/templates",
			date_format = "%d.%m.%Y",
			time_format = "%H:%M",
		},
		workspaces = {
			{
				name = "42",
				path = "~/Hacking/github/funkymcb/42",
			},
		},
	},
}
