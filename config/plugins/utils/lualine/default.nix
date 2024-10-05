{
  extraConfigLua = builtins.readFile ./hide_statusbar.lua;

  plugins.lualine = let
    colors = import ./colors.nix;
  in {
    enable = true;
    settings = {
      options = {
        section_separators = "";
        component_separators = "";
        theme = {
          normal.c = {
            bg = "";
            inherit (colors) fg;
          };
          inactive.c = {
            bg = "";
            inherit (colors) fg;
          };
        };
      };

      # NOTE:
      # to be visible, change laststatus option value at ./config/options.nix
      # I prefer tabline(top) over sections(statusbar)
      sections = {
        # these are to remove the defaults
        lualine_a = [{}];
        lualine_b = [{}];
        lualine_c = [{}];
        lualine_x = [{}];
        lualine_y = [{}];
        lualine_z = [{}];
      };

      inactive_sections = {
        # these are to remove the defaults
        lualine_a = [{}];
        lualine_b = [{}];
        lualine_c = [{}];
        lualine_x = [{}];
        lualine_y = [{}];
        lualine_z = [{}];
      };

      tabline = import ./tabline.nix;
    };
  };

  keymaps = let
    buffers = num: let
      is-ten =
        if (num == 0)
        then 10
        else num;
    in {
      key = "<M-${toString num}>";
      mode = ["n" "i" "v"];
      options.desc = "Buffer ${toString is-ten}";
      action = "<cmd>LualineBuffersJump ${toString is-ten}<cr>";
    };
  in
    map buffers [1 2 3 4 5 6 7 8 9 0];
}
