require('keymaps')
require('options')
require('plugins')

vim.cmd('colorscheme custom')

vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function() vim.hl.on_yank() end,
})

vim.diagnostic.config({
    virtual_text = { prefix = "●", spacing = 2 }, -- text
    signs = true,           -- signs in the sign column
    underline = false,       -- underline problematic text
    update_in_insert = false, -- update when entering insert mode
})

-- general format on save (through lsp else nothing)
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client:supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd("BufWritePre", {
                callback = function() vim.lsp.buf.format({bufnr=args.buf}) end,
            })
        end
    end,
})
