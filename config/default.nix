{ pkgs, ... }:
{
  imports = [
    ./plugins
    ./keymaps.nix
    ./neovide.nix
  ];

  config = {
    globals.mapleader = " ";
    opts = import ./options.nix;

    colorscheme = "poimandres";
    colorschemes = import ./colorschemes.nix;

    extraPackages = with pkgs; [
      ripgrep lazygit tectonic
      silicon jetbrains-mono noto-fonts-color-emoji
    ];
  };
}
