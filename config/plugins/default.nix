{ pkgs, ... }:
{
  imports = [ ./utils ./extras ];
  extraPlugins = with pkgs.vimPlugins; [ lazygit-nvim plenary-nvim ];
  plugins = {
    lsp = import ./lsp.nix;
    telescope = import ./telescope.nix;

    noice.enable = true;
    lualine.enable = true;
    nvim-cmp.enable = true;
    markdown-preview = {
      enable = true;
      browser = "firefox";
    };

    treesitter = {
      enable = true;
      indent = true;
      folding = false;
      nixGrammars = true;
      nixvimInjections = true;
      ensureInstalled = [ "comment" "markdown_inline" "regex" ];
    };
    treesitter-context.enable = true;
    treesitter-textobjects.enable = true;
    rainbow-delimiters.enable = true;
    ts-autotag.enable = true;
  };

  extraConfigLua = "require('telescope').load_extension('lazygit')";
}
