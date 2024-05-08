vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.ignorecase = true

vim.opt.wrap = false
vim.opt.colorcolumn = "110"
vim.opt.updatetime = 50

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.cmd [[
 autocmd FileType tex setlocal spell spelllang=cs,en,csa
]]

