/* lua */ ''
  function lsp_saga(key, action, desc)
    return set_cmd('l'..key, 'Lspsaga '..action, desc or action)
  end

  wk.add({
    { '<leader>l', group = 'Lsp' },
    set_cmd('ls', 'LspStart', 'Start'),
    set_cmd('lk', 'LspStop', 'Stop/Kill'),
    set_cmd('lR', 'LspRestart', 'Restart'),

    lsp_saga('f', 'finder'),
    lsp_saga('r', 'rename'),
    lsp_saga('o', 'outline'),
    -- lsp_saga('h', 'hover_doc')
    lsp_saga('a', 'code_action', 'Code Action'),
    lsp_saga('d', 'peek_definition', 'Peek definition'),
    lsp_saga('D', 'goto_definition', 'Go to definition'),
    lsp_saga('t', 'peek_type_definition', 'Peek type definition'),
    lsp_saga('T', 'goto_type_definition', 'Go to type definition'),

    lsp_saga('b', 'show_buf_diagnostics', 'Show buffer diagnostics'),
    lsp_saga('w', 'show_workspace_diagnostics', 'Show workspace diagnostics'),
  })
''
