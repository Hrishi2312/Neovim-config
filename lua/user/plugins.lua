local Plug = vim.fn['plug#']

vim.call('plug#begin')
	Plug 'gruvbox-community/gruvbox'
	Plug 'neovim/nvim-lspconfig'
	Plug 'williamboman/nvim-lsp-installer'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-nvim-lua'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'saadparwaiz1/cmp_luasnip'
	Plug 'L3MON4D3/LuaSnip'
	Plug 'rafamadriz/friendly-snippets'
	Plug 'cohama/lexima.vim'
	Plug 'akinsho/toggleterm.nvim'
	Plug('glacambre/firenvim', {
		['do'] = function()
			vim.call('firenvim#install', '0')
		end
	})
vim.call('plug#end')
