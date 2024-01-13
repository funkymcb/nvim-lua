return {
	"rest-nvim/rest.nvim",
	dependencies = { { "nvim-lua/plenary.nvim" } },
	config = function()
		require("rest-nvim").setup({
			result_split_horizontal = true,
		})
		vim.keymap.set("n", "<space>rx", "<Plug>RestNvim<CR>", {})
		vim.keymap.set("n", "<space>rp", "<Plug>RestNvimPreview<CR>", {})
	end,
}
