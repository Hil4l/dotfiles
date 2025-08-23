return {
    {
        "mason-org/mason.nvim",
        opts = {}
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            automatic_enable = false -- dont auto call lsp_server.setup()
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            local lspconfig = require("lspconfig")
            local util = require("lspconfig.util")

            lspconfig.clangd.setup({})
            lspconfig.gopls.setup({})
            lspconfig.rust_analyzer.setup({})

            -- LSP functionalities
            local autocmd = vim.api.nvim_create_autocmd
            autocmd('LspAttach', {
                callback = function(args)

                    -- LSP keymaps
                    local opts = { buffer = args.buf }
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

                    -- Autoformat on save
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if not client then return end
                    if client.supports_method('textDocument/formatting', 0) then
                        -- format buffer on save
                        autocmd('BufWritePre', {
                            buffer = args.buf,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                            end,
                        })
                    end

                end,
            })

            -- diagnostics display
            vim.diagnostic.config({
                virtual_text = { -- display text on screen
                    prefix = "●",       -- little bullet before message
                    spacing = 2,        -- space between text and diagnostic
                },
                signs = true,           -- signs in the sign column
                underline = false,       -- underline problematic text
                update_in_insert = false, -- update when entering insert mode
            })

        end
    }
}
