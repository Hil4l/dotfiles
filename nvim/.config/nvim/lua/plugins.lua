vim.pack.add {
	'https://github.com/stevearc/oil.nvim',
	'https://github.com/nvim-mini/mini.pick',
	'https://github.com/nvim-tree/nvim-web-devicons',
	'https://github.com/akinsho/toggleterm.nvim',
	'https://github.com/neovim/nvim-lspconfig',
}

-- ========== mini files ==========
require("oil").setup({
	columns = {"icon"},
  view_options = {show_hidden = false},
}) 
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>")

-- ========== mini pick ==========
require('mini.pick').setup{version = false}
vim.keymap.set("n", "<leader>f", ":Pick files<CR>")
vim.keymap.set("n", "<leader>g", ":Pick grep_live<CR>")

-- ========== toggleterm ==========
 require('toggleterm').setup{
	open_mapping = [[<c -\>]], 
	size = 17,
	direction = 'horizontal'
}
