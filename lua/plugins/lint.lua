return {
	"https://codeberg.org/mfussenegger/nvim-lint",
	name = "nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			terraform = { "tflint" },
			tf = { "tflint" },
			sh = { "shellcheck" },
			bash = { "shellcheck" },
		}

		-- run linting on save and on entering a buffer
		local lint_group = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
			group = lint_group,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
