function ColorMyPencils(color)
  color = color or "rose-pine-main"
  vim.cmd.colorscheme(color)
  vim.cmd("hi NvimTreeNormal guibg=NONE ctermbg=NONE")
  vim.cmd("hi SpellBad cterm=undercurl gui=undercurl guisp=#e82424")
end

ColorMyPencils()
