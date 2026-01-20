vim.pack.add {
    'https://github.com/nvim-mini/mini.files',
    'https://github.com/ibhagwan/fzf-lua',
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/akinsho/toggleterm.nvim',
}

-- mini.files
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

-- toggleterm
require('toggleterm').setup{ open_mapping = [[<c-\>]], size = 17, direction = 'horizontal' }

-- fzflua
require("fzf-lua").setup{
    defaults = { previewer = false },
    winopts = { height = 0.50, width = 0.50 },
}
vim.keymap.set("n", "<leader>ff", "<Cmd>FzfLua files<CR>")
vim.keymap.set("n", "<leader>fg", "<Cmd>FzfLua grep_curbuf<CR>")

-- treesitter
require('nvim-treesitter.configs').setup{
    lazy = false, auto_install = false, build = ':TSUpdate',
    highlight = { enable = true }
}
