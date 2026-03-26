vim.opt.rtp:prepend("~/code/lua/formatter") -- cust. formatter

vim.cmd('colorscheme custom')

vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function() vim.hl.on_yank() end,
})

-- ╔══════════════════════════════════════════════════════════════════════════╗
-- ║  OPTIONS                                                                 ║
-- ╚══════════════════════════════════════════════════════════════════════════╝
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
vim.opt.shiftwidth = 2      -- auto indentation width 
vim.opt.tabstop = 2         -- tab width
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


-- ╔══════════════════════════════════════════════════════════════════════════╗
-- ║  KEYMAPS                                                                 ║
-- ╚══════════════════════════════════════════════════════════════════════════╝
vim.g.mapleader = ' '
local keymap = vim.keymap.set

keymap({'n', 'v'}, '<Space>', '<Nop>', {silent = true}) 
keymap('n', '<leader>rc', '<Cmd>e ~/.config/nvim/init.lua<CR>')
keymap('t', '<esc><esc>', '<c-\\><c-n>', { desc = "Escape terminal mode." })
keymap({ "v", "x", "n" }, "<C-y>", '"+y', { desc = "System clipboard yank." })

-- indent and reselect 
keymap('v', '<', '<gv')
keymap('v', '>', '>gv')

-- move highlighted lines
keymap('v', 'J', ":m '>+1<CR>gv=gv")
keymap('v', 'K', ":m '<-2<CR>gv=gv")

-- center buf nav
keymap('n', '<C-d>', '<C-d>zz')
keymap('n', '<C-u>', '<C-u>zz')

-- x delete in void register (keep buffer)
keymap('x', '<leader>p', '"_dP')
keymap('n', 'x', '"_x')

-- quickfix nav
keymap("n", "<C-j>", "<cmd>cnext<CR>zz")
keymap("n", "<C-k>", "<cmd>cprev<CR>zz")


-- ╔══════════════════════════════════════════════════════════════════════════╗
-- ║  LSP                                                                     ║
-- ╚══════════════════════════════════════════════════════════════════════════╝

-- ═════ Clients ════════════════════
vim.lsp.config['pyrefly'] = {
    cmd = { "pyrefly", "lsp"},
    filetypes = { 'python' },
    root_markers = { 'pyproject.toml', '.git' },
}

vim.lsp.config['clangd'] = {
    cmd = { "clangd", "--background-index", "--clang-tidy", "--query-driver=/usr/bin/clang++-20" },
    filetypes = { 'cpp', 'c' },
    root_markers = { { '.clang-format', 'Makefile', 'build.sh' }, '.git' },
}

vim.lsp.config['ocamllsp'] = {
    cmd = { "ocamllsp" },
    filetypes = { 'ocaml' },
    root_markers = { { 'dune-project', 'Makefile' }, '.git' },
}

vim.lsp.config['tinymist'] = {
    cmd = { "tinymist" },
    filetypes = { 'typst' },
    settings = {
        formatterMode = "typstyle", -- or "typstfmt"
        formatterIndentSize = 4,   -- indentation width
    }
}

vim.lsp.enable({'clangd', 'pyrefly', 'ocamllsp', 'tinymist'})

-- ═════ Settings ════════════════════
vim.api.nvim_create_user_command("LspStatuts",
    function() vim.cmd("checkhealth vim.lsp") end, {}
)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method('textDocument/definition') then
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = args.buf })
    end
    -- if client:supports_method('textDocument/format') then
    --     vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, { buffer = args.buf })
    -- end
  end
})

vim.diagnostic.config({
    virtual_text = true,       -- no text
    signs = true,               -- signs in the sign column
    underline = true,           -- underline 
    update_in_insert = false,   
})


-- ╔══════════════════════════════════════════════════════════════════════════╗
-- ║  PLUGINS                                                                 ║
-- ╚══════════════════════════════════════════════════════════════════════════╝
local gh = function(x) return 'https://github.com/' .. x end
vim.pack.add {
    gh('nvim-mini/mini.files'),
    gh('ibhagwan/fzf-lua'),
    gh('nvim-tree/nvim-web-devicons'),
    gh('nvim-treesitter/nvim-treesitter'),
    gh('akinsho/toggleterm.nvim'),
}

-- ═════ cust. formatter ════════════════════
require("formatter").setup({
  cpp    = "clang-format-20",
  c      = "clang-format-20",
  ocaml  = "ocamlformat --impl -",
  python = "black -q -",
})
vim.keymap.set("n", "<leader>fm", "<Cmd>Format<CR>")

-- ═════ mini.files ════════════════════
require('mini.files').setup{
    mappings = { 
        go_in = 'L', go_in_plus = 'l',
        go_out = 'H', go_out_plus = 'h',
        synchronize = '<CR>'
    },
}
vim.keymap.set("n", "<leader>e",
    function() require("mini.files").open(vim.api.nvim_buf_get_name(0), true) end
)

-- ═════ toggleterm ════════════════════
require('toggleterm').setup{ open_mapping = [[<c-\>]], size = 17, direction = 'horizontal' }

-- ═════ fzflua ════════════════════
require("fzf-lua").setup{
    defaults = { previewer = false },
    winopts = { height = 0.50, width = 0.50 },
}
vim.keymap.set("n", "<leader>ff", "<Cmd>FzfLua files<CR>")
vim.keymap.set("n", "<leader>fg", "<Cmd>FzfLua grep_curbuf<CR>")
require("fzf-lua").register_ui_select()

-- ═════ treesitter ════════════════════
require('nvim-treesitter.configs').setup{
    lazy = false, auto_install = false, build = ':TSUpdate',
    highlight = { enable = true }
}
