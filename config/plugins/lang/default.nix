{
  imports = [ ./vimtex.nix ./flutter.nix ];

  plugins = {
    markdown-preview = {
      enable = true;
      settings = {
        auto_close = 0;
        browser = "firefox";
      };
    };
    typescript-tools = import ./typescript.nix;
  };
}
