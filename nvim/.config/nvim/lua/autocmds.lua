-- LSP functionalities
local autocmd = vim.api.nvim_create_autocmd
autocmd('LspAttach', {
    desc= 'Lsp keymaps',
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
            autocmd('BufWritePre', {
                desc = 'Format on save',
                buffer = args.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                end,
            })
        end

    end,
})


