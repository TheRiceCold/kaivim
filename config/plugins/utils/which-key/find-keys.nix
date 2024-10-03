/*lua*/''
function telescope(key, action, desc, opts)
  local builtin = require'telescope.builtin'
  local themes = require'telescope.themes'

  return set_cmd('f'..key,
    function()
      builtin[action](themes.get_ivy(opts or {}))
    end,
    desc or action)
end

function todo(key, keyword, desc, normal_mode)
  return set_cmd('ft'..key,
    'TodoTelescope initial_mode=normal theme=ivy keywords='..(keyword or ""),
  desc or keyword)
end

local function harpoon_telescope(harpoon_files)
  local conf = require'telescope.config'.values
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require'telescope.pickers'.new({}, {
    prompt_title = 'Harpoon',
    finder = require'telescope.finders'.new_table({ results = file_paths }),
    previewer = conf.file_previewer({}),
    sorter = conf.generic_sorter({}),
  }):find()
end

wk.add({
  { '<leader>f', group='Find' },
  telescope('f', 'find_files', 'Files'),
  telescope('o', 'old_files', 'Old files'),
  telescope('g', 'git_files', 'Git Files'),
  telescope('a', 'find_files', 'All Files', { follow = true, hidden = true }),
  telescope('l', 'live_grep', 'Live Grep'),

  telescope('m', 'marks'),
  telescope('b', 'buffers', 'buffers', { initial_mode = 'normal' }),
  telescope('k', 'keymaps'),
  telescope('j', 'jumplist', 'Jumplist', { initial_mode = 'normal' }),
  telescope('c', 'commands'),
  telescope('C', 'colorscheme'),

  -- Extensions
  set_cmd('fh', function() harpoon_telescope(harpoon:list()) end, 'Harpoon'),
  set_cmd('fe', 'Telescope emoji theme=ivy', 'Emoji'),
  set_cmd('fy', 'Telescope glyph theme=ivy', 'Glyph'),

  -- Git --
  { '<leader>fG', group='Git' },
  telescope('Gs', 'git_status', 'Status'),
  telescope('Gc', 'git_commits', 'Commits', { initial_mode = 'normal' }),
  telescope('Gb', 'git_bcommits', 'Buffer commits', { initial_mode = 'normal' }),
  telescope('GB', 'git_branches', 'Branches', { initial_mode = 'normal' }),

  -- LSP --
  { '<leader>fL', group='Lsp' },
  telescope('Lr', 'lsp_references', 'References', { initial_mode = 'normal' }),
  telescope('Ld', 'lsp_definitions', 'Definitions', { initial_mode = 'normal'}),
  telescope('Li', 'lsp_implementations', 'Implementations', { initial_mode = 'normal' }),

  -- Todo Comments ---
  { '<leader>ft', group='Todo Comments' },
  todo('a', 'All'),

  todo('l', 'LINK'),
  todo('n', 'NOTE,INFO', 'NOTE'),
  todo('w', 'WARN,WARNING', 'WARN'),

  -- REFACTOR:
  todo('f', 'FIX'),
  todo('t', 'TODO'),
  todo('h', 'HACK'),

  todo('o', 'OPTIMIZE'),
  todo('r', 'REFACTOR'),
})
''
