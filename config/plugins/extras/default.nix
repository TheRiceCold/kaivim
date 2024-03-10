{ pkgs, ... }:
let
  icons = ../../icons.nix;
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
    (import ./navbuddy.nix build pkgs)
    (import ./harpoon.nix build)
    (import ./heirline build)

    # (import ./comment-box.nix build)
    # (import ./autopairs.nix build)
  ];
}
