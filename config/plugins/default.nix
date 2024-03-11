{ pkgs, ... }:
{
  imports = [ ./lualine.nix ./utils ./languages ];
  extraPlugins = with pkgs.vimPlugins; [ lazygit-nvim plenary-nvim ];
  plugins = {
    lsp = import ./lsp.nix;
    lspsaga.enable = true;
    telescope = import ./telescope.nix;

    bufferline.enable = true;

    noice.enable = true;
    # fidget.enable = true;

    cmp.enable = true;
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

    dap = {
      enable = true;
    };
  };

  extraConfigLua = "require('telescope').load_extension('lazygit')";
}
