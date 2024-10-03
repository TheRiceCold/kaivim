{
  enable = true;
  settings = {
    flavour = "mocha"; # latte, mocha, frappe, macchiato
    background.dark = "mocha";
    dimInactive.enabled = false;
    integrations = {
      cmp = true;
      noice = true;
      notify = true;
      gitsigns = true;
      grug_far = true;
      markdown = true;
      telescope = true;
      treesitter = true;
      treesitter_context = true;
      mini.enabled = true;
      native_lsp.enabled = true;
    };
  };
}
