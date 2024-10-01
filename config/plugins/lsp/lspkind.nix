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

    show_labelDetails = true;
    before.__raw = /* lua */ '' require'tailwind-tools.cmp'.lspkind_format '';
  };
}
