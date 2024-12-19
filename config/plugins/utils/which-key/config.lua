local wk = require 'which-key'
local harpoon = require 'harpoon'
local gitsigns = require 'gitsigns'
local Terminal = require('toggleterm.terminal').Terminal

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
	set_key.cmd('e', require('mini.files').open, 'Files'),
	set_key.cmd('w', 'w!', 'Write buffer'),
	set_key.cmd('d', 'bdelete', 'Delete buffer'),
	set_key.cmd('Q', 'qa', 'Quit all', true),
	set_key.cmd('q', 'quit', 'Quit window', true),
}

set_key.git_signs = function(key, action, desc)
	return set_key.cmd('g' .. key, function()
		gitsigns[action]()
	end, desc)
end

local function lazygit_toggle()
	local lazygit = Terminal:new {
		cmd = 'lazygit',
		hidden = true,
		direction = 'float',
	}
	lazygit:toggle()
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

	set_key.cmd('gg', lazygit_toggle, 'Lazygit'),
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
	set_key.cmd('lF', 'ConformInfo', 'Format'),

	set_key.lsp_saga('r', 'rename'),
	set_key.lsp_saga('o', 'outline'),
	set_key.lsp_saga('a', 'code_action', 'Code Action'),
}

--- FZF keys ---
set_key.fzf = function(key, action, desc)
	return set_key.cmd('f' .. key, function()
		local fzf = require 'fzf-lua'
		fzf[action]()
	end, desc or action)
end

wk.add {
	{ '<leader>f', group = 'FZF' },
	set_key.fzf('f', 'files', 'Files'),
	set_key.fzf('o', 'oldfiles', 'Old files'),
	set_key.fzf('l', 'live_grep', 'Live grep'),
	set_key.fzf('b', 'buffers', 'Buffers'),
	set_key.fzf('k', 'keymaps', 'Keymaps'),
	set_key.fzf('j', 'jumps', 'Jumps'),
	set_key.fzf('c', 'commands', 'Commands'),
	set_key.fzf('C', 'colorschemes', 'Colorschemes'),
	set_key.fzf('t', 'tabs', 'Tabs'),
	set_key.fzf('T', 'treesitter', 'Treesitter'),
	set_key.cmd('fh', 'FzfHarpoon', 'Harpoon'),
	set_key.cmd('fp', 'FzfProjectile', 'Projectile'),
	set_key.fzf('x', 'tmux_buffers', 'Tmux buffers'),
	set_key.fzf('s', 'spell_suggest', 'Spelling suggest'),

	{ '<leader>fg', group = 'Git' },
	set_key.fzf('gg', 'git_files', 'Files'),
	set_key.fzf('gs', 'git_status', 'Status'),
	set_key.fzf('gb', 'git_bcommits', 'Buffer commits'),
	set_key.fzf('gB', 'git_branches', 'Branches'),

	{ '<leader>fL', group = 'LSP' },
	set_key.fzf('Lr', 'lsp_references', 'References'),
	set_key.fzf('Ld', 'lsp_definitions', 'Definitions'),
	set_key.fzf('LD', 'lsp_declarations', 'Declarations'),
	set_key.fzf('Lt', 'lsp_typedefs', 'Type definitions'),
	set_key.fzf('Li', 'lsp_implementations', 'Implementations'),
	set_key.fzf('Ls', 'lsp_document_symbols', 'Symbols'),
	set_key.fzf('LS', 'lsp_workspace_symbols', 'Workspace symbols'),
	-- set_key.fzf('LS', 'lsp_live_workspace_symbols', 'Live workspace symbols'),
	set_key.fzf('LI', 'lsp_incoming_calls', 'Incoming calls'),
	set_key.fzf('Lc', 'lsp_code_actions', 'Code actions'),
	set_key.fzf('Lf', 'lsp_finder', 'Finder'),
	set_key.fzf('Lo', 'lsp_outgoing_calls', 'Outgoing calls'),
	-- set_key.fzf('LD', 'diagnostics_document', 'Diagnostics document'),
	-- set_key.fzf('LD', 'diagnostics_workspace', 'Diagnostics workspace'),
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
	set_key.trouble('T', 'lsp_type_definitions', 'type definitions'),
}

wk.add {
	{ '<leader>t', group = 'Terminal' },
}

set_key.rest = function(key, action, desc)
	return set_key.cmd('R' .. key, 'Rest ' .. action, 'Run ' .. (desc or action))
end

set_key.latex = function(key, action)
	return set_key.cmd('L' .. key, 'Vimtex' .. action, action)
end

wk.add {
	{ '<leader>o', group = 'Orgmode' },
	{ '<leader>oi', group = 'Insert' },
	{ '<leader>ox', group = 'Clocking' },
	{ '<leader>ol', group = 'Link' },

	{ '<leader>m', group = 'Markdown' },
	set_key.cmd('mr', 'RenderMarkdown toggle', 'Toggle render'),
	set_key.cmd('mv', 'MarkdownPreviewToggle', 'Browser preview'),

	-- rest-nvim --
	{ '<leader>R', group = 'Rest(http)' },
	set_key.rest('r', 'run', 'request'),
	set_key.rest('l', 'last', 'last request'),
	set_key.rest('e', 'env show'),
	set_key.rest('s', 'env select'),
	set_key.rest('L', 'logs', 'Logs'),

	--- Snap (Silicon) --
	{ '<leader>S', group = 'Snap(Silicon)' },
	set_key.cmd('Ss', require('silicon').file, 'Save as file'),
	set_key.cmd('Sc', require('silicon').clip, 'Copy to clipboard'),

	-- Latex (Vimtex) --
	{ '<leader>L', group = 'Latex' },
	set_key.latex('v', 'View'),
	set_key.latex('e', 'Errors'),
	set_key.latex('r', 'Reload'),
	set_key.latex('c', 'Compile'),

	set_key.cmd('r', require('grug-far').open, 'Replace'),
	set_key.cmd('z', function()
		vim.wo.number = false
		require('zen-mode').toggle()
	end, 'Zen Mode'),
	set_key.cmd('u', 'UndotreeToggle', 'Undo Tree'),
	set_key.cmd('H', 'HexokinaseToggle', 'Hexokinase'),
}
