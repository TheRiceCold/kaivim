/* lua */ ''
  function lsp_saga(key, action, desc)
    return set_cmd('l'..key, 'Lspsaga '..action, desc or action)
  end

  wk.add({
    { '<leader>l', group = 'Lsp' },
    set_cmd('ls', 'LspStart', 'Start'),
    set_cmd('lx', 'LspStop', 'Stop/Kill'),
    set_cmd('lR', 'LspRestart', 'Restart'),

    lsp_saga('r', 'rename'),
    lsp_saga('o', 'outline'),
    lsp_saga('a', 'code_action', 'Code Action'),
    -- lsp_saga('h', 'hover_doc')
    -- lsp_saga('a', 'code_action', 'Code Action'),
    -- lsp_saga('b', 'show_buf_diagnostics', 'Show buffer diagnostics'),
    -- lsp_saga('w', 'show_workspace_diagnostics', 'Show workspace diagnostics'),
  })
''
