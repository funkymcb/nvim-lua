local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.ensure_installed({
  'eslint',
  'gopls',
  'marksman',
  'rust_analyzer',
  'sumneko_lua',
  'tsserver',
  'yamlls',
})

-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

-- yaml
lsp.configure('yamlls', {
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
               "hpa.yaml"
            },
            ["http://json.schemastore.org/kustomization"] = "kustomization.yaml",
            -- github workflows
            ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
            -- azure pipelines
            ["https://dev.azure.com/finorun/_apis/distributedtask/yamlschema"] = {
               "azure-pipelines.yaml, azure-pipelines.yml"
            },
         },
      },
   },
})

lsp.on_attach(function(client, bufnr)
   local opts = {buffer = bufnr, remap = false}

   vim.keymap.set('n', '<space>d', vim.lsp.buf.hover, bufopts)
   vim.keymap.set('n', '<space>gd', vim.lsp.buf.definition, bufopts)
   vim.keymap.set('n', '<space>gi', vim.lsp.buf.implementation, bufopts)
   vim.keymap.set('n', '<space>n', vim.diagnostic.goto_next, opts)
   vim.keymap.set('n', '<space>p', vim.diagnostic.goto_prev, opts)

   -- -- Use LSP as the handler for formatexpr.
   -- --    See `:help formatexpr` for more information.
   -- vim.api.nvim_buf_set_option(bufnr, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')
end)

lsp.setup()

vim.diagnostic.config({
   virtual_text = true,
})

-- golang
-- gofmt and goimport on save
require("go").setup()
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)
