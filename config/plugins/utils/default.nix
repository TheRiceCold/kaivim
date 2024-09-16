let
  icons = import ../../icons.nix;
in {
  imports = [ ./git.nix ];

  plugins = {
    mini = import ./mini icons;
    # conform-nvim = import ./conform.nix;
    nvim-autopairs = import ./autopairs.nix;
    telescope = import ./telescope.nix icons;

    rest.enable = true;
    emmet.enable = true;
    fzf-lua.enable = true;
    bufferline.enable = true;
    nvim-colorizer.enable = true;

    todo-comments = {
      enable = true;
      settings.keywords = {
        TODO = { icon = ""; color = "info"; };
        DOCS = { icon = ""; color = "info"; };
        NOTE = { icon = ""; color = "hint"; };
        INFO = { icon = ""; color = "hint"; };
      };
    };
  };
}
