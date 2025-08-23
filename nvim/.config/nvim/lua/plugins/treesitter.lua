return {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { 'bash', 'c', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc', 'python', 'toml', 
            'gitignore', 'make', 'cmake', 'cpp', 'rust', 'go' },
            -- Autoinstall languages that are not installed
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
            incremental_selection = { enable = true },
        })
    end
}
