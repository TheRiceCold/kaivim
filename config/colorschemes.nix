{
  catppuccin = {
    enable = true;
    flavour = "mocha"; # latte, mocha, frappe, macchiato
    background = { dark = "mocha"; };
    dimInactive.enabled = true;
    integrations = {
      cmp = true;
      noice = true;
      gitsigns = true;
      treesitter = true;
      treesitter_context = true;
      telescope.enabled = true;
      mini.enabled = true;
      native_lsp = { enabled = true; };
    };
  };
}
