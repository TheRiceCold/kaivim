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
  extraPlugins = with pkgs.vimPlugins; [ zen-mode-nvim vim-visual-multi ];

  imports = [
    (import ./navbuddy.nix { inherit build pkgs; })
    (import ./comment-box.nix { inherit build; })
    (import ./autopairs.nix { inherit build; })
  ];
}
