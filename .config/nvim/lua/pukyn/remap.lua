vim.g.mapleader = " "
--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- ultisnips
vim.keymap.set("i", "<C-j>", "<C-R>=UltiSnips#JumpForwards()<CR>")
vim.keymap.set("i", "<C-k>", "<C-R>=UltiSnips#JumpBackwards()<CR>")

-- set working to current directory
vim.keymap.set("n", "<leader>cd", ':cd %:p:h<CR>:pwd<CR>')

-- move text around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- move down a line inspite of wrapping
vim.keymap.set("n", "<A-j>", "gj")
vim.keymap.set("n", "<A-k>", "gk")

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

vim.keymap.set("i", "<S-right>", "<Esc>ve")
vim.keymap.set("i", "<S-left>", "<Esc>vb")
vim.keymap.set("i", "<S-up>", "<Esc>v<Up>")
vim.keymap.set("i", "<S-down>", "<Esc>v<down>")

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
