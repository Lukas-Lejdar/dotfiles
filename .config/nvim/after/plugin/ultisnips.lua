vim.keymap.set("i", "<C-j>", "<C-R>=UltiSnips#JumpForwards()<CR>")
vim.keymap.set("i", "<C-k>", "<C-R>=UltiSnips#JumpBackwards()<CR>")

vim.g.UltiSnipsExpandTrigger="<tab>"
vim.g.UltiSnipsJumpForwardTrigger="<tab>"
--vim.g.UltiSnipsJumpBackwardTrigger="<c-z>"

vim.g.UltiSnipsSnippetDirectories={"~/.config/nvim/UltiSnips/"}

function UltiSnipsForward()
  vim.api.nvim_call_function('UltiSnips#JumpForwards', {})
end

function UltiSnipsBackward()
  vim.api.nvim_call_function('UltiSnips#JumpBackwards', {})
end

