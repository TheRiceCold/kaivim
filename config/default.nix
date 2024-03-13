{ pkgs, ... }:
{
  imports = [
    ./plugins
    ./keymaps.nix
    ./neovide.nix
  ];

  config = {
    globals.mapleader = " ";
    options = import ./options.nix;
    colorschemes = import ./colorschemes.nix;
		colorscheme = "catppuccin";
    extraPackages = with pkgs; [ ripgrep lazygit tectonic ];
  };
}
