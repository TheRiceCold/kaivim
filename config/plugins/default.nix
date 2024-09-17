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
  imports = [
    ./ui
    ./lsp
    ./languages
    ./completion
    ./treesitter
    (import ./utils build)
  ];

  extraPlugins = with pkgs.vimPlugins; [
    plenary-nvim
    dressing-nvim
    zen-mode-nvim
    vim-visual-multi
  ];
}
