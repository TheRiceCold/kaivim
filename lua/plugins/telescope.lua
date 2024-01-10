return { 
	'nvim-telescope/telescope.nvim', tag = '0.1.5',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local builtin = require('telescope.builtin')
		local themes = require('telescope.themes')

		vim.keymap.set('n', '<leader>f', builtin.find_files, {})
		vim.keymap.set('n', '<leader>st', builtin.live_grep, {})
	end
}
