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
  extraPlugins = with pkgs.vimPlugins; [ zen-mode-nvim vim-visual-multi ];

  imports = [
    (import ./block.nix build)
    (import ./silicon.nix build)
    (import ./scrollEOF.nix build)
    (import ./render-markdown.nix build)
    (import ./telescope-emoji.nix build)
  ];
}
