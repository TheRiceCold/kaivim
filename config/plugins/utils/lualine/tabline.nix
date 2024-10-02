let
  colors = import ./colors.nix;
  get-mode-color = # lua
    ''
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
in
{
  lualine_c = import ./section-left.nix colors get-mode-color;
  lualine_x = import ./section-right.nix colors get-mode-color;
}
