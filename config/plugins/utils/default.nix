pkgs: build: {
  imports = [
    ./lualine
    (import ./telescope build)
    (import ./silicon.nix build)
  ];

  extraPlugins = with pkgs.vimPlugins; [
    harpoon2
    glance-nvim
    grug-far-nvim
  ];

  plugins = {
    mini = import ./mini.nix;
    nvim-autopairs = import ./autopairs.nix;

    rest.enable = true;
    neotest.enable = true;
    hardtime.enable = true;
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
