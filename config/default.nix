{ pkgs, ... }:
{
  imports = [ ./plugins ./keymaps ./neovide.nix ];

  config = {
    globals.mapleader = " ";
    opts = import ./options.nix;

    colorscheme = "poimandres";
    colorschemes = import ./colorschemes.nix;

    extraPackages = with pkgs; [
      silicon
      ripgrep
      lazygit
      tectonic
      jetbrains-mono
      noto-fonts-color-emoji
    ];
  };
}
