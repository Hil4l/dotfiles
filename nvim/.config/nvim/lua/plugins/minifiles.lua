return {
    'echasnovski/mini.files',
    version = '*',
    keys = {
        {
            "<leader>e",
            function()
                require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
            end,
            desc = "Open mini.files (Directory of Current File)",
        }
    },
    opts = {
        mappings = {
            go_in = 'L',
            go_in_plus = 'l',
            go_out = 'H',
            go_out_plus = 'h',
            synchronize = '<CR>',
        },
    },
    config = function(_, opts)
        require("mini.files").setup(opts)
    end
}

