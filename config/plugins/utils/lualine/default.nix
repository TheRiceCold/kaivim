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
}
