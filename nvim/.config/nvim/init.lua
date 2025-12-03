require('keymaps')
require('options')
require('lsp')
require('plugins')

vim.cmd('colorscheme theme')

vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank({
        timeout = 200,
    }) end,
})
