build: {
  imports = [
    ./cmp.nix
    # (import ./chainsaw.nix build)
  ];

  plugins = {
    # adds vscode-like pictograms to neovim built-in lsp
    lspkind = import ./lspkind.nix;
    # copilot-lua = import ./copilot.nix;

    emmet.enable = true;
    # flash.enable = true;
    # luasnip = import ./luasnip.nix pkgs;
  };
}
