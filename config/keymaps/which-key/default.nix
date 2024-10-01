{
  plugins.which-key = {
    enable = true;
    settings = {
      preset = "helix"; # "classic" | "modern" | "helix"
      win = { border = "none"; };
      # Available sorters:
      # * local: buffer-local mappings first
      # * order: order of the items (Used by plugins like marks / registers)
      # * group: groups last
      # * alphanum: alpha-numerical first
      # * mod: special modifier keys last
      # * manual: the order the mappings were added
      # * case: lower-case first
      sort = ["manual"];
      icons.mappings = false;
    };
  };

  extraConfigLua = /* lua */ ''
    local wk = require'which-key'
    local harpoon = require'harpoon'
    local files = require'mini.files'

    function set_cmd(key, action, desc, opt)
      local cmd = {
        '<leader>'..key,
        type(action) == 'string' and '<cmd>'..action..'<cr>' or action,
        desc = desc:gsub("^%l", string.upper),
      }

      if not (opt == nil) then
        table.insert(cmd, opt)
      end

      return cmd
    end

    ${import ./git-keys.nix}
    ${import ./lsp-keys.nix}
    ${import ./find-keys.nix}
    ${import ./harpoon-keys.nix}
    ${import ./trouble-keys.nix}
    wk.add({
      set_cmd('e', function()
        files.open(vim.bo.buftype ~= 'nofile' and vim.api.nvim_buf_get_name(0) or nil)
      end, 'Explorer'),
      set_cmd('E', files.open, 'Explorer (Root)'),
      set_cmd('F', vim.cmd.Ex, 'File Tree'),

      set_cmd('w', 'w!', 'Write buffer'),
      set_cmd('d', 'bdelete', 'Delete buffer'),
      set_cmd('c', 'clo', 'Close split window'),
      set_cmd('t', 'terminal', 'New terminal'),
      -- set_cmd('s', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>,  <Left><Left>', 'Replace Word'),
      set_cmd('qq', 'qa', 'Quit all', true),
    })
    ${import ./extra-keys.nix}
  '';
}
