{
  imports = [ ./copilot.nix ];

  plugins = {
    cmp = {
      enable = true;
      autoEnableSources = false;
      settings = import ./settings.nix;
    };

    cmp-buffer.enable = true;
    cmp-path.enable = true;
    cmp-cmdline.enable = true;
    cmp_luasnip.enable = true;
    friendly-snippets.enable = true;

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
