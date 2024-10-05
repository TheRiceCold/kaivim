local wk = require 'which-key'
local files = require 'mini.files'
local harpoon = require 'harpoon'
local gitsigns = require 'gitsigns'

local set_key = {
	cmd = function(key, action, desc, hidden)
		return {
			'<leader>' .. key,
			type(action) == 'string' and '<cmd>' .. action .. '<cr>' or action,
			desc = desc:gsub('^%l', string.upper),
			hidden = hidden or false,
		}
	end,
}

wk.add {
	set_key.cmd('e', function()
		files.open(vim.bo.buftype ~= 'nofile' and vim.api.nvim_buf_get_name(0) or nil)
	end, 'Explorer'),
	set_key.cmd('E', files.open, 'Explorer (Root)'),

	set_key.cmd('w', 'w!', 'Write buffer'),
	set_key.cmd('d', 'bdelete', 'Delete buffer'),
	set_key.cmd('qq', 'qa', 'Quit all', true),
}

--- GIT Keys ---
set_key.lazygit = function(key, action, desc)
	return set_key.cmd('g' .. key, 'LazyGit' .. (action or ''), desc or 'LazyGit')
end
set_key.git_signs = function(key, action, desc)
	return set_key.cmd('g' .. key, function()
		gitsigns[action]()
	end, desc)
end
wk.add {
	{ '<leader>g', group = 'Git' },

	-- Gitsigns --
	set_key.git_signs('s', 'stage_buffer', 'Stage buffer'),
	set_key.git_signs('R', 'reset_buffer', 'Reset buffer'),
	set_key.git_signs('t', 'toggle_signs', 'Toggle signs'),
	set_key.git_signs('n', 'toggle_numhl', 'Toggle numhl'),
	set_key.git_signs('L', 'toggle_linehl', 'Toggle linehl'),
	set_key.git_signs('d', 'toggle_deleted', 'Toggle deleted'),

	-- LazyGit --
	set_key.lazygit 'g',
	set_key.lazygit('C', 'Filter', 'Project Commits'),
	set_key.lazygit('B', 'FilterCurrentFile', 'Buffer Commits'),

	set_key.cmd('gH', 'GhActions', 'Github Actions'),
	set_key.cmd('gm', 'GitMessenger', 'Show Message'),

	{ '<leader>gh', group = 'Hunk' },

	set_key.git_signs('hs', 'stage_hunk', 'Stage'),
	set_key.git_signs('hr', 'reset_hunk', 'Reset'),
	set_key.git_signs('hv', 'preview_hunk', 'Preview'),
	set_key.git_signs('hu', 'undo_stage_hunk', 'Undo Stage'),
	set_key.cmd('ghn', function()
		gitsigns.nav_hunk 'next'
	end, 'Next'),
	set_key.cmd('ghp', function()
		gitsigns.nav_hunk 'prev'
	end, 'Previous'),
	set_key.git_signs('hd', 'diffthis', 'Diff this'),
	set_key.cmd('ghD', function()
		gitsigns.diffthis '~'
	end, 'Diff this'),
}

--- LSP keys ---
set_key.lsp = function(key, action)
	return set_key.cmd('l' .. key, 'Lsp' .. action, action)
end
set_key.lsp_saga = function(key, action, desc)
	return set_key.cmd('l' .. key, 'Lspsaga ' .. action, desc or action)
end
wk.add {
	{ '<leader>l', group = 'Lsp' },
	set_key.lsp('i', 'Info'),
	set_key.lsp('R', 'Restart'),
	set_key.lsp('s', 'Start'),
	set_key.lsp('x', 'Stop'),
	set_key.cmd('lf', require('conform').format, 'Format'),

	set_key.lsp_saga('r', 'rename'),
	set_key.lsp_saga('o', 'outline'),
	set_key.lsp_saga('a', 'code_action', 'Code Action'),
}

set_key.telescope = function(key, action, desc, opts)
	local builtin = require 'telescope.builtin'
	local themes = require 'telescope.themes'

	return set_key.cmd('f' .. key, function()
		builtin[action](themes.get_ivy(opts or {}))
	end, desc or action)
end

set_key.todo_telescope = function(key, keyword, desc)
	return set_key.cmd(
		'ft' .. key,
		'TodoTelescope initial_mode=normal theme=ivy keywords=' .. (keyword or ''),
		desc or keyword
	)
end

--- FIND(telescope) keys ---
wk.add {
	{ '<leader>f', group = 'Find' },
	set_key.telescope('f', 'find_files', 'Files'),
	set_key.telescope('o', 'old_files', 'Old files'),
	set_key.telescope('g', 'git_files', 'Git Files'),
	set_key.telescope('a', 'find_files', 'All Files', { follow = true, hidden = true }),
	set_key.telescope('l', 'live_grep', 'Live Grep'),

	set_key.telescope('m', 'marks'),
	set_key.telescope('b', 'buffers', 'buffers', { initial_mode = 'normal' }),
	set_key.telescope('k', 'keymaps'),
	set_key.telescope('j', 'jumplist', 'Jumplist', { initial_mode = 'normal' }),
	set_key.telescope('c', 'commands'),
	set_key.telescope('C', 'colorscheme'),

	-- Extensions
	set_key.cmd('fe', 'Telescope emoji theme=ivy', 'Emoji'),
	set_key.cmd('fy', 'Telescope glyph theme=ivy', 'Glyph'),
	set_key.cmd('fh', function()
		local conf = require('telescope.config').values
		local file_paths = {}
		for _, item in ipairs(harpoon:list().items) do
			table.insert(file_paths, item.value)
		end

		require('telescope.pickers')
			.new({}, {
				prompt_title = 'Harpoon',
				finder = require('telescope.finders').new_table { results = file_paths },
				previewer = conf.file_previewer {},
				sorter = conf.generic_sorter {},
			})
			:find()
	end, 'Harpoon'),

	-- Git --
	{ '<leader>fG', group = 'Git' },
	set_key.telescope('Gs', 'git_status', 'Status'),
	set_key.telescope('Gc', 'git_commits', 'Commits', { initial_mode = 'normal' }),
	set_key.telescope('Gb', 'git_bcommits', 'Buffer commits', { initial_mode = 'normal' }),
	set_key.telescope('GB', 'git_branches', 'Branches', { initial_mode = 'normal' }),

	-- LSP --
	{ '<leader>fL', group = 'Lsp' },
	set_key.telescope('Lr', 'lsp_references', 'References', { initial_mode = 'normal' }),
	set_key.telescope('Ld', 'lsp_definitions', 'Definitions', { initial_mode = 'normal' }),
	set_key.telescope('Li', 'lsp_implementations', 'Implementations', { initial_mode = 'normal' }),

	-- Todo Comments ---
	{ '<leader>ft', group = 'Todo Comments' },
	set_key.todo_telescope('a', 'All'),

	set_key.todo_telescope('l', 'LINK'),
	set_key.todo_telescope('n', 'NOTE,INFO', 'NOTE'),
	set_key.todo_telescope('w', 'WARN,WARNING', 'WARN'),

	-- REFACTOR:
	set_key.todo_telescope('f', 'FIX'),
	set_key.todo_telescope('t', 'TODO'),
	set_key.todo_telescope('h', 'HACK'),

	set_key.todo_telescope('o', 'OPTIMIZE'),
	set_key.todo_telescope('r', 'REFACTOR'),
}

--- HARPOON keys ---
wk.add {
	{ '<leader>h', group = 'Harpoon' },
	set_key.cmd('ha', function()
		harpoon:list():add()
	end, 'Add'),
	set_key.cmd('hh', function()
		harpoon.ui:toggle_quick_menu(harpoon:list())
	end, 'Quick Menu'),

	set_key.cmd('hn', function()
		harpoon:list():prev()
	end, 'Next'),
	set_key.cmd('hp', function()
		harpoon:list():next()
	end, 'Previous'),

	set_key.cmd('h1', function()
		harpoon:list():select(1)
	end, 'Select 1'),
	set_key.cmd('h2', function()
		harpoon:list():select(2)
	end, 'Select 2'),
	set_key.cmd('h3', function()
		harpoon:list():select(3)
	end, 'Select 3'),
	set_key.cmd('h4', function()
		harpoon:list():select(4)
	end, 'Select 4'),
}

set_key.trouble = function(key, action, desc)
	return set_key.cmd('x' .. key, 'Trouble ' .. action .. ' focus=true win.position=bottom', desc)
end
wk.add {
	{ '<leader>x', group = 'Trouble' },
	set_key.trouble('x', 'diagnostics', 'Diagnostics'),
	set_key.trouble('X', 'diagnostics filter.buf=0', 'Buffer Diagnostics'),
	set_key.trouble('t', 'todo', 'Todo'),
	set_key.trouble('q', 'qflist', 'QuickFix List'),
	set_key.trouble('L', 'loclist', 'Location List'),

	--- LSP ---
	set_key.trouble('l', 'lsp', 'LSP'),
	set_key.trouble('D', 'lsp_declarations', 'declarations'),
	set_key.trouble('d', 'lsp_definitions', 'definitions'),
	set_key.trouble('s', 'symbols', 'Symbols'),
	set_key.trouble('i', 'lsp_implementations', 'implementations'),
	set_key.trouble('I', 'lsp_incoming_calls', 'Incoming calls'),
	set_key.trouble('O', 'lsp_outgoing_calls', 'Outgoing calls'),
	set_key.trouble('r', 'lsp_references', 'references'),
	set_key.trouble('t', 'lsp_type_definitions', 'type definitions'),
}

set_key.rest = function(key, action, desc)
	return set_key.cmd('R' .. key, 'Rest ' .. action, 'Run ' .. (desc or action))
end

set_key.latex = function(key, action)
	return set_key.cmd('L' .. key, 'Vimtex' .. action, action)
end

wk.add {
	{ '<leader>m', group = 'Markdown' },
	set_key.cmd('mr', 'RenderMarkdown toggle', 'Toggle render'),
	set_key.cmd('mv', 'MarkdownPreviewToggle', 'Browser preview'),

	-- rest-nvin --
	{ '<leader>R', group = 'Rest (http)' },
	set_key.rest('r', 'run', 'request'),
	set_key.rest('l', 'last', 'last request'),
	set_key.rest('e', 'env show'),
	set_key.rest('s', 'env select'),
	set_key.rest('L', 'logs', 'Logs'),

	--- Snap (Silicon) --
	{ '<leader>S', group = 'Snap (Silicon)' },
	set_key.cmd('Ss', require('silicon').file, 'Save as file'),
	set_key.cmd('Sc', require('silicon').clip, 'Copy to clipboard'),

	-- Latex (Vimtex) --
	{ '<leader>L', group = 'Latex' },
	set_key.latex('v', 'View'),
	set_key.latex('e', 'Errors'),
	set_key.latex('r', 'Reload'),
	set_key.latex('c', 'Compile'),

	set_key.cmd('C', 'ColorizerToggle', 'Colorizer'),
	set_key.cmd('r', require('grug-far').open, 'Replace'),
	set_key.cmd('u', 'UndotreeToggle', 'Undo Tree'),
	set_key.cmd('z', function()
		vim.wo.number = false
		require('zen-mode').toggle()
	end, 'Zen Mode'),
}
