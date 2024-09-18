/* lua */ ''
  local bl = require'bufferline'
  local g = require'bufferline.groups'

  wk.add({
    { '<leader>b', group = 'BufferLine' },
    set_cmd('bp', bl.pick, 'Pick'),
    set_cmd('bP', g.toggle_pin, 'Toggle pin'),
    set_cmd('bf', function() bl.go_to(1) end, 'Go to First'),
    set_cmd('bl', function() bl.go_to(-1) end, 'Go to Last'),
    set_cmd('bn', function() bl.move(1) end, 'Move next'),
    set_cmd('bb', function() bl.move(-1) end, 'Move previous'),
    set_cmd('bo', bl.close_others, 'Close others'),
    set_cmd('bc', bl.close_with_pick, 'Close with Pick'),
  })
''
