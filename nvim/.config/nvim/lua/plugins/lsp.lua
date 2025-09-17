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

            lspconfig.clangd.setup({
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--header-insertion=iwyu",
                    "--completion-style=detailed",
                    "--function-arg-placeholders",
                    "--fallback-style=LLVM",
                }
            })
            lspconfig.ruff.setup({})
            lspconfig.gopls.setup({})
            lspconfig.rust_analyzer.setup({})
            -- lspconfig.ocamllsp.setup({})



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
