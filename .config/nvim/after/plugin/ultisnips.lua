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

