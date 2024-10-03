pkgs: build: {
  imports = [
    (import ./docs pkgs build)

    (import ./flutter.nix pkgs)

    (import ./tailwind.nix pkgs build)
  ];
}
