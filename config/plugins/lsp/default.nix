{
  imports = [./servers.nix ./lint.nix];

  plugins = {
    # adds pictograms
    lspkind = import ./lspkind.nix;

    # Diagnostics
    trouble.enable = true;

    lspsaga = import ./lspsaga.nix;
  };

  keymaps = let
    toggle-term = key: mode: {
      inherit mode key;
      options.desc = "Toggle Terminal";
      action = "<cmd>Lspsaga term_toggle<cr>";
    };

    trouble-lsp = key: action: {
      mode = "";
      inherit key;
      options.desc = action;
      action = "<cmd>Trouble lsp_${action}<cr>";
    };
  in [
    {
      mode = "";
      key = "K";
      options.desc = "Hover";
      action = "<cmd>Lspsaga hover_doc<cr>";
    }
    (toggle-term "<c-\\>" "n")
    (toggle-term "<c-\\>" "t")

    (trouble-lsp "gr" "definitions")
    (trouble-lsp "gr" "references")
    (trouble-lsp "gi" "implementations")
  ];
}
