return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-path",
		"onsails/lspkind.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
				["<Left>"] = cmp.mapping.abort(),
				["<C-c>"] = cmp.mapping.close(),
				["<C-l>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Insert,
					select = true,
				}),

				-- jump to next placeholder in snippet
				["<C-f>"] = cmp.mapping(function(fallback)
					if require("luasnip").jumpable(1) then
						require("luasnip").jump(1)
					else
						fallback()
					end
				end, { "i", "s" }),
				-- jump to previous placeholder in snippet
				["<C-b>"] = cmp.mapping(function(fallback)
					if require("luasnip").jumpable(-1) then
						require("luasnip").jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "nvim_lsp_signature_help" },
				{ name = "luasnip" },
				{ name = "path" },
				{ name = "buffer", option = { keyword_length = 3 } },
			}),
			window = {
				completion = {
					border = "rounded",
					windowhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
				},
				documentation = {
					border = "rounded",
					windowhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
				},
			},
			formatting = {
				format = lspkind.cmp_format(),
			},
		})
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})

		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
