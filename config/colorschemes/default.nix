{
  colorscheme = "cyberdream";
  colorschemes = {
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
        terminal_colors = true;
        # borderless_telescope = true;
        # theme = {};
      };
    };

    catppuccin = import ./catppuccin.nix;
  };
}
