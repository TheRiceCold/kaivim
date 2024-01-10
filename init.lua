vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
	
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  { 
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
	{ 'nvim-treesitter/nvim-treesitter', build = ":TSUpdate" },
}
local opts = {}

require('lazy').setup(plugins, opts)

require('catppuccin').setup()

vim.cmd.colorscheme 'catppuccin'

require('nvim-treesitter.configs').setup({
	ensure_installed = { "lua", "javascript" },
	highlight = { enable = true },
	indent = { enable = true },
})
