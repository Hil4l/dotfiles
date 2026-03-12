local gh = function(x) return 'https://github.com/' .. x end
vim.pack.add {
    gh('nvim-mini/mini.files'),
    gh('ibhagwan/fzf-lua'),
    gh('nvim-tree/nvim-web-devicons'),
    gh('nvim-treesitter/nvim-treesitter'),
    gh('akinsho/toggleterm.nvim'),
}

-- custom formatter
require("formatter").setup({
  cpp    = "clang-format-20",
  c      = "clang-format-20",
  ocaml  = "ocamlformat --impl -",
  python = "black -q -",
})
vim.keymap.set("n", "<leader>fm", "<Cmd>Format<CR>")

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
require("fzf-lua").register_ui_select()

-- treesitter
require('nvim-treesitter.configs').setup{
    lazy = false, auto_install = false, build = ':TSUpdate',
    highlight = { enable = true }
}
