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
  imports = [
    (import ./autopairs.nix { inherit build; })
    (import ./navbuddy.nix { inherit build pkgs; })
  ];

  config.extraPlugins = let
    comment-box = build "LudoPinelli" "comment-box.nvim" "2024-02-03" "06bb771690bc9df0763d14769b779062d8f12bc5" "fbuN2L8M6AZRvIiKy9ECLgf3Uya6g5znfDaCgVF3XKA=";
  in with pkgs.vimPlugins; [
    comment-box
    zen-mode-nvim
    vim-visual-multi
  ];
}
