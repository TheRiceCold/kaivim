{
  oxocarbon.enable = true;

  poimandres = {
    enable = true;
    settings = {
      dark_variant = "dark";
      disableBackground = true;
    };
  };

  cyberdream = {
    enable = true;
    settings = {
      transparent = true;
      hide_fillchars = true;
      italic_comments = true;
      terminal_colors = false;
      theme = { };
    };
  };

  catppuccin = {
    enable = true;
    settings = {
      flavour = "mocha"; # latte, mocha, frappe, macchiato
      background = { dark = "mocha"; };
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
        native_lsp = { enabled = true; };
      };
    };
  };
}
