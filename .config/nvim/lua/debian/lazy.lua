-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


local plugins = {
	{ 'theprimeagen/harpoon' },
	{ 'tpope/vim-fugitive' },
	{ 'lervag/vimtex' },
	{ 'SirVer/ultisnips' },
	{ 'KeitaNakamura/tex-conceal.vim' },
	{ 'xiyaowong/transparent.nvim' },
	{ 'ibhagwan/fzf-lua' },
	{ 'nvim-lua/plenary.nvim' },
	{ 'akinsho/flutter-tools.nvim' },
	{ 'mfussenegger/nvim-dap' },
    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"}},
    { 'nvim-tree/nvim-tree.lua', dependencies = { 'nvim-tree/nvim-web-devicons', }},
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate', },
    { 'rose-pine/neovim', name = 'rose-pine' },
    { "catppuccin/nvim", name = "catppuccin" },
    { "NLKNguyen/papercolor-theme", name = "papercolor" },
    {
        'VonHeikemen/lsp-zero.nvim',

        branch = 'v2.x',
        dependencies = {
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim',
              build = function()
                pcall(vim.cmd, 'MasonUpdate')
              end,
            },
            {'williamboman/mason-lspconfig.nvim'},
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
		}
    },
}

require('lazy').setup(plugins, {})

