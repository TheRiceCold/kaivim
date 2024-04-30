{ pkgs, ... }:
let
  icons = import ../icons.nix;
in {
  plugins.telescope = {
    enable = true;
    settings = {
      defaults = {
        vimgrep_arguments = [
          "rg"
          "-L"
          "--color=never"
          "--no-heading"
          "--with-filename"
          "--line-number"
          "--column"
          "--smart-case"
        ];
        prompt_prefix = "${icons.ui.telescope} ";
        color_devicons = true;
        mappings = [ ];
      };
    };
  };
  extraPackages = with pkgs; [ ripgrep lazygit ];
  extraPlugins = [ pkgs.vimPlugins.lazygit-nvim ];
  extraConfigLua = ''
    local telescope = require'telescope'
    telescope.load_extension('lazygit')
  '';
}
