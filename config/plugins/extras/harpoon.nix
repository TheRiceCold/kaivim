build:
let
  harpoon = build "ThePrimeagen" "harpoon" "2024-01-26" "a38be6e0dd4c6db66997deab71fc4453ace97f9c" "RjwNUuKQpLkRBX3F9o25Vqvpu3Ah1TCFQ5Dk4jXhsbI=";
in {
  extraPlugins = [ harpoon ];
  extraConfigLua = ''
    local harpoon = require 'harpoon'
    local conf = require'telescope.config'.values
    local map = vim.keymap.set

    harpoon:setup()

    local function toggle_telescope(harpoon_files)
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

    map('n', '<C-s-h>', function() harpoon:list():prev() end)
    map('n', '<C-s-l>', function() harpoon:list():next() end)

    map('n', '<C-e>', function() toggle_telescope(harpoon:list()) end)
    map('n', '<leader>h', function() harpoon:list():append() end, { desc = 'Harpoon Append'} )

    -- map('n', '<C-h>', function() harpoon:list():select(1) end)
    -- map('n', '<C-t>', function() harpoon:list():select(2) end)
    -- map('n', '<C-n>', function() harpoon:list():select(3) end)
    -- map('n', '<C-s>', function() harpoon:list():select(4) end)
  '';
}
