{
  plugins.which-key = {
    enable = true;
    settings = {
      preset = "helix"; # "classic" | "modern" | "helix"
      sort = ["manual"];
      win.border = "none";
      icons.mappings = false;
    };
  };

  extraConfigLua = /*lua*/ ''
    local wk = require'which-key'
    local harpoon = require'harpoon'
    local files = require'mini.files'

    function set_cmd(key, action, desc, hidden)
      return {
        '<leader>'..key,
        type(action) == 'string' and '<cmd>'..action..'<cr>' or action,
        desc = desc:gsub("^%l", string.upper),
        hidden = hidden or false
      }
    end

    wk.add({
      set_cmd('e', function()
        files.open(vim.bo.buftype ~= 'nofile' and vim.api.nvim_buf_get_name(0) or nil)
      end, 'Explorer'),
      set_cmd('E', files.open, 'Explorer (Root)'),

      set_cmd('w', 'w!', 'Write buffer'),
      set_cmd('c', 'clo', 'Close window'),
      set_cmd('d', 'bdelete', 'Delete buffer'),
      set_cmd('qq', 'qa', 'Quit all', true),
    })

    ${import ./git-keys.nix}
    ${import ./lsp-keys.nix}
    ${import ./find-keys.nix}
    ${import ./harpoon-keys.nix}
    ${import ./trouble-keys.nix}
    ${import ./extra-keys.nix}
  '';
}
