
vim.opt.clipboard = "unnamedplus"

vim.diagnostic.config({
  virtual_text = {severity = {min = vim.diagnostic.severity.ERROR}},
  signs = {severity = {min = vim.diagnostic.severity.ERROR}},
  underline = {severity = {min = vim.diagnostic.severity.ERROR}},
})

vim.g.python3_host_prog = os.getenv("HOME") .. "/.pyenv/bin/python3"

-- in init.lua
-- vim.g.clipboard = {
--   name = "xclip",
--   copy = { ["+"] = "xclip -selection clipboard", ["*"] = "xclip -selection primary" },
--   paste = { ["+"] = "xclip -selection clipboard -o", ["*"] = "xclip -selection primary -o" },
-- }

vim.g.vimtex_syntax_conceal = {
    math_bounds = 0,
}

require("debian")
