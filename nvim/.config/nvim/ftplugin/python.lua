vim.lsp.start({
    name = "pyrefly",
    cmd = { "pyrefly", "lsp"},
    root_dir = vim.fs.root(0, {"pyproject.toml", ".git"})
})

vim.opt_local.makeprg = "python3" -- uv run

