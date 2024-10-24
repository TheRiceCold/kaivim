{
  plugins.mini.modules.files = {
    mappings = {
      go_in = "<cr>";
      go_out = "-";
      show_help = "?";
    };
    windows = {
      preview = true;
      width_preview = 40;
    };
    options.use_as_default_explorer = false;
  };

  # extraConfigLua = builtins.readFile ./config.lua;
}
