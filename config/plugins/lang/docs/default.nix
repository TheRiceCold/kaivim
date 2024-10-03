pkgs: build: {
  imports = [
    ./latex.nix
    (import ./typst.nix build)
    (import ./markdown.nix build)
    (import ./orgmode.nix pkgs build)
  ];

  extraPlugins = with pkgs.vimPlugins; [vim-table-mode];
}
