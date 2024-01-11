return {
	{ 
		'nvim-treesitter/nvim-treesitter', 
		build = ':TSUpdate',
		config = function()
			local config = require 'nvim-treesitter.configs'
			config.setup {
				ensure_installed = { 
					'lua', 
					'bash',
					'c',
					'cpp',
					'dockerfile',
					'dart',
					'gitignore',
					'html',
					'javascript', 
					'json',
					'nix',
					'python',
					'scss',
					'toml',
					'typescript',
					'yaml'
				},
				highlight = { enable = true },
				indent = { enable = true },
			}
		end
	},
}
