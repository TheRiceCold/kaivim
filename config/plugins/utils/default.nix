{ pkgs, ... }: {
  imports = [
    ./lualine
    ./which-key
    ./mini-files
    ./silicon.nix
    ./grug-far.nix

    ./fzf-lua.nix
  ];

  extraPlugins = let
    builds = import ../builds.nix pkgs;
  in with builds; with pkgs.vimPlugins; [ harpoon2 ];

  plugins = {
    alpha = import ./alpha.nix;
    todo-comments = import ./todo-comments.nix;

    rest.enable = true;
    # neotest.enable = true;
    undotree.enable = true;
    helpview.enable = true;
    # tmux-navigator.enable = true;
    toggleterm = import ./toggleterm.nix;
  };
}
