vim.lsp.start({
    name = "ocamllsp",
    cmd = { "ocamllsp" },
    root_dir = vim.fs.root(0, {"dune-project", ".git"})
})
