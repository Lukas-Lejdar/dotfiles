local fzf = require("fzf-lua");

fzf.setup{
  winopts = {
    preview = {
      layout = "flex",
      flip_columns = 140
    },
  },
}

local fzf_opts={
  ['-i']="",
  ['--multi']="",
  ['--bind']='"alt-a:select-all"',
}
-- local fdfinf_opts=' . -type f -H --no-ignore-vcs -exec grep -Iq . {} \\; -print0'
local fdfind_opts=' -t f -H --no-ignore-vcs  -E ".git" '

vim.keymap.set('n', '<leader>pf',
  function()
    fzf.files({cmd='fdfind'..fdfind_opts, fzf_opts=fzf_opts})
  end, { silent = true })

vim.keymap.set('n', '<leader>ph',
  function()
    fzf.files({cmd='fdfind'..fdfind_opts, fzf_opts=fzf_opts, cwd="~"})
  end, { silent = true })

vim.keymap.set('n', '<leader>pg',
function() fzf.live_grep({ }) end,
{ silent = true })

-- Fzf lsp
vim.keymap.set('n', '<leader>gr',
  function() fzf.lsp_references() end,
  { silent = true })

vim.keymap.set('n', '<leader>gd',
  function() fzf.lsp_definitions() end,
  { silent = true })

vim.keymap.set('n', '<leader>gD',
  function() fzf.lsp_declarations() end,
  { silent = true })

vim.keymap.set('n', '<leader>gi',
  function() fzf.lsp_references() end,
  { silent = true })

--1206092
--fdfind -t f -H . $HOME  5,92s user 4,57s system 744% cpu 1,411 total
--wc -l  0,03s user 0,05s system 5% cpu 1,411 total

--1206077
--fdfind -t f -H . $HOME  5,97s user 4,76s system 743% cpu 1,444 total
--wc -l  0,02s user 0,07s system 6% cpu 1,443 total
