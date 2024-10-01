/* lua */ ''
  function trouble(key, action, desc)
    return set_cmd(
      'x'..key,
      'Trouble '..action..' focus=true win.position=bottom',
      desc
    )
  end

  wk.add({
    { '<leader>x', group = 'Trouble' },
    trouble('x', 'diagnostics', 'Diagnostics'),
    trouble('X', 'diagnostics filter.buf=0', 'Buffer Diagnostics'),
    trouble('q', 'todo', 'Todo'),
    trouble('q', 'qflist', 'QuickFix List'),
    trouble('L', 'loclist', 'Location List'),

    --- LSP ---
    trouble('l', 'lsp', 'LSP'),
    trouble('D', 'lsp_declarations', 'declarations'),
    trouble('d', 'lsp_definitions', 'definitions'),
    trouble('s', 'symbols', 'Symbols'),
    trouble('i', 'lsp_implementations', 'implementations'),
    trouble('I', 'lsp_incoming_calls', 'Incoming calls'),
    trouble('O', 'lsp_outgoing_calls', 'Outgoing calls'),
    trouble('r', 'lsp_references', 'references'),
    trouble('t', 'lsp_type_definitions', 'type definitions'),
  })
''
