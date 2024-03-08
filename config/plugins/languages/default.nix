{
  imports = [ ./vimtex.nix ];

  plugins = {
    markdown-preview = {
      enable = true;
      settings = {
        auto_close = false;
        browser = "firefox";
      };
    };
    typescript-tools = {
      enable = true;
    };
  };
}
