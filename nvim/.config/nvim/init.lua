vim.opt.rtp:prepend("~/code/lua/formatter")

require('keymaps')
require('options')
require('plugins')
require('lsp')

vim.cmd('colorscheme custom')
-- vim.cmd('colorscheme functional')

vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function() vim.hl.on_yank() end,
})
