# DOCS: https://github.com/echasnovski/mini.nvim/blob/main/readmes
{
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
      symbol = "▏";
      options = { try_as_border = true; };
    };

    jump2d.mappings.start_jumping = "f";

    move = { };
    pairs = {
      opts = {
        modes = {
          insert = true;
          command = true;
          terminal = false;
        };
        markdown = true;
        skip_ts = [ "string" ];
        skip_unbalanced = true;
        # skip autopair when next character is one of these
        skip_next = ''[=[[%w%%%'%[%"%.%`%$]]=]'';
      };
    };
    splitjoin = { };
    trailspace = { };
  };
}
