require 'keymaps'
require 'options'
-- require 'autocmds'

-- Lazy install/setup
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
    if vim.v.shell_error ~= 0 then
        error('Error cloning lazy.nvim:\n' .. out)
    end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	require 'plugins/minifiles',
	require 'plugins/treesitter',
	require 'plugins/toggleterm',
	require 'plugins/lsp',
})

-- colorscheme
vim.cmd('colorscheme mycolorscheme')

-- blink on yank
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({
            timeout=200,
        })
    end,
})
