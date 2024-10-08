{
  enable = true;
  symbolMap = {
    Copilot = "";
    Text = "󰉿";
    Method = "󰆧";
    Function = "󰊕";
    Constructor = "";
    Field = "󰜢";
    Variable = "󰀫";
    Class = "󰠱";
    Interface = "";
    Module = "";
    Property = "󰜢";
    Unit = "󰑭";
    Value = "󰎠";
    Enum = "";
    Keyword = "󰌋";
    Snippet = "";
    Color = "󰏘";
    File = "󰈙";
    Reference = "󰈇";
    Folder = "󰉋";
    EnumMember = "";
    Constant = "󰏿";
    Struct = "󰙅";
    Event = "";
    Operator = "󰆕";
    TypeParameter = "";
  };
  extraOptions = {
    maxwidth = 50;
    mode = "symbol";
    ellipsisChar = "...";
    menu = {
      path = "[Path]";
      cmdline = "[CMD]";
      nvim_lsp = "[LSP]";
      buffer = "[Buffer]";
      luasnip = "[Snippet]";
    };

    show_labelDetails = true;
    before.__raw = ''
      require'tailwind-tools.cmp'.lspkind_format
    '';
  };
}
