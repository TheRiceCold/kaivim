{
  plugins.which-key = {
    enable = true;
    settings = {
      preset = "helix"; # "classic" | "modern" | "helix"
      sort = ["manual"];
      win.border = "single";
      icons.mappings = false;
    };
  };

  extraConfigLua = builtins.readFile ./config.lua;
}
