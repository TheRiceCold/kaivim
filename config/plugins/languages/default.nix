{
  imports = [ ./vimtex.nix ];

  plugins = {
    markdown-preview = {
      enable = true;
      browser = "firefox";
    };
    typescript-tools = {
      enable = true;
    };
  };
}
