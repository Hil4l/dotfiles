require 'keymaps'
require 'options'
require 'autocmds'

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
    -- require 'plugins.rosepine',
    require 'plugins.minifiles',
    require 'plugins.leap',
    require 'plugins.smear_cursor',
    require 'plugins.treesitter',
    require 'plugins.telescope',
    require 'plugins.harpoon',
    require 'plugins.toggleterm',
    require 'plugins.lsp',
})

vim.cmd('colorscheme mycolorscheme')
