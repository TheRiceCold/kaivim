{ pkgs, ... }:
{
  plugins = {
    markdown-preview = {
      enable = true;
      settings = {
        auto_close = 0;
        browser = "firefox";
      };
    };
    render-markdown = {
      enable = true;
      settings = {
        pipe_table.border = ["╭" "┬" "╮" "├" "┼" "┤" "╰" "┴" "╯" "│" "─"];
      };
    };
    mkdnflow = {
      enable = true;
    };
  };

  extraPlugins = let
    builds = import ../../builds.nix pkgs;
  in [builds.table-nvim];
}
