pkgs: build: {
  imports = [
    ./latex.nix
    (import ./typst.nix build)
    (import ./flutter.nix pkgs)
    (import ./markdown.nix pkgs)
    (import ./tailwind.nix pkgs build)
  ];

  plugins = {
    orgmode = import ./orgmode.nix;
  };
}
