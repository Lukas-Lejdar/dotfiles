require("mason").setup({
  opts = {
    ensure_installed = {
      "clangd",
      "clang-format",
      "codelldb",
    }
  }
})
