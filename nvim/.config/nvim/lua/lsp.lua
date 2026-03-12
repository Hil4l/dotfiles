-- =====================================
-- Clients
-- =====================================
vim.lsp.config['pyrefly'] = {
    cmd = { "pyrefly", "lsp"},
    filetypes = { 'python' },
    root_markers = { 'pyproject.toml', '.git' },
}

vim.lsp.config['clangd'] = {
    cmd = { "clangd", "--background-index", "--clang-tidy", "--query-driver=/usr/bin/g++" },
    filetypes = { 'cpp', 'c' },
    root_markers = { { '.clang-format', 'Makefile', 'build.sh' }, '.git' },
}

vim.lsp.config['ocamllsp'] = {
    cmd = { "ocamllsp" },
    filetypes = { 'ocaml' },
    root_markers = { { 'dune-project', 'Makefile' }, '.git' },
}

vim.lsp.config['tinymist'] = {
    cmd = { "tinymist" },
    filetypes = { 'typst' },
    settings = {
        formatterMode = "typstyle", -- or "typstfmt"
        formatterIndentSize = 4,   -- indentation width
    }
}

vim.lsp.enable({'clangd', 'pyrefly', 'ocamllsp', 'tinymist'})

-- =====================================
-- Functionalities
-- =====================================

vim.api.nvim_create_user_command("LspStatuts",
    function()
        vim.cmd("checkhealth vim.lsp")
    end, {}
)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method('textDocument/definition') then
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = args.buf })
    end
    -- if client:supports_method('textDocument/format') then
    --     vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, { buffer = args.buf })
    -- end
  end
})

vim.diagnostic.config({
    virtual_text = true,       -- no text
    signs = true,               -- signs in the sign column
    underline = true,           -- underline 
    update_in_insert = false,   
})
