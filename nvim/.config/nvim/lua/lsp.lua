-- ===========================
-- C++ (clangd)
-- ===========================
vim.lsp.config["clangd"] = {
    cmd = {
        "clangd-20",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
    }
}
vim.lsp.enable("clangd")

-- ===========================
-- Python (pyrefly)
-- ===========================
-- TODO

-- ===========================
-- OCaml (ocamllsp)
-- ===========================
vim.lsp.config["ocamllsp"] = {}
vim.lsp.enable("ocamllsp")


-- ===========================
-- Functionalities
-- ===========================
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        -- keymaps
        local opts = { buffer = args.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

        -- format on save
        local client =vim.lsp.get_client_by_id(args.data.client_id)
        if client:supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd("BufWritePre", {
                callback = function()
                    vim.lsp.buf.format({bufnr=args.buf})
                end,
            })
        end
    end,
})

vim.diagnostic.config({
    -- display text on screen
    virtual_text = { prefix = "●", spacing = 2 },
    signs = true,           -- signs in the sign column
    underline = false,       -- underline problematic text
    update_in_insert = false, -- update when entering insert mode
})
