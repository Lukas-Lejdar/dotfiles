local fzf = require("fzf-lua");

local fzf_opts={['-i']="", ['--multi']="", ['--bind']='"alt-a:select-all"',}
-- local fdfinf_opts=' . -type f -H --no-ignore-vcs -exec grep -Iq . {} \\; -print0'
local fdfind_opts=' -t f -H --no-ignore-vcs'

-- Fzf navifation
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
