/* lua */ ''
  function git(key, action, desc)
    return set_cmd('g'..key, 'Git '..action, desc or action)
  end
  function lazygit(key, action, desc)
    return set_cmd('g'..key, 'LazyGit'..(action or ""), desc or "LazyGit")
  end
  local gsigns = require'gitsigns'
  function signs(key, action, desc)
    return set_cmd('g'..key, gsigns[action], desc)
  end

  wk.add({
    -- GitFugitive --
    { '<leader>g', group='Git' },
    git('l', 'log'),
    git('i', 'init'),
    git('p', 'pull'),
    git('P', 'push'),
    git('f', 'fetch'),
    git('c', 'commit'),
    git('a', 'add .', 'Add all'),

    -- Gitsigns --
    signs('s', 'stage_buffer', 'Stage buffer'),
    signs('R', 'reset_buffer', 'Reset buffer'),
    signs('t', 'toggle_signs', 'Toggle signs'),
    signs('n', 'toggle_numhl', 'Toggle numhl'),
    signs('L', 'toggle_linehl', 'Toggle linehl'),
    signs('d', 'toggle_deleted', 'Toggle deleted'),

    -- LazyGit --
    lazygit('g'),
    lazygit('C', 'Filter', 'Project Commits'),
    lazygit('B', 'FilterCurrentFile', 'Buffer Commits'),

    set_cmd('gH', 'GhActions', 'Github Actions'),
    set_cmd('gm', 'GitMessenger', 'Show Message'),

    { '<leader>gh', group='Hunk' },
    signs('hs', 'stage_hunk', 'Stage'),
    signs('hr', 'reset_hunk', 'Reset'),
    signs('hv', 'preview_hunk', 'Preview'),
    signs('hu', 'undo_stage_hunk', 'Undo Stage'),
    set_cmd('ghn', function() gsigns.nav_hunk('next') end, 'Next'),
    set_cmd('ghp', function() gsigns.nav_hunk('prev') end, 'Previous'),
    signs('hd', 'diffthis', 'Diff this'),
    set_cmd('ghD', function() gsigns.diffthis('~') end, 'Diff this'),
  })
''
