vim.pack.add {
    'https://github.com/nvim-mini/mini.files',
    'https://github.com/akinsho/toggleterm.nvim',
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/nvim-treesitter/nvim-treesitter'
}

-- =================
-- treesitter
-- =================

-- build = ':TSUpdate',
-- main = 'nvim-treesitter.configs', -- Sets main module to use for opts
require("nvim-treesitter.configs").setup({
    ensure_installed = { 'bash', 'c', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc', 'python', 'toml', 
    'gitignore', 'make', 'cmake', 'cpp', 'ocaml' },
    auto_install = true, -- Autoinstall languages that are not installed
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = { enable = true },
})

-- =================
-- mini files
-- =================
vim.keymap.set("n", "<leader>e", function()
    require("mini.files").open(vim.api.nvim_buf_get_name(0), true) end,
    { desc = "Toggle Explorer" }
)

require('mini.files').setup{
    mappings = {
        go_in = 'L',
        go_in_plus = 'l',
        go_out = 'H',
        go_out_plus = 'h',
        synchronize = '<CR>',
    },
}

-- =================
-- toggleterm
-- =================
require('toggleterm').setup{
    open_mapping = [[<c-\>]], 
    size = 17,
    direction = 'horizontal', -- 'float'
}
