return {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {
        bind = true,
        hint_prefix = "💡 ",
        hi_parameter = "LspSignatureActiveCustomParameter",
        transparency = 50,
        handler_opts = {
            border = "rounded",
        },
    },
    config = function(_, opts)
        vim.cmd([[highlight LspSignatureActiveCustomParameter guifg=#31C236 gui=nocombine]])
        require("lsp_signature").setup(opts)
    end,
}
