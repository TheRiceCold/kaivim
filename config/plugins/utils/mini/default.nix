# DOCS: https://github.com/echasnovski/mini.nvim/blob/main/readmes
icons: {
  enable = true;
  modules = {
    align = { };

    basics = {
      options = { };
      mappings = { basic = true; windows = true; };
      autocommands = { basic = true; relnum_with_alt = true; };
    };

    clue = import ./clue.nix;

    files = {
      content = { };
      mappings = { show_help = "?"; };
      windows = {
        preview = true;
        width_preview = 40;
      };
    };

    indentscope = {
      symbol = icons.ui.line.left;
      options = { try_as_border = true; };
    };

    jump2d.mappings.start_jumping = "f";

    move = { };
    splitjoin = { };
    trailspace = { };
  };
}
