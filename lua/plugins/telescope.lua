return { 
	'nvim-telescope/telescope.nvim', tag = '0.1.5',
	dependencies = { 
		'nvim-lua/plenary.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		'nvim-tree/nvim-web-devicons',
	},
	config = function()
		local telescope = require 'telescope'
		local builtin = require 'telescope.builtin'
		local actions = require 'telescope.actions'
    local icons = require('../icons').ui

		telescope.setup { 
      active = true,
      on_config_done = nil,
      theme = "dropdown", ---@type telescope_themes
      defaults = {
        prompt_prefix = icons.Telescope .. " ",
        selection_caret = icons.Forward .. " ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = nil,
        layout_strategy = nil,
        layout_config = {},
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--glob=!.git/",
        },

        file_ignore_patterns = {},
        path_display = { "smart" },
        winblend = 0,
        border = {},
        borderchars = nil,
        color_devicons = true,
        set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
      },
    }

		telescope.load_extension('fzf')
	end
}
