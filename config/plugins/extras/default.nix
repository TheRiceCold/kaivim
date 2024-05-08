{ pkgs, ... }:
let
  build = owner: name: version: rev: hash: pkgs.vimUtils.buildVimPlugin {
    pname = name;
    inherit version;
    src = pkgs.fetchFromGitHub {
      repo = name;
      inherit owner rev;
      hash = "sha256-${hash}";
    };
  };
in {
  extraPlugins = with pkgs.vimPlugins; [
    dial-nvim
    zen-mode-nvim
    vim-visual-multi
  ];

  imports = [
    (import ./silicon.nix build pkgs)
    # (import ./heirline build)
    # (import ./harpoon.nix build)
    # (import ./autopairs.nix build)
    # (import ./comment-box.nix build)
  ];
}
