return {
    -- LSP Configuration
    {
        'neovim/nvim-lspconfig',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },
        config = function()
            -- Set up Mason first
            require('mason').setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })

            -- Set up capabilities for nvim-cmp
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            -- LSP servers to install and configure
            local servers = {
                "bashls",
                "clangd",
                "cmake",
                "cssls",
                "dockerls", 
                "eslint",
                "gopls",
                "html",
                "jsonls",
                "pyright",
                "terraformls",
                "vimls",
                "yamlls",
            }

            -- Set up mason-lspconfig
            local mason_lspconfig = require('mason-lspconfig')
            mason_lspconfig.setup({
                ensure_installed = servers,
                automatic_installation = true,
            })

            -- Function to set up LSP keymaps when LSP attaches to buffer
            local function on_attach(client, bufnr)
                local opts = { buffer = bufnr, silent = true }
                
                -- LSP keymaps
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
                vim.keymap.set('n', '<leader>p', function()
                    vim.lsp.buf.format({ async = true })
                end, opts)
                vim.keymap.set('n', '<leader>d', vim.lsp.buf.code_action, opts)
                vim.keymap.set('v', '<leader>d', vim.lsp.buf.code_action, opts)
                
                -- Diagnostic keymaps
                vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
                vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
                vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
                vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
            end

            -- Configure diagnostics
            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
                float = {
                    border = 'rounded',
                    source = 'always',
                },
            })

            -- Set up diagnostic signs
            local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end

            -- Set up LSP servers manually for each one
            local lspconfig = require('lspconfig')
            
            -- Default setup for most servers
            local default_setup = {
                capabilities = capabilities,
                on_attach = on_attach,
            }
            
            -- Configure each server
            for _, server_name in ipairs(servers) do
                if server_name == 'pyright' then
                    lspconfig.pyright.setup({
                        capabilities = capabilities,
                        on_attach = on_attach,
                        settings = {
                            python = {
                                analysis = {
                                    autoSearchPaths = true,
                                    diagnosticMode = "workspace",
                                    useLibraryCodeForTypes = true,
                                },
                            },
                        },
                    })
                else
                    lspconfig[server_name].setup(default_setup)
                end
            end
            
            -- Set up lua_ls if not in the servers list
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT',
                        },
                        diagnostics = {
                            globals = { 'vim' },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })
        end,
    },

    -- Mason UI
    {
        'williamboman/mason.nvim',
        cmd = 'Mason',
        build = ':MasonUpdate',
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜", 
                    package_uninstalled = "✗"
                }
            }
        },
    },
}
