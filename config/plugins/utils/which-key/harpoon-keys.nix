/* lua */ ''
  wk.add({
    --- Harpoon ---
    { '<leader>h', group = 'Harpoon' },
    set_cmd('ha', function() harpoon:list():add() end, 'Add'),
    set_cmd('hh', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, 'Quick Menu'),

    set_cmd('hn', function() harpoon:list():prev() end, 'Next'),
    set_cmd('hp', function() harpoon:list():next() end, 'Previous'),

    set_cmd('h1', function() harpoon:list():select(1) end, 'Select 1'),
    set_cmd('h2', function() harpoon:list():select(2) end, 'Select 2'),
    set_cmd('h3', function() harpoon:list():select(3) end, 'Select 3'),
    set_cmd('h4', function() harpoon:list():select(4) end, 'Select 4'),
  })
''
