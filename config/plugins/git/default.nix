pkgs: build: {
  imports = [ (import ./gh-actions.nix build) ];

  extraPackages = with pkgs; [ delta lazygit ];

  plugins = {
    lazygit.enable = true;
    # fugitive.enable = true;
    diffview.enable = true;
    gitmessenger = {
      enable = true;
      includeDiff = "current";
      noDefaultMappings = true;
    };
    gitsigns = import ./gitsigns.nix;
  };
}
