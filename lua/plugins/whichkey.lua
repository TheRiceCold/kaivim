return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local which_key = require 'which-key'

    local opts = {
      mode = 'n', -- NORMAL mode
      prefix = '<leader>',
    }

    local mappings = {
      ['w'] = { '<cmd>w!<cr>', 'Save' },
      ['/'] = { '<Plug>(comment_toggle_linewise_current)', 'Comment toggle current line' },
      ['f'] = { "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_ivy({}))<cr>", 'Find File' },
      ['e'] = { '<cmd>Neotree toggle<cr>', 'Explorer' },
      s = {
        name = 'Search',
        c = { '<cmd>Telescope colorscheme<cr>', 'Colorscheme' },
        R = { '<cmd>Telescope registers<cr>', 'Registers' },
        t = { '<cmd>Telescope live_grep<cr>', 'Text' },
      }
    }

    which_key.setup {
      plugins = {
        marks = false,
        registers = false,
        spelling = { enabled = true, suggestions = 20 },
        presets = {
          operators = false,
          motions = false,
          text_objects = false,
          windows = false,
          nav = false,
          z = false,
          g = false,
        },
      },
      popup_mappings = { scroll_down = '<c-d>', scroll_up = '<c-u>' },
      window = {
        border = 'single', -- none, single, double, shadow
        position = 'bottom', -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
      },
      layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 3, -- spacing between columns
        align = 'left', -- align columns left, center or right
      },
      ignore_missing = true,
      hidden = { '<silent>', '<cmd>', '<Cmd>', '<CR>', 'call', 'lua', '^:', '^ ' },
      show_help = true,
      show_keys = true,
      triggers = 'auto',
      triggers_blacklist = {
        i = { "j", "k" },
        v = { "j", "k" },
      },
      disable = {
        buftypes = {},
        filetypes = { 'TelescopePrompt' },
      },
    } 

    which_key.register(mappings, opts)
  end
}
