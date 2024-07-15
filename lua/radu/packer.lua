-- This file can be loaded by calling `lua require('plugins')` from your init.vim
return require('packer').startup(function(use)
  require('packer').init({log = { level = 'trace' }});
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	'nvim-telescope/telescope.nvim', tag = '0.1.6',
  -- or                            , branch = '0.1.x',
	requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('justinmk/vim-sneak')
  use {
  {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "luvit-meta/library", words = { "vim%.uv" } },
        },
      },
    },
    run=':lua require(\'lazydev\').setup{}',
    { "Bilal2453/luvit-meta" }, -- optional `vim.uv` typings
  }
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'hrsh7th/cmp-nvim-lua'},
		  {'hrsh7th/nvim-cmp', opts = function(_, opts)
            opts.sources = opts.sources or {}
            table.insert(opts.sources, {
              name = "lazydev",
              group_index = 0, -- set group index to 0 to skip loading LuaLS completions
          })
        end,
      },
		  {'saadparwaiz1/cmp_luasnip'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  },
    opt=false
  }

  use("folke/zen-mode.nvim")

  use "tenxsoydev/size-matters.nvim"

  -- Flutter
  use {"akinsho/flutter-tools.nvim", requires = {"nvim-lua/plenary.nvim"}}

end)

