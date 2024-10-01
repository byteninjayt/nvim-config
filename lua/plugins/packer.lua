-- ~/.config/nvim/lua/plugins/packer.lua

-- Automatically install Packer if it's not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Reload Neovim and sync plugins on save
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

-- Plugins list
return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim' -- Packer can manage itself

	-- Add your plugins here, for example:
	use 'nvim-lua/plenary.nvim'              -- Useful Lua functions used by many plugins
	use 'nvim-telescope/telescope.nvim'      -- Fuzzy finder
	use 'nvim-telescope/telescope-project.nvim' -- TODO
	use 'folke/trouble.nvim'                 -- TODO
	use 'ThePrimeagen/harpoon'               -- TODO
	use 'akinsho/bufferline.nvim'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use 'nvim-lualine/lualine.nvim'
	use({ 'VonHeikemen/lsp-zero.nvim', branch = 'v4.x' })
	use('neovim/nvim-lspconfig')
	use('hrsh7th/nvim-cmp')
	use('hrsh7th/cmp-nvim-lsp')
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-buffer'
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}

	use 'ray-x/go.nvim'
	use 'ray-x/guihua.lua' -- recommended if need floating window support
	use 'nvim-treesitter/nvim-treesitter'

	-- UI
	use 'olimorris/onedarkpro.nvim'
	require("onedarkpro").setup()

	use 'catppuccin/nvim'
	require("catppuccin").setup()
	use 'lewis6991/gitsigns.nvim'
	require('gitsigns').setup()
	use "olimorris/onedarkpro.nvim"
	require 'telescope'.load_extension('project')

	local bufferline = require("bufferline")
	bufferline.setup({
		options = {
			style_preset = bufferline.style_preset.no_italic,
			separator_style = "slant",
			offsets = {
				{
					filetype = "NvimTree",
					text = "Workspace",
					text_align = "left",
				}
			},
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				return "(" .. count .. ")"
			end,
			hover = {
				enabled = true,
				delay = 200,
				reveal = { 'close' }
			}
		}
	})

	require("cmp").setup()

	-- Automatically set up your configuration after cloning packer.nvim
	if packer_bootstrap then
		require('packer').sync()
	end
end)
