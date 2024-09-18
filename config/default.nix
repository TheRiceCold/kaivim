{ pkgs, ... }:
{
  imports = [
    ./keymaps
    ./plugins
    ./neovide.nix
    ./colorschemes
  ];

  config.opts = import ./options.nix;
  config.extraPackages = with pkgs; [
    # telescope.nvim
    ripgrep

    # git-messenger.vim & lazygit.nvim
    delta lazygit

    # VimTeX
    tectonic

    # nvim-silicon (Snapshot)
    silicon
    jetbrains-mono
    noto-fonts-color-emoji
  ];
}
