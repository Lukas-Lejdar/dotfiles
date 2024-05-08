require'nvim-tree'.setup {
  on_attach = "default",
  sync_root_with_cwd = true,
  view = { adaptive_size = true }
}

vim.keymap.set('n', '<leader>pv', vim.cmd.NvimTreeToggle)
