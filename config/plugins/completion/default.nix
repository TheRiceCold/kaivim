{ pkgs, ... }:
{
  imports = [ ./copilot.nix ];

  plugins = {
    cmp-nvim-lsp.enable = true; # lsp
    cmp-buffer.enable = true;
    copilot-cmp.enable = true;
    cmp-path.enable = true; # file system paths
    cmp_luasnip.enable = true; # snippets
    cmp-cmdline.enable = true;

    cmp = {
      enable = true;
      autoEnableSources = false;
      settings = import ./settings.nix;
    };

    lspkind = {
      enable = true;
      symbolMap = {
        Copilot = "";
      };
      extraOptions = {
        maxwidth = 50;
        ellipsis_char = "...";
      };
    };
  };
}
