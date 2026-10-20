return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			-- no-op for parsers that are already installed; runs asynchronously
			require("nvim-treesitter").install({
				"bash",
				"go",
				"hcl",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"query",
				"terraform",
				"vim",
				"vimdoc",
				"yaml",
			})

			-- enable treesitter highlighting + indentation for every filetype
			-- that has a parser installed
			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("treesitter", { clear = true }),
				callback = function(args)
					if pcall(vim.treesitter.start, args.buf) then
						vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end,
			})
		end,
	},
}
