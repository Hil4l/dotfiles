return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup{
            open_mapping = [[<c-\>]], 
            size = 20,
            direction = 'float', -- 'horizontal'
        }

        -- vim.keymap.set("n", "<C-\\>", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })
    end

}
