return {
    {
        "rcarriga/nvim-dap-ui",
        name = "dapui",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "mfussenegger/nvim-dap",
            "theHamsta/nvim-dap-virtual-text",
        },
        config = {
            vim.keymap.set("n", "<space>dt", ":DapUiToggle<CR>", { noremap = true }),
            vim.keymap.set("n", "<space>db", ":DapToggleBreakpoint<CR>", { noremap = true }),
            vim.keymap.set("n", "<space>dc", ":DapContinue<CR>", { noremap = true }),
            vim.keymap.set("n", "<space>dr", ':lua require("dapui").open({ reset = true })<CR>', { noremap = true }),
        },
    },
    -- language specific
    {
        "leoluz/nvim-dap-go",
        config = true,
    },
}
