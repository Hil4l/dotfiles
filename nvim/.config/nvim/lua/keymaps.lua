-- leader key
vim.g.mapleader = ' '
vim.keymap.set({'n', 'v'}, '<Space>', '<Nop>', {silent=true}) -- disable space default behavior - silent to now show it in cmd' line


-- completion 
-- vim.keymap.set("i", "'", "''<left>")
-- vim.keymap.set("i", "\"", "\"\"<left>")
-- vim.kemap.set("i", "(", "()<left>")
-- vim.keymap.set("i", "{", "{}<left>")
-- vim.keymap.set("i", "[", "[]<left>")

-- stay in indent mode
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- move highlighted lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- center navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- past over word without loosing buffer (put pasted over word in void register)
vim.keymap.set('x', '<leader>p', '"_dP')
vim.keymap.set('n', 'x', '"_x') -- delete without saving to buffer
