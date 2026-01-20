vim.opt.termguicolors = true
vim.opt.colorcolumn = "100"
vim.opt.swapfile = false
vim.opt.mouse = 'a'
-- vim.opt.clipboard = 'unnamedplus' -- use system clipboard
vim.opt.scrolloff = 10

-- line display
vim.opt.nu = true           
vim.opt.relativenumber = true     
vim.opt.wrap = false            -- dont wrap lines
vim.opt.linebreak = true

-- indentation
vim.opt.shiftwidth = 4      -- auto indentation width 
vim.opt.tabstop = 4         -- tab width
vim.opt.expandtab = true    -- convert tabs to spaces
vim.opt.smartindent = true  
vim.opt.autoindent = true

-- search
vim.opt.incsearch = true    -- incremental highlighting
vim.opt.ignorecase = true;  -- case insensitive
vim.opt.smartcase = true;   -- case sensitive if use uppercase

-- split defaults
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.statusline = "%f %l:%c %= %p%%"
