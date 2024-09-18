/* lua */ ''
  function telescope(key, action, desc)
    return set_cmd('f'..key, 'Telescope '..action..' theme=ivy', desc or action or "Telescope")
  end

  wk.add({
    { '<leader>f', group='Find (Telescope)' },
    telescope('f', 'fd', 'Files'),
    telescope('o', 'oldfiles'),
    telescope('g', 'live_grep', 'Live Grep'),
    telescope('b', 'buffers'),
    telescope('a', 'fd follow=true hidden=true', 'All Files'),
    telescope('m', 'marks'),
    telescope('e', 'emoji'),
    telescope('k', 'keymaps'),
    telescope('j', 'jumplist'),
    telescope('c', 'commands'),
    set_cmd('ft', 'Telescope theme=ivy', 'Telescope'),
    telescope('C', 'colorscheme'),
    telescope('T', 'todo-comments', 'Todo Comments'),

    { '<leader>fG', group='Git' },
    telescope('Gf', 'git_files', 'Files'),
    telescope('Gs', 'git_status', 'Status'),
    telescope('Gc', 'git_commits', 'Commits'),
    telescope('Gb', 'git_bcommits', 'Buffer commits'),
    telescope('GB', 'git_branches', 'Branches'),

    { '<leader>fl', group='Lsp' },
    telescope('lr', 'lsp_references', 'References'),
    telescope('lf', 'lsp_definitions', 'Definitions'),
    telescope('li', 'lsp_implementations', 'Implementations'),

    -- grug-far.nvim --
    set_cmd('fr', require'grug-far'.open, 'Replace'),
  })
''
