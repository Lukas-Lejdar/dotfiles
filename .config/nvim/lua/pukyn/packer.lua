
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'theprimeagen/harpoon'
    use 'tpope/vim-fugitive'
    use 'lervag/vimtex'
    use 'SirVer/ultisnips'
    use 'KeitaNakamura/tex-conceal.vim'
    use 'xiyaowong/transparent.nvim'
    use 'ibhagwan/fzf-lua'
    use 'nvim-lua/plenary.nvim'
    use 'akinsho/flutter-tools.nvim'
    use 'mfussenegger/nvim-dap'
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"}}
    use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons', }}
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', }
    use({ 'rose-pine/neovim', as = 'rose-pine' })
    use { "catppuccin/nvim", as = "catppuccin" }
    use { "iagorrr/noctis-high-contrast.nvim", as = "noctics" }
    use { "morhetz/gruvbox", as = "gruvbox" }
    use { "NLKNguyen/papercolor-theme", as = "papercolor" }


    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim',
              run = function()
                pcall(vim.cmd, 'MasonUpdate')
              end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
    }
}
end)

