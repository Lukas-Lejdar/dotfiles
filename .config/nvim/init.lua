
vim.diagnostic.config({
  virtual_text = {severity = {min = vim.diagnostic.severity.ERROR}},
  signs = {severity = {min = vim.diagnostic.severity.ERROR}},
  underline = {severity = {min = vim.diagnostic.severity.ERROR}},
})

--require('config.lazy')
require("debian")
