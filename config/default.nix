{ pkgs, ... }:
{
  imports = [
    ./keymaps
    ./plugins
    ./neovide.nix
  ];

  config = {
    opts = import ./options.nix;
    extraPackages = with pkgs; [
      delta
      silicon
      ripgrep
      lazygit
      tectonic
      jetbrains-mono
      noto-fonts-color-emoji
    ];
  };
}
