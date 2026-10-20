return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				go = { "gofumpt", "goimports" },
				json = { "jq" },
				lua = { "stylua" },
				markdown = { "mdformat" },
				-- templ = {
				-- 	"templ",
				-- 	"injected",
				-- },
				terraform = { "terraform_fmt" },
				tf = { "terraform_fmt" },
				["terraform-vars"] = { "terraform_fmt" },
			},
			format_on_save = {
				timeout_ms = 2000,
				lsp_format = "fallback",
			},
		},
	},
}
