{ pkgs, ... }:
{
  plugins = {
    markdown-preview = {
      enable = true;
      settings = {
        auto_close = 0;
        page_title = "Markdown Preview";
      };
    };
    render-markdown = {
      enable = true;
      settings = {
        pipe_table.border = ["╭" "┬" "╮" "├" "┼" "┤" "╰" "┴" "╯" "│" "─"];
      };
    };
  };

  extraPlugins = let
    builds = import ../../builds.nix pkgs;
  in [builds.table-nvim];
}
