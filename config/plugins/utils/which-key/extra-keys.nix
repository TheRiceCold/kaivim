/* lua */ ''
  local silicon = require'nvim-silicon'

  function latex(key, action)
    return set_cmd('L'..key, 'Vimtex'..action, action)
  end
  function rest(key, action, desc)
    return set_cmd('R'..key, 'Rest '..action, 'Run '..(desc or action))
  end

  wk.add({
    -- Extras --
    set_cmd('C', 'ColorizerToggle', 'Colorizer'),
    set_cmd('r', require'grug-far'.open, 'Replace'),
    set_cmd('u', 'UndotreeToggle', 'Undo Tree'),
    set_cmd('z', function()
      vim.wo.number = false
      require'zen-mode'.toggle()
    end, 'Zen Mode'),

    --- Markdown --
    { '<leader>M', group = 'Markdown' },
    set_cmd('Mg', 'Glow', 'Glow'),
    set_cmd('Mr', 'RenderMarkdown toggle', 'Toggle render'),
    set_cmd('Mv', 'MarkdownPreviewToggle', 'Browser preview'),

    -- rest-nvin --
    { '<leader>R', group = 'Rest (http)' },
    rest('r', 'run', 'request'),
    rest('l', 'last', 'last request'),
    rest('e', 'env show'),
    rest('s', 'env select'),
    rest('L', 'logs', 'Logs'),

    --- Snap (Silicon) --
    { '<leader>S', group = 'Snap (Silicon)' },
    set_cmd('Ss', silicon.file, 'Save as file'),
    set_cmd('Sc', silicon.clip, 'Copy to clipboard'),

    { '<leader>T', group = 'Typst' },

    -- Latex (Vimtex) --
    { '<leader>L', group = 'Latex' },
    latex('v', 'View'),
    latex('e', 'Errors'),
    latex('r', 'Reload'),
    latex('c', 'Compile'),
  })
''
