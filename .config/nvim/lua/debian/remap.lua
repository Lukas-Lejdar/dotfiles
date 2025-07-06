vim.g.mapleader = " "
--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- set working to current directory
vim.keymap.set("n", "<leader>cd", ':cd %:p:h<CR>:pwd<CR>')

-- move text around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- ultisnips
vim.keymap.set("i", "<C-j>", "<C-R>=UltiSnips#JumpForwards()<CR>")
vim.keymap.set("i", "<C-k>", "<C-R>=UltiSnips#JumpBackwards()<CR>")

vim.keymap.set("i", "<C-H>", "<BS>")
vim.keymap.set("i", "<C-F>", "<Right>")
vim.keymap.set("i", "<C-B>", "<Left>")

vim.keymap.set("i", "<C-N>", "<Down>")
vim.keymap.set("i", "<C-P>", "<Up>")

vim.keymap.set("n", "<C-h>", "<C-W>h", {noremap = true})
vim.keymap.set("n", "<C-j>", "<C-W>j", {noremap = true})
vim.keymap.set("n", "<C-k>", "<C-W>k", {noremap = true})
vim.keymap.set("n", "<C-l>", "<C-W>l", {noremap = true})
vim.keymap.set("n", "<C-p>", "<C-W><C-p>", {noremap = true})

-- keep kurzor to the left
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- center cursor
vim.keymap.set("n", "<C-D>", "<C-D>zz")
vim.keymap.set("n", "<C-U>", "<C-U>zz")

-- yaynke to clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- scrap text
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- select and edit all same words as the one below cursor 
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- aply macro over visual range
vim.keymap.set('x', '@', '":norm @" . getcharstr() . "<cr>"', { expr = true })

-- Autoformat
vim.api.nvim_create_augroup("AutoFormat", {})
vim.api.nvim_create_autocmd(
    "BufWritePost",
    {
        pattern = "*.dart",
        group = "AutoFormat",
        callback = function()
            vim.lsp.buf.format()
        end,
    }
)
