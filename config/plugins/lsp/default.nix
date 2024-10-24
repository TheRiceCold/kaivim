{
  imports = [./servers.nix ./lint.nix];

  plugins = {
    # adds pictograms
    lspkind = import ./lspkind.nix;

    # Diagnostics
    trouble.enable = true;
  };

  keymaps = let
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

    (trouble-lsp "gr" "definitions")
    (trouble-lsp "gr" "references")
    (trouble-lsp "gi" "implementations")
  ];
}
