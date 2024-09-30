pkgs: build: {
  imports = [
    ./vimtex.nix
    (import ./typst.nix build)
    (import ./flutter.nix pkgs)
    (import ./markdown.nix pkgs)
    (import ./tailwind.nix pkgs build)
  ];

  plugins = {
    typescript-tools = import ./typescript.nix;
  };
}
