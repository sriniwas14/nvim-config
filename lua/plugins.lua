local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use ("wbthomason/packer.nvim") -- Have packer manage itself	

	-- INSTALL PACKAGES HERE
	use({ 'rose-pine/neovim', as = 'rose-pine' })
	use({ 'nvim-lua/telescope.nvim', requires = {{'nvim-lua/plenary.nvim'}} })
	use({
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	})
	-- use({ 'williamboman/mason.nvim', as = 'mason' })
	use ({
	    "williamboman/mason.nvim",
	    "williamboman/mason-lspconfig.nvim",
	    "neovim/nvim-lspconfig",
	})

	use('prettier/vim-prettier')
	use('w0rp/ale')
	use('tpope/vim-fugitive')
	use('mbbill/undotree')
	use('shougo/deoplete.nvim')
	use ({
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	})
	use {
	  'nvim-tree/nvim-tree.lua',
	  requires = {
	    'nvim-tree/nvim-web-devicons', -- optional
	  },
	}

	-- Persistence
--    use {
--		'ahri/vim-sesspit',
--	}
	-- LSP
	use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
	    --- Uncomment these if you want to manage LSP servers from neovim
	    -- {'williamboman/mason.nvim'},
	    -- {'williamboman/mason-lspconfig.nvim'},

	    -- LSP Support
	    {'neovim/nvim-lspconfig'},
	    -- Autocompletion
	    {'hrsh7th/nvim-cmp'},
	    {'hrsh7th/cmp-nvim-lsp'},
	    {'L3MON4D3/LuaSnip'},
	  }
	}

	-- Terminal
	use {"akinsho/toggleterm.nvim", tag = '*', config = function()
	  require("toggleterm").setup()
	end}
	use 'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
	use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status
	use 'romgrk/barbar.nvim'

	use {
	  'glepnir/dashboard-nvim',
	  event = 'VimEnter',
	  config = function()
		require('dashboard').setup {
		  -- config
		  config = {
				header = 
				{
"                ..:::::::::..",
"           ..:::aad8888888baa:::..",
"        .::::d:?88888888888?::8b::::.",
"      .:::d8888:?88888888??a888888b:::.",
"    .:::d8888888a8888888aa8888888888b:::.",
"   ::::dP::::::::88888888888::::::::Yb::::",
"  ::::dP:::::::::Y888888888P:::::::::Yb::::",
" ::::d8:::::::::::Y8888888P:::::::::::8b::::",
".::::88::::::::::::Y88888P::::::::::::88::::.",
":::::Y8baaaaaaaaaa88P:T:Y88aaaaaaaaaad8P:::::",
":::::::Y88888888888P::|::Y88888888888P:::::::",
"::::::::::::::::888:::|:::888::::::::::::::::",
"`:::::::::::::::8888888888888b::::::::::::::'",
" :::::::::::::::88888888888888::::::::::::::",
"  :::::::::::::d88888888888888:::::::::::::",
"   ::::::::::::88::88::88:::88::::::::::::",
"    `::::::::::88::88::88:::88::::::::::'",
"      `::::::::88::88::P::::88::::::::'",
"        `::::::88::88:::::::88::::::'",
"           ``:::::::::::::::::::''",
"Black Mana      ``:::::::::''     Black Mana",

				}
		  }
		}
	  end,
	  requires = {'nvim-tree/nvim-web-devicons'}
	}

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

