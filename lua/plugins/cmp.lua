return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    config = function()
        local cmp = require("cmp")
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

				-- FIX: fix jump forward (cmp_action came from lsp-zero)
                -- navigate between luasnip placeholder
                -- ["<C-f>"] = cmp_action.luasnip_jump_forward(),
                -- ["<C-b>"] = cmp_action.luasnip_jump_backward(),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
				{ name = 'nvim_lsp_signature_help' },
                { name = "luasnip" },
                { name = "path" },
                { name = "buffer",  option = { keyword_lenth = 3 } },
            }),
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
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

