return { 
	'nvim-telescope/telescope.nvim', tag = '0.1.5',
	dependencies = { 
		'nvim-lua/plenary.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		'nvim-tree/nvim-web-devicons',
	},
	config = function()
		local telescope = require('telescope')
		local builtin = require('telescope.builtin')
		local actions = require('telescope.actions')

		telescope.setup({ })

		telescope.load_extension('fzf')
		local key = vim.keymap
		key.set('n', '<leader>f', "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_ivy({}))<CR>", { desc = 'Fuzzy find files in cwd' })
		key.set('n', '<leader>st', builtin.live_grep)
	end
}
