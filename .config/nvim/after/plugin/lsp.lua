vim.diagnostic.config({
  virtual_text = {severity = {min = vim.diagnostic.severity.ERROR}},
  signs = {severity = {min = vim.diagnostic.severity.ERROR}},
  underline = {severity = {min = vim.diagnostic.severity.ERROR}},
})

local lsp_zero = require('lsp-zero')
local lspconfig = require('lspconfig')
local mason = require("mason").setup {
    log_level = vim.log.levels.DEBUG
}

lsp_zero.preset('recommended')

local cmp = require('cmp')
local cmp_mappings = lsp_zero.defaults.cmp_mappings({
    ['<Tab>'] = cmp.mapping.confirm({select = true}),
    ['<C-Space>'] = cmp.mapping.complete(),
})

lsp_zero.setup_nvim_cmp({
  mapping = cmp_mappings
})

local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>e", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set("n", "<leader>dl", function() vim.diagnostic.setqflist() end, opts)
  vim.keymap.set("n", "<leader>ff", function() vim.lsp.buf.format() end, opts)
end

lsp_zero.on_attach(on_attach)
lspconfig.lua_ls.setup(lsp_zero.nvim_lua_ls())

lspconfig.dartls.setup{
  on_attach = on_attach,
  cmd = { "dart", 'language-server', '--protocol=lsp' },
}

lspconfig.pylsp.setup({
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'W391', 'E501', 'E722', 'E225'},
          maxLineLength = 100
        }
      }
    }
  }
})

lspconfig.jdtls.setup{
  java = {
    project = {
      sourcePaths = { '/home/lukas/tmp/jdk17u' }
    }
  }
}

lsp_zero.setup()
