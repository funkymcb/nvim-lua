return {
	{
		"vhyrro/luarocks.nvim",
		priority = 1000,
		config = true,
	},
	{
		"rest-nvim/rest.nvim",
		dependencies = { "luarocks.nvim" },
		ft = "http",
		config = function()
			require("rest-nvim").setup({
				result = {
					split = {
						horizontal = true,
					},
				},
			})
			vim.keymap.set("n", "<space>rx", "<Plug>RestNvim<CR>", {})
			vim.keymap.set("n", "<space>rp", "<Plug>RestNvimPreview<CR>", {})
		end,
	},
}
