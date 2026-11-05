return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "lua_ls", "terraformls", "yamlls" },
			-- already run via nvim-lint / conform
			automatic_enable = { exclude = { "tflint", "stylua" } },
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
}
