{
  plugins.lualine = let
    colors = {
      bg      = "#16181a";
      fg      = "#ffffff";
      yellow  = "#faff5e";
      cyan    = "#5ef1ff";
      green   = "#5eff6c";
      orange  = "#ffbd5e";
      violet  = "#bd5eff";
      blue    = "#5ea1ff";
      red     = "#ff6e5e";
      magenta = "#ff5ef1";
      grey    = "#7b8496";
      pink    = "#ff5ea0";
    };
    get-mode-color = /* lua */ ''
      function()
        local mode_color = {
          n = '${colors.blue}',
          i = '${colors.green}',

          v = '${colors.violet}',
          [''] = '${colors.violet}',
          V = '${colors.violet}',

          c = '${colors.magenta}',
          no = '${colors.red}',

          s = '${colors.orange}',
          S = '${colors.orange}',
          [''] = '${colors.orange}',

          ic = '${colors.yellow}',
          R = '${colors.magenta}',
          Rv = '${colors.magenta}',
          cv = '${colors.red}',
          ce = '${colors.red}',
          r = '${colors.cyan}',
          rm = '${colors.cyan}',
          ['r?'] = '${colors.cyan}',
          ['!'] = '${colors.red}',
          t = '${colors.pink}',
        }
        return { fg = mode_color[vim.fn.mode()] }
      end
    '';
  in {
    enable = true;
    settings = {
      options = {
        section_separators = "";
        component_separators = "";
        theme = {
          normal.c = { fg = colors.fg; bg = ""; };
          inactive.c = { fg = colors.fg; bg = ""; };
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

      tabline = {
        lualine_c = import ./section-left.nix colors get-mode-color;
        lualine_x = import ./section-right.nix colors get-mode-color;
      };
    };
  };

  extraConfigLua = "vim.o.laststatus = 0";
}
