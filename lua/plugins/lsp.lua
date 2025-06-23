return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	dependencies = {
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local lsp_zero = require("lsp-zero")

		---@diagnostic disable-next-line: unused-local
		lsp_zero.on_attach(function(client, bufnr)
			lsp_zero.default_keymaps({ buffer = bufnr })
			lsp_zero.buffer_autoformat()

			local opts = { buffer = bufnr, remap = false }

			vim.keymap.set("n", "<space>d", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "<space>gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "<space>rf", vim.lsp.buf.rename, opts)
			vim.keymap.set("n", "<space>gi", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "<space>n", vim.diagnostic.goto_next, opts)
			vim.keymap.set("n", "<space>p", vim.diagnostic.goto_prev, opts)
		end)

		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "yamlls", "jsonls", "terraformls", "templ" },
			automatic_installation = true,
		})

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		-- rust
		vim.lsp.config("rust_analyzer", {
			require("lspconfig").rust_analyzer.setup({
				check = {
					command = "clippy",
				},
			}),
		})

		vim.lsp.config("yamlls", {
			settings = {
				yaml = {
					schemas = {
						-- kubernetes
						kubernetes = {
							"deployment.yaml",
							"deployment-patch.yaml",
							"patch.yaml",
							"dev-patch.yaml",
							"test-patch.yaml",
							"prod-patch.yaml",
							"cronjob.yaml",
							"cronjob-patch.yaml",
							"ingress.yaml",
							"service.yaml",
							"namespace.yaml",
							"hpa.yaml",
						},
						-- TODO fix this!
						-- ["~/empiriecom/gitlab/empiriecom/core/flux-operator/bootstrap-emp-staging/scripts/crd-schemas"] = {
						--    "/*.yaml",
						--    "/*.yml"
						-- },
						["https://json.schemastore.org/kustomization.json"] = "kustomization.yaml",
						-- github workflows
						["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
						-- azure pipelines
						["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = ".gitlab-ci.yaml",
						["https://dev.azure.com/finorun/_apis/distributedtask/yamlschema"] = {
							"azure-pipelines.yaml, azure-pipelines.yml",
						},
					},
				},
			},
		})
	end,
}
