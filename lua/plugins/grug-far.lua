return {
	{
		"MagicDuck/grug-far.nvim",
		cmd = "GrugFar",
		opts = {},
		keys = {
			{
				"<leader>sr",
				function()
					-- literal (non-regex) search that may span multiple lines
					require("grug-far").open({
						prefills = { flags = "--fixed-strings --multiline" },
					})
				end,
				desc = "Search and replace (multiline, literal) in cwd",
			},
		},
	},
}
