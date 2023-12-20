return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim'
    },
    config = function()
        local lsp_zero = require('lsp-zero')

        lsp_zero.on_attach(function(client, bufnr)
            lsp_zero.default_keymaps({ buffer = bufnr })
            lsp_zero.buffer_autoformat()

            local opts = { buffer = bufnr, remap = false }

            vim.keymap.set('n', '<space>d', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', '<space>gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', '<space>gi', vim.lsp.buf.implementation, opts)
            vim.keymap.set('n', '<space>n', vim.diagnostic.goto_next, opts)
            vim.keymap.set('n', '<space>p', vim.diagnostic.goto_prev, opts)
        end)

        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = { 'lua_ls', 'yamlls', 'tsserver', 'terraformls' },
            automatic_installation = true
        })

        require('mason-lspconfig').setup_handlers {
            lsp_zero.default_setup,

            function(server_name)
                require('lspconfig')[server_name].setup({})
            end,

            ['lua_ls'] = function()
                -- lua
                require('lspconfig').lua_ls.setup({
                    on_init = function(client)
                        local path = client.workspace_folders[1].name
                        if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                            client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
                                Lua = {
                                    runtime = {
                                        -- Tell the language server which version of Lua you're using
                                        -- (most likely LuaJIT in the case of Neovim)
                                        version = 'LuaJIT'
                                    },
                                    -- Make the server aware of Neovim runtime files
                                    workspace = {
                                        checkThirdParty = false,
                                        library = {
                                            vim.env.VIMRUNTIME
                                            -- "${3rd}/luv/library"
                                            -- "${3rd}/busted/library",
                                        }
                                        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                                        -- library = vim.api.nvim_get_runtime_file("", true)
                                    }
                                }
                            })

                            client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
                        end
                        return true
                    end
                })
            end,

            ['yamlls'] = function()
                -- yaml
                lsp_zero.configure('yamlls', {
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
            end
        }
    end
}
