return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup{
            open_mapping = [[<c-\>]], 
            size = 17,
            direction = 'horizontal', -- 'float'
        }
    end

}
