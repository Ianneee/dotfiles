-- https://github.com/junegunn/vim-plug
-- :PlugInstall :PlugClean

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
--Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'lervag/vimtex'
Plug 'sainnhe/sonokai'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'

-- LSP configurations
Plug 'neovim/nvim-lspconfig'

-- LSP autocomplete
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lua'

-- Snippets
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

-- Treesitter
--Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

Plug 'windwp/nvim-autopairs'

-- EditorConfig
Plug 'editorconfig/editorconfig-vim'

vim.call('plug#end')
