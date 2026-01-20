-- start without lsp by default, provide cmd to attach if needed

vim.api.nvim_create_user_command("ClangdAttach",
    function()
        vim.lsp.start({
            name = "clangd",
            cmd = { "clangd", "--background-index", "--clang-tidy" },
            root_dir = vim.fs.root(0, {".clang-format", "Makefile", "build.sh", ".git"})
        })
    end, {}
)

vim.api.nvim_create_user_command("ClangdStop",
    function()
        local bufnr = vim.api.nvim_get_current_buf()
        local clients = vim.lsp.get_clients({ bufnr = bufnr, name = "clangd"})

        if #clients == 1 then
            clients[1]:stop()
        else
            print("0 or >2 same LSP clients attached to this buffer")
        end
    end, {}
)
