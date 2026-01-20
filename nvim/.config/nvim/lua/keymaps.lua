local keymap = vim.keymap.set

vim.g.mapleader = ' '

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
keymap('n', 'n', 'nzz')
keymap('n', 'N', 'Nzz')

-- keep buffer when paste over / delete ( put in void register)
keymap('x', '<leader>p', '"_dP')
keymap('n', 'x', '"_x')

-- buffer nav
keymap('n', '<leader>bn', '<Cmd>bnext<CR>')
keymap('n', '<leader>bp', '<Cmd>bprevious<CR>')

-- quickfix nav
keymap("n", "<C-j>", "<cmd>cnext<CR>zz")
keymap("n", "<C-k>", "<cmd>cprev<CR>zz")
