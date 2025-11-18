return {
    'neovim/nvim-lspconfig',
    
    config = function()

        local lspconfig = require("lspconfig")

        -- clangd
        vim.lsp.config["clangd"] = {
            cmd = {
                "clangd",
                "--background-index",
                "--clang-tidy",
                "--header-insertion=iwyu",
                "--completion-style=detailed",
                "--function-arg-placeholders",
                "--fallback-style=llvm",
            }
        }
        vim.lsp.enable("clangd")

        -- ocamllsp

        vim.lsp.config["ocamllsp"] = {}
        vim.lsp.enable("ocamllsp")

        -- LSP keymaps
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(ev)
                local opts = { buffer = ev.buf }
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
            end,
        })

        -- format on save
        vim.api.nvim_create_autocmd("BufWritePre", {
            callback = function()
                vim.lsp.buf.format()
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
