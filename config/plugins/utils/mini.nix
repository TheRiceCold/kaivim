# see at https://github.com/echasnovski/mini.nvim/blob/main/readmes
{
  enable = true;
  modules = {
    ai = { };
    align = { };

    basics = {
      options = { };
      mappings = {
        basic = true;
        windows = true;
      };
      autocommands = {
        basic = true;
        relnum_with_alt = true;
      };
    };

    files = {
      content = { };
      mappings = { show_help = "?"; };
      windows = {
        preview = true;
        width_preview = 40;
      };
    };

    indentscope = {
      symbol = "▏";
      options = { try_as_border = true; };
    };

    jump2d.mappings.start_jumping = "f";

    move = { };
    splitjoin = { };
    trailspace = { };
  };
}
