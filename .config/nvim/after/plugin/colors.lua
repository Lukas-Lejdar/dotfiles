function ColorMyPencils()
    local color = "rose-pine-main"
    vim.cmd.colorscheme(color) -- some kind of a reset for PaperColor, dunno

    vim.cmd("hi NvimTreeNormal guibg=NONE ctermbg=NONE")
    vim.cmd("hi SpellBad cterm=undercurl gui=undercurl guisp=#e82424")

    if os.getenv("USE_LIGHT") ~= nil then
        color = "PaperColor"
        vim.cmd.colorscheme(color)
        vim.o.bg = "light"
    end

    vim.api.nvim_set_hl(0, "SpellBad", { underline = true, sp = "#e82424" })

end

ColorMyPencils()


