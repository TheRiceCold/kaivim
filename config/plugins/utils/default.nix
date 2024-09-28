build: {
  imports = [
    ./git.nix
    ./lualine

    (import ./telescope build)
    (import ./glance.nix build)
    (import ./harpoon.nix build)
    (import ./silicon.nix build)
    (import ./grug-far.nix build)
  ];

  plugins = {
    mini = import ./mini.nix;
    nvim-autopairs = import ./autopairs.nix;

    rest.enable = true;
    neotest.enable = true;
    undotree.enable = true;

    # bufferline = {
    #   enable = true;
    #   settings.options = {
    #     diagnostics = "nvim_lsp";
    #     separator_style = "thick";
    #   };
    # };

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
