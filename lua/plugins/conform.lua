return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "gofumpt", "goimports" },
				markdown = { "mdformat" },
				templ = {
					"templ",
					"injected",
				},
			},
			format_on_save = {
				timeout_ms = 2000,
				lsp_format = "fallback",
			},
		},
	},
}
