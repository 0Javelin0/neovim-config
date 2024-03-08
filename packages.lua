require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use 'https://github.com/pgdouyon/vim-yin-yang'
	use 'karb94/neoscroll.nvim'
	use {
  		'nvim-lualine/lualine.nvim',
  		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}
	use 'lewis6991/gitsigns.nvim'
	use 'nvim-tree/nvim-web-devicons'
	use 'romgrk/barbar.nvim'
	use {
		'dinhhuy258/sfm.nvim',
		 config = function()
	   require("sfm").setup()
	end
	}
  use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
  }
	use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.4',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	}
	use {'neoclide/coc.nvim', branch = 'release'}
	use {
    'goolord/alpha-nvim',
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
	}
end)

vim.cmd [[colorscheme yin]]

--USAGES
--
-- TELESCOPE -->	:Telescope [...]
-- SFM -->				:<CTRL><A>
-- NEOSCROLL -->	:<CTRL><D> & <CTRL><U>

