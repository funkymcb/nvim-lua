return {
	"L3MON4D3/LuaSnip",
	build = "make install_jsregexp",
	config = function()
		require("luasnip.loaders.from_vscode").lazy_load()
	end,
	dependencies = {
		"rafamadriz/friendly-snippets",
		"saadparwaiz1/cmp_luasnip",
	},
}
