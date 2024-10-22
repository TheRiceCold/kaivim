{ pkgs, ... }: {
  imports = [
    ./lualine
    ./which-key
    ./silicon.nix
    ./grug-far.nix

    # ./fzf-lua.nix
    ./telescope.nix
    /* INFO: fzf-Lua is better for performance
      but telescope has better extensions(like project)
      that fits better for my productive setup and the
      difference in performance is unnoticeable anyway
    */
  ];

  extraPlugins = let
    builds = import ../builds.nix pkgs;
  in
    with pkgs.vimPlugins; [
      builds.incline

      harpoon2
      vim-hexokinase
      range-highlight-nvim
    ];

  plugins = {
    alpha = import ./alpha.nix;
    todo-comments = import ./todo-comments.nix;

    mini.modules = {
      files = {
        mappings = {
          go_in = "<cr>";
          go_out = "-";
          show_help = "?";
        };
        windows = {
          preview = true;
          width_preview = 40;
        };
        options.use_as_default_explorer = false;
      };
      surround = {};
      # cursorword = {};
    };

    rest.enable = true;
    noice.enable = true;
    neotest.enable = true;
    helpview.enable = true;
    undotree.enable = true;
    tmux-navigator.enable = true;
  };

  extraConfigLua = ''
    require'incline'.setup { }
  '';
}
