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

  comment-box = build "LudoPinelli" "comment-box.nvim" "2024-02-03" "06bb771690bc9df0763d14769b779062d8f12bc5" "fbuN2L8M6AZRvIiKy9ECLgf3Uya6g5znfDaCgVF3XKA=";
  ultimate-autopair = build "altermo" "ultimate-autopair.nvim" "2024-02-07" "07c9da3e7722107163b68ecc5e0141fdd825449d" "TmmajuK1iOmRki4hLVFKK/w2Hf2aCh9GoOUxg5z+UZk=";
in {
  imports = [
    (import ./navbuddy.nix { inherit build pkgs; })
  ];

  config.extraPlugins = [
    comment-box pkgs.vimPlugins.zen-mode-nvim
  ];
}
